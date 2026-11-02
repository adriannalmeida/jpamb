import random
import sys

import jpamb
import jvm
import jvm.state as jvmc


def int32(value: int) -> int:
    """Wrap a result to a signed JVM int."""
    return (value + (1 << 31)) % (1 << 32) - (1 << 31)


def binary(op, v1: int, v2: int) -> int | str:
    match op:
        case jvm.BinaryOpr.Div | jvm.BinaryOpr.Rem:
            if v2 == 0:
                return "divide by zero"
            # Integer division truncates towards zero, including negative inputs.
            quotient = abs(v1) // abs(v2)
            if (v1 < 0) != (v2 < 0):
                quotient = -quotient
            value = quotient if op == jvm.BinaryOpr.Div else v1 - quotient * v2
        case jvm.BinaryOpr.Add:
            value = v1 + v2
        case jvm.BinaryOpr.Sub:
            value = v1 - v2
        case jvm.BinaryOpr.Mul:
            value = v1 * v2
        case _:
            raise NotImplementedError(f"Unhandled binary {op!r}")
    return int32(value)


def compare(op, v1: int, v2: int) -> bool:
    match op:
        case jvm.CmpOpr.Eq:
            return v1 == v2
        case jvm.CmpOpr.Ne:
            return v1 != v2
        case jvm.CmpOpr.Lt:
            return v1 < v2
        case jvm.CmpOpr.Le:
            return v1 <= v2
        case jvm.CmpOpr.Gt:
            return v1 > v2
        case jvm.CmpOpr.Ge:
            return v1 >= v2
        case _:
            raise NotImplementedError(f"Unhandled comparation {op!r}")


def step(bc: jpamb.Bytecode, state: jvmc.State) -> tuple[jvmc.PC, jvmc.State | str]:
    assert isinstance(state, jvmc.State), f"expected state but got {state}"
    frame = state.frames.peek()
    pc = frame.pc
    opr = bc[pc]
    output = state
    print(f"Stepping {pc}:\n > {opr}", file=sys.stderr)
    match opr:
        case jvm.Push(type=t, value=v):
            if isinstance(t, jvm.Int):
                frame.stack.push(jvmc.StackInt(v))
            elif isinstance(t, jvm.Reference):
                assert isinstance(v, int)
                frame.stack.push(jvmc.StackReference(v))
            elif t == jvm.Object(jvm.ClassName("java.lang.String")):
                frame.stack.push(state.heap.new(jvmc.HeapString(v)))
            else:
                raise NotImplementedError(opr.help())
            frame.pc += 1

        case jvm.Negate(type=jvm.Int()):
            value = frame.stack.pop()
            assert isinstance(value, jvmc.StackInt)
            frame.stack.push(jvmc.StackInt(int32(-value.value)))
            frame.pc += 1

        case jvm.Cast(from_=jvm.Int(), to_=target):
            value = frame.stack.pop()
            assert isinstance(value, jvmc.StackInt)
            match target:
                case jvm.Short():
                    result = (value.value + (1 << 15)) % (1 << 16) - (1 << 15)
                case jvm.Byte():
                    result = (value.value + 128) % 256 - 128
                case jvm.Char():
                    result = value.value % (1 << 16)
                case _:
                    raise NotImplementedError(opr.help())
            frame.stack.push(jvmc.StackInt(result))
            frame.pc += 1

        case jvm.Binary(type=jvm.Int(), operant=op):
            v2, v1 = frame.stack.pop(), frame.stack.pop()
            assert isinstance(v1, jvmc.StackInt), f"expected int, but got {v1}"
            assert isinstance(v2, jvmc.StackInt), f"expected int, but got {v2}"

            value = binary(op, v1.value, v2.value)

            if isinstance(value, str):
                output = value
            else:
                frame.stack.push(jvmc.StackInt(value))
                frame.pc += 1
        case jvm.Ifz(condition=op, target=target):
            value = frame.stack.pop()
            assert isinstance(value, jvmc.StackInt), f"expected int, but got {value}"

            if compare(op, value.value, 0):
                frame.pc %= target
            else:
                frame.pc += 1

        case jvm.Return(type=jvm.Reference()):
            value = frame.stack.pop()
            assert isinstance(value, jvmc.StackReference)

            state.frames.pop()
            if state.frames:
                caller = state.frames.peek()
                caller.stack.push(value)
                caller.pc += 1
            else:
                output = "ok"
        case jvm.Return(type=jvm.Int()):
            value = frame.stack.pop()
            assert isinstance(value, jvmc.StackInt)

            state.frames.pop()
            if state.frames:
                caller = state.frames.peek()
                caller.stack.push(value)
                caller.pc += 1
            else:
                output = "ok"
        case jvm.Return(type=None):
            state.frames.pop()
            if state.frames:
                frame = state.frames.peek()
                frame.pc += 1
            else:
                output = "ok"

        case jvm.Get(static=True, field=field):
            # Hack - Only handle the assertion case
            assert field.extension.name == "$assertionsDisabled"

            # Hack - Assuming assertions are never disabled
            frame.stack.push(jvmc.StackInt(0))
            frame.pc += 1

        case jvm.New(classname=jvm.ClassName("java.lang.AssertionError")):
            # Hack -- if we create an assertion error, we probably also throw it.
            output = "assertion error"
        
        case jvm.Load(index=n):
            value = frame.locals[n]
            frame.stack.push(value)
            frame.pc += 1
        
        case jvm.If(condition = op, target=target):
            v1 = frame.stack.pop()
            v2 = frame.stack.pop()
            assert isinstance(v1, jvmc.StackInt), f"expected int, but got {v1}"
            assert isinstance(v2, jvmc.StackInt), f"expected int, but got {v2}"

            if compare(op, v2.value, v1.value):
                frame.pc %= target
            else:
                frame.pc += 1
                #output = "ok"

        case jvm.NewArray(type=jvm.Int()):
            v1 = frame.stack.pop()
            assert isinstance(v1, jvmc.StackInt), f"expected int, but got {v1}"

            ref = state.heap.new(jvmc.HeapArray(jvm.Int(), [0] * v1.value))
            frame.stack.push(ref)
            frame.pc += 1
        
        case jvm.Dup(words=1):
            v = frame.stack.pop()
            frame.stack.push(v)
            frame.stack.push(v)
            frame.pc += 1
        
        case jvm.ArrayStore(type=jvm.Int()):
            v = frame.stack.pop()
            index = frame.stack.pop()
            arrayR = frame.stack.pop()

            assert isinstance(v, jvmc.StackInt)
            assert isinstance(index, jvmc.StackInt)
            assert isinstance(arrayR, jvmc.StackReference)
            
            if arrayR.value == 0:
                output = "null pointer"
            else:
                array = state.heap[arrayR]
                assert isinstance(array, jvmc.HeapArray)
                if index.value < 0 or index.value >= len(array.values):
                    output = "out of bounds"
                else:
                    array.values[index.value] = v.value
                    frame.pc += 1

        

        case jvm.Store(index=n):
            v = frame.stack.pop()
            frame.locals[n] = v
            frame.pc += 1
        
        case jvm.ArrayLength():
            arrayR = frame.stack.pop()
            assert isinstance(arrayR, jvmc.StackReference)
            try:
                array = state.heap[arrayR]
            except IndexError:
                output = "null pointer"
            else:
            #array = state.heap[arrayR]
                assert isinstance(array, jvmc.HeapArray)
                frame.stack.push(jvmc.StackInt(len(array.values)))
            frame.pc += 1
        
        case jvm.ArrayLoad(type=t):
            index = frame.stack.pop()
            arrayR = frame.stack.pop()

            assert isinstance(index, jvmc.StackInt)
            assert isinstance(arrayR, jvmc.StackReference)

            if arrayR.value == 0:
                output = "null pointer"
            else:
                array = state.heap[arrayR]
                assert isinstance(array, jvmc.HeapArray)

                if index.value < 0 or index.value >= len(array.values):
                    output = "out of bounds"
                else:
                    value = array.values[index.value]

                    match t:
                        case jvm.Int():
                            frame.stack.push(jvmc.StackInt(value))
                        case jvm.Char():
                            frame.stack.push(jvmc.StackInt(value))
                        case _:
                             raise NotImplementedError("Error Array Load")

                    frame.pc += 1
  
        
        case jvm.Incr(index=n, amount=a):
            v = frame.locals[n]
            assert isinstance(v, jvmc.StackInt)
            frame.locals[n] = jvmc.StackInt(int32(v.value + a))
            frame.pc += 1
        
        case jvm.Goto(target=target):
            frame.pc %= target
        
        case jvm.InvokeVirtual(method=method):
            args = [frame.stack.pop() for _ in method.extension.params][::-1]
            receiver = frame.stack.pop()
            assert isinstance(receiver, jvmc.StackReference)
            if receiver.value == 0:
                output = "null pointer"
            elif (method.classname == jvm.ClassName("java.lang.String")
                  and method.extension.name == "equals" and len(args) == 1):
                string = state.heap[receiver]
                assert isinstance(string, jvmc.HeapString)
                other = args[0]
                assert isinstance(other, jvmc.StackReference)
                equal = False
                if other.value != 0:
                    obj = state.heap[other]
                    equal = isinstance(obj, jvmc.HeapString) and string.content == obj.content
                frame.stack.push(jvmc.StackInt(int(equal)))
                frame.pc += 1
            else:
                raise NotImplementedError(opr.help())

        case jvm.InvokeStatic(method=method):
            new_frame = jvmc.Frame.from_method(bc.getmethod(method))

            caller = state.frames.peek()

            for index in reversed(range(len(method.extension.params))):
                new_frame.locals[index] = caller.stack.pop()
            state.frames.push(new_frame)


        case a:
            raise NotImplementedError(a.help())

    assert isinstance(output, (jvmc.State, str))

    return pc, output


def initial(bc: jpamb.Bytecode, methodid: jvm.AbsMethodID, input: jpamb.Input):
    frame = jvmc.Frame.from_method(bc.getmethod(methodid))
    state = jvmc.State(jvmc.Heap(), jvmc.CallStack.from_frames([frame]))
    for i, v in enumerate(input.values):
        # Convert arbitrary values into local values
        match v:
            case jpamb.case.Boolean(value):
                frame.locals[i] = jvmc.StackInt(1 if value else 0)
            case jpamb.case.Int(value):
                frame.locals[i] = jvmc.StackInt(value)
            case jpamb.case.Array(contains=type, values=values):
                match type:
                    case jvm.Char():
                        ref = state.heap.new(
                            jvmc.HeapArray(type, [ord(a) for a in values])
                        )
                    case jvm.Int():
                        ref = state.heap.new(jvmc.HeapArray(type, [a for a in values]))
                frame.locals[i] = ref
            case jpamb.case.String(value=value):
                ref = state.heap.new(jvmc.HeapString(value))
                frame.locals[i] = ref
            case a:
                raise NotImplementedError(
                    f"Do not know how to convert values of type {a!r} to a local value"
                )

    return state


def interpret():
    """The entry point for the interpreter"""

    methodid, input, max_steps = jpamb.getcase(
        "dynamic",
        "1.0",
        "Hello",
        ["dynamic", "python"],
        for_science=True,
    )

    suite, eff = jpamb.setup()
    bc = jpamb.Bytecode(suite, eff, {})

    state = initial(bc, methodid, input)

    last = jpamb.emit_init(state)

    for x in range(max_steps):
        pc, state = step(bc, state)
        last = jpamb.emit_step(last, pc, state)

        if isinstance(state, str):
            break


def fuzz_input(rand: random.Random, methodid: jvm.AbsMethodID) -> jpamb.case.Input:
    input = []
    # 1. come up with possible inputs
    for p in methodid.extension.params:
        match p:
            case jvm.Int():
                input.append(jpamb.case.Int(rand.randint(-1, 8)))
            case jvm.Boolean():
                input.append(jpamb.case.Boolean(1 == rand.randint(0, 1)))
            
            case jvm.Array(contains=jvm.Int()):
                length = rand.randint(0, 8)
                values = tuple(rand.randint(-20, 20) for _ in range(length))
                input.append(jpamb.case.Array(jvm.Int(), values))
            case jvm.Array(contains=jvm.Char()):
                choices = [(), ("x",), tuple("hello")]
                values = rand.choice(choices)
                input.append(jpamb.case.Array(jvm.Char(), values))
                        
            
            
            case jvm.Object(name=jvm.ClassName("java.lang.String")):
                input.append(jpamb.case.String(rand.choice(["", "hello", "not hello"])))
            case a:
                raise NotImplementedError(f"Don't know how to create random values for {a!r}")

    return jpamb.case.Input(input)


def analyse():
    """The dynamic analysis, e.g. in this case a (dumb) fuzzer."""

    methodid = jpamb.getmethodid(
        "dynamic",
        "1.0",
        "Hello",
        ["dynamic", "python"],
        for_science=True,
    )

    suite, eff = jpamb.setup()
    bc = jpamb.Bytecode(suite, eff, {})

    MAX_STEPS = 200

    import random

    # Make the randomness deterministic
    rand = random.Random(0)

    behaviors = set()
    timed_out = False
    # Try 10 random inputs
    for i in range(10):
        input = fuzz_input(rand, methodid)
        state = initial(bc, methodid, input)

        for x in range(MAX_STEPS):
            _, state = step(bc, state)
            if isinstance(state, str):
                behaviors.add(state)
                break
        else:
            timed_out = True

    for query in jpamb.QUERIES:
        prediction = "found" if query in behaviors else "not-found"
        if query == "*" and timed_out:
            prediction = "timeout"
        print(f"{query};{prediction}")
