"""Run with: PYTHONPATH=solutions/dynamic/src python -m unittest discover -s solutions/dynamic/tests."""
import contextlib
import io
import unittest

import dynamic
import jpamb
import jvm


class ArithmeticTests(unittest.TestCase):
    def test_signed_division_and_remainder(self):
        for left, right, quotient, remainder in [
            (-7, 3, -2, -1), (7, -3, -2, 1), (-7, -3, 2, -1)
        ]:
            self.assertEqual(dynamic.binary(jvm.BinaryOpr.Div, left, right), quotient)
            self.assertEqual(dynamic.binary(jvm.BinaryOpr.Rem, left, right), remainder)

    def test_overflow(self):
        self.assertEqual(dynamic.binary(jvm.BinaryOpr.Add, 2147483647, 1), -2147483648)
        self.assertEqual(dynamic.binary(jvm.BinaryOpr.Div, -2147483648, -1), -2147483648)
        self.assertEqual(dynamic.int32(-(-2147483648)), -2147483648)

    def test_zero_divisor(self):
        for op in (jvm.BinaryOpr.Div, jvm.BinaryOpr.Rem):
            self.assertEqual(dynamic.binary(op, 1, 0), "divide by zero")


class BenchmarkTests(unittest.TestCase):
    def test_stored_concrete_cases(self):
        suite, eff = jpamb.setup()
        if not suite.benchmark_file.exists():
            self.skipTest("Requires the compiled benchmark in target/stats")
        bc = jpamb.Bytecode(suite, eff)
        for experiment, control in suite.benchmark(eff=eff).experiments.items():
            if experiment.input is None:
                continue
            with self.subTest(experiment=str(experiment)):
                state = dynamic.initial(bc, experiment.entry, experiment.input)
                with contextlib.redirect_stderr(io.StringIO()):
                    for _ in range(200000):
                        _, state = dynamic.step(bc, state)
                        if isinstance(state, str):
                            break
                outcome = state if isinstance(state, str) else "*"
                self.assertIn(outcome, control.results)


if __name__ == "__main__":
    unittest.main()
