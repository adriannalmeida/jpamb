

import sys
from collections import deque
from collections.abc import Iterable
from dataclasses import dataclass

from abstractions import SignSet

import jpamb
import sexpr
from jpamb import jvm
from jvm.state import PC, StackInt


_INTEGER_COMPARISONS = {
    jvm.CmpOpr.Eq: int.__eq__,
    jvm.CmpOpr.Ne: int.__ne__,
    jvm.CmpOpr.Lt: int.__lt__,
    jvm.CmpOpr.Le: int.__le__,
    jvm.CmpOpr.Gt: int.__gt__,
    jvm.CmpOpr.Ge: int.__ge__,
}


@dataclass(frozen=True)
class AbstractValue:
    signs: SignSet
    integers: frozenset[int] | None = None
    array_lengths: frozenset[int] | None = None
    array_ids: frozenset[PC] | None = frozenset()

    def __or__(self, other):
        def join_facts(left, right):
            if left is None or right is None:
                return None
            values = left | right
            return values if len(values) <= 32 else None

        array_ids = (
            None
            if self.array_ids is None or other.array_ids is None
            else self.array_ids | other.array_ids
        )
        return AbstractValue(
            self.signs | other.signs,
            join_facts(self.integers, other.integers),
            join_facts(self.array_lengths, other.array_lengths),
            array_ids,
        )

    def __str__(self):
        return str(self.signs)

    def __sexpr__(self):
        return self.signs.__sexpr__()


@dataclass(frozen=True)
class State(sexpr.AsSExpr):
    locals: tuple[AbstractValue, ...]
    stack: tuple[AbstractValue, ...]
    heap: tuple[tuple[PC, tuple[AbstractValue, ...] | None], ...] = ()
    non_singleton_arrays: frozenset[PC] = frozenset()

    def __post_init__(self):
        assert isinstance(self.locals, tuple)
        assert isinstance(self.stack, tuple)

    def __str__(self):
        return f"{', '.join(map(str, self.locals))}/{':'.join(map(str, self.stack))}"

    def __sexpr__(self):
        return sexpr.data("state", locals=self.locals, stack=self.stack)

    def __or__(self, other):
        assert isinstance(other, State), f"Expected State but got {other!r}"
        assert len(self.stack) == len(other.stack), "Stacks should be equal lenght"
        assert len(self.locals) == len(other.locals), "Locals should be equal lenght"

        left_heap = dict(self.heap)
        right_heap = dict(other.heap)
        heap = {}
        for array_id in left_heap.keys() | right_heap.keys():
            if array_id not in left_heap:
                heap[array_id] = right_heap[array_id]
            elif array_id not in right_heap:
                heap[array_id] = left_heap[array_id]
            else:
                heap[array_id] = _join_array_elements(
                    left_heap[array_id], right_heap[array_id]
                )

        return State(
            tuple(v1 | v2 for v1, v2 in zip(self.locals, other.locals)),
            tuple(v1 | v2 for v1, v2 in zip(self.stack, other.stack)),
            _ordered_heap(heap),
            self.non_singleton_arrays | other.non_singleton_arrays,
        )

    def push(self, value: AbstractValue | SignSet):
        if isinstance(value, SignSet):
            value = AbstractValue(value)
        assert isinstance(value, AbstractValue), (
            f"Expected abstract value but got {value}"
        )
        return State(
            self.locals,
            self.stack + (value,),
            self.heap,
            self.non_singleton_arrays,
        )

    def pop(self, number=1):
        return self.stack[-number:], State(
            self.locals,
            self.stack[:-number],
            self.heap,
            self.non_singleton_arrays,
        )

    def load(self, index) -> AbstractValue:
        return self.locals[index]

    def store(self, index, value: AbstractValue):
        return State(
            tuple(self.locals[:index]) + (value,) + tuple(self.locals[index + 1 :]),
            self.stack,
            self.heap,
            self.non_singleton_arrays,
        )


def _ordered_heap(
    heap: dict[PC, tuple[AbstractValue, ...] | None],
) -> tuple[tuple[PC, tuple[AbstractValue, ...] | None], ...]:
    return tuple(
        sorted(
            heap.items(),
            key=lambda item: (
                item[0].method.encode() if item[0].method is not None else "",
                item[0].offset,
            ),
        )
    )


def _join_array_elements(
    left: tuple[AbstractValue, ...] | None,
    right: tuple[AbstractValue, ...] | None,
) -> tuple[AbstractValue, ...] | None:
    if left is None or right is None:
        return None
    return tuple(
        left[i] | right[i]
        if i < len(left) and i < len(right)
        else left[i] if i < len(left) else right[i]
        for i in range(max(len(left), len(right)))
    )


def _update_array_elements(
    state: State,
    array: AbstractValue,
    index: AbstractValue,
    value: AbstractValue,
) -> State:
    heap = dict(state.heap)
    if array.array_ids is None:
        array_ids = heap.keys()
    else:
        array_ids = array.array_ids

    indices = index.integers
    strong_update = (
        array.array_ids is not None
        and len(array.array_ids) == 1
        and indices is not None
        and len(indices) == 1
        and not (array.array_ids & state.non_singleton_arrays)
    )

    for array_id in array_ids:
        elements = heap.get(array_id)
        if elements is None:
            continue
        positions = indices if indices is not None else range(len(elements))
        updated = list(elements)
        for position in positions:
            if position < 0 or position >= len(updated):
                continue
            if strong_update:
                updated[position] = value
            else:
                updated[position] = updated[position] | value
        heap[array_id] = tuple(updated)

    return State(
        state.locals,
        state.stack,
        _ordered_heap(heap),
        state.non_singleton_arrays,
    )


def _load_array_elements(
    state: State, array: AbstractValue, index: AbstractValue
) -> AbstractValue:
    if array.array_ids is None or index.integers is None:
        return AbstractValue(SignSet.top(), None, frozenset())

    heap = dict(state.heap)
    result: AbstractValue | None = None
    for array_id in array.array_ids:
        elements = heap.get(array_id)
        if elements is None:
            return AbstractValue(SignSet.top(), None, frozenset())
        for position in index.integers:
            if position < 0 or position >= len(elements):
                continue
            element = elements[position]
            result = element if result is None else result | element

    return result or AbstractValue(SignSet.top(), None, frozenset())


def _wrap_int32(value: int) -> int:
    return ((value + 2**31) % 2**32) - 2**31


def _exact_arithmetic(
    left: frozenset[int] | None,
    right: frozenset[int] | None,
    opr: jvm.BinaryOpr,
) -> frozenset[int] | None:
    if left is None or right is None or len(left) * len(right) > 32:
        return None

    results = set()
    for x in left:
        for y in right:
            match opr:
                case jvm.BinaryOpr.Add:
                    value = x + y
                case jvm.BinaryOpr.Sub:
                    value = x - y
                case jvm.BinaryOpr.Mul:
                    value = x * y
                case jvm.BinaryOpr.Div:
                    if y == 0:
                        continue
                    value = abs(x) // abs(y)
                    if (x < 0) != (y < 0):
                        value = -value
                case jvm.BinaryOpr.Rem:
                    if y == 0:
                        continue
                    quotient = abs(x) // abs(y)
                    if (x < 0) != (y < 0):
                        quotient = -quotient
                    value = x - quotient * y
                case _:
                    return None

            results.add(_wrap_int32(value))

    return frozenset(results)


def _exact_comparison(
    left: AbstractValue, right: AbstractValue, opr: jvm.CmpOpr
) -> frozenset[bool] | None:
    if left.integers is None or right.integers is None:
        return None
    if not left.integers or not right.integers:
        return None

    compare = _INTEGER_COMPARISONS[opr]
    return frozenset(
        compare(left_value, right_value)
        for left_value in left.integers
        for right_value in right.integers
    )


def _array_access_outcomes(
    array: AbstractValue, index: AbstractValue
) -> tuple[bool, bool, bool]:
    """Return whether null, bounds-error, and normal outcomes are possible."""
    null_error = 0 in array.signs.signs
    if not any(sign != 0 for sign in array.signs.signs):
        return null_error, False, False

    if array.array_lengths is None or index.integers is None:
        return null_error, True, True

    bounds_error = False
    normal = False
    for length in array.array_lengths:
        for value in index.integers:
            if 0 <= value < length:
                normal = True
            else:
                bounds_error = True

    return null_error, bounds_error, normal


def abstract_push_value(value) -> SignSet:
    match value:
        case bool() as b:
            return SignSet.abstract([StackInt(int(b))])
        case int() as i:
            return SignSet.abstract([StackInt(i)])
        case str():
            return SignSet.top()
        case StackInt() as v:
            return SignSet.abstract([v])
        case None:
            return SignSet.top()
        case _:
            return SignSet.top()


def manystep(
    bc: jpamb.Bytecode,
    pc: PC,
    state: State,
    *,
    _call_stack: frozenset[jvm.AbsMethodID] = frozenset(),
) -> Iterable[tuple[PC, object] | str]:
    opr = bc[pc]
    match opr:
        case jvm.Push(type=t, value=v):
            match t:
                case jvm.Int() | jvm.Boolean():
                    value = int(v)
                    va = AbstractValue(
                        abstract_push_value(value),
                        frozenset({value}),
                        frozenset(),
                    )
                case jvm.Char():
                    value = ord(v)
                    va = AbstractValue(
                        abstract_push_value(value),
                        frozenset({value}),
                        frozenset(),
                    )
                case jvm.Reference() | jvm.Object() | jvm.Array():
                    if v == 0:
                        va = AbstractValue(
                            SignSet.abstract([StackInt(0)]),
                            frozenset(),
                            frozenset(),
                        )
                    else:
                        va = AbstractValue(SignSet.top(), frozenset(), None)
                case _:
                    raise NotImplementedError(f"Unhandled push type {t!r}")
            yield (pc + 1, state.push(va))

        case jvm.Get(static=True, field=field):
            # Hack - Only handle the assertion case; everything else is treated as a constant 0.
            if field.extension.name != "$assertionsDisabled":
                va = SignSet.abstract([StackInt(0)])
            else:
                va = SignSet.abstract([StackInt(0)])
            yield (
                pc + 1,
                state.push(AbstractValue(va, frozenset({0}), frozenset())),
            )

        case jvm.Ifz(condition=op, target=target):
            [val], after = state.pop(1)
            zero = AbstractValue(
                SignSet.abstract([StackInt(0)]),
                frozenset({0}),
                frozenset(),
            )
            results = _exact_comparison(val, zero, op)
            if results is None:
                results = SignSet.compare(val.signs, zero.signs, op)
            for res in results:
                match res:
                    case True:
                        yield (pc % target, after)
                    case False:
                        yield (pc + 1, after)
                    case err:
                        yield err

        case jvm.If(condition=op, target=target):
            [v2, v1], after = state.pop(2)
            results = _exact_comparison(v1, v2, op)
            if results is None:
                results = SignSet.compare(v1.signs, v2.signs, op)
            for res in results:
                match res:
                    case True:
                        yield (pc % target, after)
                    case False:
                        yield (pc + 1, after)
                    case err:
                        yield err

        case jvm.Load(type=t, index=i):
            va = state.load(i)
            yield (pc + 1, state.push(va))

        case jvm.Store(type=t, index=i):
            [value], after = state.pop(1)
            yield (pc + 1, after.store(i, value))

        case jvm.Goto(target=t):
            yield (pc % t, state)

        case jvm.Binary(type=t, operant=op):
            [v1, v2], after = state.pop(2)

            if t is not None and not isinstance(t, jvm.Int):
                # keep the abstract interpreter conservative for non-int values
                yield (
                    pc + 1,
                    after.push(
                        AbstractValue(SignSet.top(), frozenset(), frozenset())
                    ),
                )
            else:
                result, errors = SignSet.arithmetic(v1.signs, v2.signs, op)
                for error in errors:
                    yield error
                if result.signs:
                    yield (
                        pc + 1,
                        after.push(
                            AbstractValue(
                                result,
                                _exact_arithmetic(v1.integers, v2.integers, op),
                                frozenset(),
                            )
                        ),
                    )

        case jvm.Return(type=None):
            yield "ok"

        case jvm.Return(type=t):
            # Hack -- we assume that we always return.
            yield "ok"

        case jvm.New(classname=jvm.ClassName("java.lang.AssertionError")):
            # Hack -- if we create an assertion error, we probably also throw it.
            yield "assertion error"

        case jvm.NewArray(type=t, dim=d):
            [count], after = state.pop(1)
            lengths = (
                count.integers
                if count.integers is not None
                and all(length >= 0 for length in count.integers)
                else None
            )
            array_id = pc
            elements = (
                tuple(
                    AbstractValue(
                        SignSet.abstract([StackInt(0)]),
                        frozenset({0}),
                        frozenset(),
                    )
                    for _ in range(next(iter(lengths)))
                )
                if lengths is not None
                and len(lengths) == 1
                and next(iter(lengths)) <= 32
                else None
            )
            heap = dict(after.heap)
            non_singleton_arrays = after.non_singleton_arrays
            if array_id in heap:
                non_singleton_arrays |= {array_id}
                heap[array_id] = _join_array_elements(heap[array_id], elements)
            else:
                heap[array_id] = elements
            yield (
                pc + 1,
                State(
                    after.locals,
                    after.stack
                    + (
                        AbstractValue(
                            SignSet.from_sign("+"),
                            frozenset(),
                            lengths,
                            frozenset({array_id}),
                        ),
                    ),
                    _ordered_heap(heap),
                    non_singleton_arrays,
                ),
            )

        case jvm.Dup():
            [value], after = state.pop(1)
            yield (pc + 1, after.push(value).push(value))

        case jvm.ArrayStore(type=t):
            [array, index, _value], after = state.pop(3)
            null_error, bounds_error, normal = _array_access_outcomes(array, index)
            if null_error:
                yield "null pointer"
            if bounds_error:
                yield "out of bounds"
            if normal:
                yield (
                    pc + 1,
                    _update_array_elements(after, array, index, _value),
                )

        case jvm.ArrayLoad(type=t):
            [array, index], after = state.pop(2)
            null_error, bounds_error, normal = _array_access_outcomes(array, index)
            if null_error:
                yield "null pointer"
            if bounds_error:
                yield "out of bounds"
            if normal:
                element = _load_array_elements(state, array, index)
                if isinstance(t, jvm.Reference):
                    element = AbstractValue(SignSet.top(), None, frozenset())
                yield (
                    pc + 1,
                    after.push(element),
                )

        case jvm.ArrayLength():
            [ref], after = state.pop(1)
            if 0 in ref.signs.signs:
                yield "null pointer"
            if any(sign != 0 for sign in ref.signs.signs):
                lengths = ref.array_lengths
                length_signs = (
                    SignSet.abstract(StackInt(length) for length in lengths)
                    if lengths is not None
                    else SignSet.top()
                )
                yield (
                    pc + 1,
                    after.push(
                        AbstractValue(length_signs, lengths, frozenset())
                    ),
                )

        case jvm.Negate(type=jvm.Int()):
            [value], after = state.pop(1)
            negated = SignSet(frozenset(-sign for sign in value.signs.signs))
            integers = (
                frozenset(_wrap_int32(-number) for number in value.integers)
                if value.integers is not None
                else None
            )
            yield (
                pc + 1,
                after.push(AbstractValue(negated, integers, frozenset())),
            )

        case jvm.Cast(from_=jvm.Int(), to_=jvm.Short()):
            [value], after = state.pop(1)
            casted = (
                value.signs
                if value.signs.signs == frozenset({0})
                else SignSet.top()
            )
            integers = frozenset({0}) if value.integers == frozenset({0}) else None
            yield (
                pc + 1,
                after.push(AbstractValue(casted, integers, frozenset())),
            )

        case jvm.InvokeVirtual(method=method) if (
            method.classname.dotted() == "java.lang.String"
            and method.extension.name == "equals"
        ):
            _, after = state.pop(2)
            yield (
                pc + 1,
                after.push(
                    AbstractValue(
                        SignSet.from_sign("0+"),
                        frozenset({0, 1}),
                        frozenset(),
                    )
                ),
            )

        case jvm.InvokeStatic(method=method):
            yield from _invoke_method(
                bc,
                pc,
                state,
                method,
                has_receiver=False,
                call_stack=_call_stack,
            )

        case jvm.InvokeVirtual(method=method):
            yield from _invoke_method(
                bc,
                pc,
                state,
                method,
                has_receiver=True,
                call_stack=_call_stack,
            )

        case jvm.InvokeInterface(method=method):
            yield from _invoke_method(
                bc,
                pc,
                state,
                method,
                has_receiver=True,
                call_stack=_call_stack,
            )

        case jvm.Incr(index=i, amount=a):
            va = state.load(i)
            new_val, _ = SignSet.arithmetic(
                va.signs, SignSet.abstract([StackInt(a)]), jvm.BinaryOpr.Add
            )
            exact = _exact_arithmetic(
                va.integers, frozenset({a}), jvm.BinaryOpr.Add
            )
            yield (
                pc + 1,
                state.store(i, AbstractValue(new_val, exact, frozenset())),
            )

        case a:
            raise NotImplementedError(f"To do:{a}")


def _invoke_method(
    bc: jpamb.Bytecode,
    pc: PC,
    state: State,
    method: jvm.AbsMethodID,
    *,
    has_receiver: bool,
    call_stack: frozenset[jvm.AbsMethodID],
) -> Iterable[tuple[PC, State] | str]:
    params = method.extension.params
    argument_count = len(params) + int(has_receiver)
    arguments, caller_state = (
        state.pop(argument_count) if argument_count else ((), state)
    )
    active_calls = call_stack | {pc.method}

    if method in active_calls:
        yield from _recursive_call_fallback(pc, caller_state, method)
        return

    callee_method = bc.getmethod(method)
    locals_ = [
        AbstractValue(SignSet.bot(), frozenset(), frozenset())
        for _ in range(callee_method.max_locals)
    ]
    local_index = 0
    for argument, parameter_type in zip(
        arguments,
        ((None,) if has_receiver else ()) + tuple(params),
    ):
        if local_index < len(locals_):
            locals_[local_index] = argument
        local_index += 2 if isinstance(parameter_type, (jvm.Long, jvm.Double)) else 1

    entry = PC(method, 0)
    initial = State(
        tuple(locals_),
        (),
        caller_state.heap,
        caller_state.non_singleton_arrays,
    )
    states = {entry: initial}
    worklist = deque([entry])

    while worklist:
        callee_pc = worklist.pop()
        callee_state = states[callee_pc]
        for result in manystep(
            bc,
            callee_pc,
            callee_state,
            _call_stack=active_calls,
        ):
            if isinstance(result, str):
                if result != "ok":
                    yield result
                    continue

                opcode = bc[callee_pc]
                if not isinstance(opcode, jvm.Return):
                    yield result
                    continue
                return_value = (
                    callee_state.stack[-1:]
                    if opcode.type is not None
                    else ()
                )
                yield (
                    pc + 1,
                    State(
                        caller_state.locals,
                        caller_state.stack + return_value,
                        callee_state.heap,
                        callee_state.non_singleton_arrays,
                    ),
                )
                continue

            next_pc, next_state = result
            previous = states.get(next_pc)
            joined = next_state if previous is None else previous | next_state
            if previous is None or joined != previous:
                states[next_pc] = joined
                worklist.append(next_pc)


def _recursive_call_fallback(
    pc: PC, caller_state: State, method: jvm.AbsMethodID
) -> Iterable[tuple[PC, State] | str]:
    # A recursive summary must allow both termination and any queried error.
    for error in jpamb.QUERIES:
        if error not in {"*", "ok"}:
            yield error

    return_value = (
        (
            AbstractValue(
                SignSet.top(),
                None,
                None,
                None
                if isinstance(
                    method.extension.return_type,
                    (jvm.Reference, jvm.Object, jvm.Array),
                )
                else frozenset(),
            ),
        )
        if method.extension.return_type is not None
        else ()
    )
    heap = _ordered_heap({array_id: None for array_id, _ in caller_state.heap})
    yield (
        pc + 1,
        State(
            caller_state.locals,
            caller_state.stack + return_value,
            heap,
            caller_state.non_singleton_arrays,
        ),
    )


def initialstate(
    bc: jpamb.Bytecode,
    methodid: jvm.AbsMethodID,
    inputs: jpamb.Input | None,
) -> dict[PC, State]:
    method = bc.getmethod(methodid)
    locals = [
        AbstractValue(SignSet.bot(), frozenset(), frozenset())
        for _ in range(method.max_locals)
    ]

    if inputs is None:
        for i, p in enumerate(methodid.extension.params):
            array_ids = None if isinstance(p, jvm.Array) else frozenset()
            locals[i] = AbstractValue(SignSet.top(), array_ids=array_ids)
    else:
        heap: dict[PC, tuple[AbstractValue, ...] | None] = {}
        for i, x in enumerate(inputs.values):
            match x:
                case jpamb.case.Boolean(value=value):
                    integer = int(value)
                    locals[i] = AbstractValue(
                        SignSet.abstract([StackInt(integer)]),
                        frozenset({integer}),
                        frozenset(),
                    )
                case jpamb.case.Int(value=value):
                    integer = int(value)
                    locals[i] = AbstractValue(
                        SignSet.abstract([StackInt(integer)]),
                        frozenset({integer}),
                        frozenset(),
                    )
                case jpamb.case.Array(values=values):
                    array_id = PC(methodid, -(i + 1))
                    elements = (
                        tuple(
                            AbstractValue(
                                SignSet.abstract(
                                    [
                                        StackInt(
                                            ord(value)
                                            if isinstance(value, str)
                                            else int(value)
                                        )
                                    ]
                                ),
                                frozenset(
                                    {
                                        ord(value)
                                        if isinstance(value, str)
                                        else int(value)
                                    }
                                ),
                                frozenset(),
                            )
                            for value in values
                        )
                        if len(values) <= 32
                        else None
                    )
                    heap[array_id] = elements
                    locals[i] = AbstractValue(
                        SignSet.from_sign("+"),
                        frozenset(),
                        frozenset({len(values)}),
                        frozenset({array_id}),
                    )
                case jpamb.case.String():
                    locals[i] = AbstractValue(SignSet.top(), frozenset(), None)
                case _:
                    raise NotImplementedError(f"Unsupported value {x!r}")

    state = State(
        tuple(locals),
        (),
        _ordered_heap(heap if inputs is not None else {}),
    )
    return {PC(methodid, 0): state}


@dataclass
class AbstractInterpreter:
    bc: jpamb.Bytecode
    worklist: deque[PC]
    states: dict[PC, State]

    @staticmethod
    def initial(bc: jpamb.Bytecode, methodid: jvm.AbsMethodID, inputs):
        states = initialstate(bc, methodid, inputs)
        worklist = deque(states.keys())

        return AbstractInterpreter(bc, worklist, states)

    def step(self) -> tuple[PC, set[str]]:
        pc = self.worklist.pop()

        print(f"Stepping {pc}:\n > {self.bc[pc]}", file=sys.stderr)

        finals = set()

        for res in manystep(self.bc, pc, self.states[pc]):
            if isinstance(res, str):
                finals.add(res)
            else:
                pc_, st = res

                before = self.states.get(pc_, None)
                if before is None:
                    after = st
                else:
                    after = before | st
                if before is None or after != before:
                    self.states[pc_] = after
                    self.worklist.append(pc_)

        return pc, finals

    def closed_loop(self) -> PC | None:
        edges: dict[PC, set[PC]] = {}
        exits: dict[PC, bool] = {}

        for pc, state in self.states.items():
            edges[pc] = set()
            exits[pc] = False
            for result in manystep(self.bc, pc, state):
                if isinstance(result, str):
                    exits[pc] = True
                else:
                    edges[pc].add(result[0])

        index = 0
        indices: dict[PC, int] = {}
        lowlinks: dict[PC, int] = {}
        stack: list[PC] = []
        on_stack: set[PC] = set()
        closed_cycle: PC | None = None

        def visit(pc: PC) -> None:
            nonlocal index, closed_cycle
            indices[pc] = index
            lowlinks[pc] = index
            index += 1
            stack.append(pc)
            on_stack.add(pc)

            for successor in edges[pc]:
                if successor not in indices:
                    visit(successor)
                    lowlinks[pc] = min(lowlinks[pc], lowlinks[successor])
                elif successor in on_stack:
                    lowlinks[pc] = min(lowlinks[pc], indices[successor])

            if lowlinks[pc] != indices[pc]:
                return

            component = set()
            while True:
                member = stack.pop()
                on_stack.remove(member)
                component.add(member)
                if member == pc:
                    break

            cyclic = len(component) > 1 or pc in edges[pc]
            closed = all(
                not exits[member]
                and edges[member] <= component
                for member in component
            )
            if cyclic and closed:
                closed_cycle = pc

        for pc in edges:
            if pc not in indices:
                visit(pc)
            if closed_cycle is not None:
                return closed_cycle

        return None


def interpret():
    """The static analysis"""
    methodid, input, steps = jpamb.getcase(
        "static",
        "1.0",
        "Hello",
        ["static", "python"],
        for_science=True,
    )
    suite, eff = jpamb.setup()
    bc = jpamb.Bytecode(suite, eff, {})

    ai = AbstractInterpreter.initial(bc, methodid, input)

    x = jpamb.emit_init(ai.states)

    while steps > 0 and ai.worklist:
        pc, final = ai.step()
        for f in final:
            jpamb.emit_step(x, pc, f, depth=1)
            steps -= 1

        x = jpamb.emit_step(x, pc, ai.states, depth=1)
        steps -= 1

    if steps > 0 and (loop_pc := ai.closed_loop()) is not None:
        jpamb.emit_step(x, loop_pc, "*", depth=1)


def analyse():
    """The static analysis"""

    methodid = jpamb.getmethodid(
        "static",
        "1.0",
        "Hello",
        ["static", "python"],
        for_science=True,
    )

    suite, eff = jpamb.setup()
    bc = jpamb.Bytecode(suite, eff, {})

    steps = 300

    ai = AbstractInterpreter.initial(bc, methodid, None)

    final = set()
    while steps > 0 and ai.worklist:
        _pc, finals = ai.step()
        final |= finals
        steps -= 1

    for f in jpamb.QUERIES:
        if f not in final:
            print(f"{f};no")
        else:
            print(f"{f};maybe")
