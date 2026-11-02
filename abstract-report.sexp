(interpret-summary
  :config (interpret-config
    :cmd (static-interpreter)
    :analysis (analysis-info
      :name static
      :version 1.0
      :group Hello
      :tags (static python)
      :system Linux-7.0.0-31-generic-x86_64-with-glibc2.43
    )
    :experiments ("jpamb.cases.Arrays.arrayContent!()V" "jpamb.cases.Arrays.arrayContent:()V" "jpamb.cases.Arrays.arrayContentAboveMinus13!()V" "jpamb.cases.Arrays.arrayContentAboveMinus13:()V" "jpamb.cases.Arrays.arrayInBounds!()V" "jpamb.cases.Arrays.arrayInBounds:()V" "jpamb.cases.Arrays.arrayIsNull!()V" "jpamb.cases.Arrays.arrayIsNull:()V" "jpamb.cases.Arrays.arrayIsNullLength!()V" "jpamb.cases.Arrays.arrayIsNullLength:()V" "jpamb.cases.Arrays.arrayLength!()V" "jpamb.cases.Arrays.arrayLength:()V" "jpamb.cases.Arrays.arrayNotEmpty!([I:1])V" "jpamb.cases.Arrays.arrayNotEmpty!([I:])V" "jpamb.cases.Arrays.arrayNotEmpty:([I)V" "jpamb.cases.Arrays.arrayOutOfBounds!()V" "jpamb.cases.Arrays.arrayOutOfBounds:()V" "jpamb.cases.Arrays.arraySometimesNull!(0)V" "jpamb.cases.Arrays.arraySometimesNull!(11)V" "jpamb.cases.Arrays.arraySometimesNull:(I)V" "jpamb.cases.Arrays.arraySpellsHello!([C:'h', 'e', 'l', 'l', 'o'])V" "jpamb.cases.Arrays.arraySpellsHello!([C:'x'])V" "jpamb.cases.Arrays.arraySpellsHello!([C:])V" "jpamb.cases.Arrays.arraySpellsHello:([C)V" "jpamb.cases.Arrays.arraySumIsLarge!([I:50, 100, 200])V" "jpamb.cases.Arrays.arraySumIsLarge!([I:])V" "jpamb.cases.Arrays.arraySumIsLarge:([I)V" "jpamb.cases.Arrays.binarySearch!(3)V" "jpamb.cases.Arrays.binarySearch!(6)V" "jpamb.cases.Arrays.binarySearch:(I)V" "jpamb.cases.Calls.allPrimesArePositive!(-1)V" "jpamb.cases.Calls.allPrimesArePositive!(0)V" "jpamb.cases.Calls.allPrimesArePositive!(100)V" "jpamb.cases.Calls.allPrimesArePositive:(I)V" "jpamb.cases.Calls.callsAssertFalse!()V" "jpamb.cases.Calls.callsAssertFalse:()V" "jpamb.cases.Calls.callsAssertFib!(0)V" "jpamb.cases.Calls.callsAssertFib!(8)V" "jpamb.cases.Calls.callsAssertFib:(I)V" "jpamb.cases.Calls.callsAssertIf!(false)V" "jpamb.cases.Calls.callsAssertIf!(true)V" "jpamb.cases.Calls.callsAssertIf:(Z)V" "jpamb.cases.Calls.callsAssertIfWithTrue!()V" "jpamb.cases.Calls.callsAssertIfWithTrue:()V" "jpamb.cases.Calls.callsAssertTrue!()V" "jpamb.cases.Calls.callsAssertTrue:()V" "jpamb.cases.Dependent.badNormalizedDistance!(0, 0)I" "jpamb.cases.Dependent.badNormalizedDistance!(1, 1)I" "jpamb.cases.Dependent.badNormalizedDistance:(II)I" "jpamb.cases.Dependent.divisionLoop!(0)V" "jpamb.cases.Dependent.divisionLoop!(1)V" "jpamb.cases.Dependent.divisionLoop:(I)V" "jpamb.cases.Dependent.normalizedDistance!(0, 0)I" "jpamb.cases.Dependent.normalizedDistance:(II)I" "jpamb.cases.Dependent.safeDivByN!(0)I" "jpamb.cases.Dependent.safeDivByN!(1)I" "jpamb.cases.Dependent.safeDivByN:(I)I" "jpamb.cases.Loops.forever!()V" "jpamb.cases.Loops.forever:()V" "jpamb.cases.Loops.neverAsserts!()V" "jpamb.cases.Loops.neverAsserts:()V" "jpamb.cases.Loops.neverDivides!()I" "jpamb.cases.Loops.neverDivides:()I" "jpamb.cases.Loops.terminates!()V" "jpamb.cases.Loops.terminates:()V" "jpamb.cases.Simple.assertBoolean!(false)V" "jpamb.cases.Simple.assertBoolean!(true)V" "jpamb.cases.Simple.assertBoolean:(Z)V" "jpamb.cases.Simple.assertFalse!()V" "jpamb.cases.Simple.assertFalse:()V" "jpamb.cases.Simple.assertInteger!(0)V" "jpamb.cases.Simple.assertInteger!(1)V" "jpamb.cases.Simple.assertInteger:(I)V" "jpamb.cases.Simple.assertPositive!(-1)V" "jpamb.cases.Simple.assertPositive!(1)V" "jpamb.cases.Simple.assertPositive:(I)V" "jpamb.cases.Simple.assertTrue!()V" "jpamb.cases.Simple.assertTrue:()V" "jpamb.cases.Simple.checkBeforeAssert!(-1)V" "jpamb.cases.Simple.checkBeforeAssert!(0)V" "jpamb.cases.Simple.checkBeforeAssert:(I)V" "jpamb.cases.Simple.checkBeforeDivideByN!(0)I" "jpamb.cases.Simple.checkBeforeDivideByN!(1)I" "jpamb.cases.Simple.checkBeforeDivideByN2!(0)I" "jpamb.cases.Simple.checkBeforeDivideByN2:(I)I" "jpamb.cases.Simple.checkBeforeDivideByN:(I)I" "jpamb.cases.Simple.divideByN!(0)I" "jpamb.cases.Simple.divideByN!(1)I" "jpamb.cases.Simple.divideByN:(I)I" "jpamb.cases.Simple.divideByNMinus10054203!(0)I" "jpamb.cases.Simple.divideByNMinus10054203!(10054203)I" "jpamb.cases.Simple.divideByNMinus10054203:(I)I" "jpamb.cases.Simple.divideByZero!()I" "jpamb.cases.Simple.divideByZero:()I" "jpamb.cases.Simple.divideZeroByZero!(0, 0)I" "jpamb.cases.Simple.divideZeroByZero!(0, 1)I" "jpamb.cases.Simple.divideZeroByZero:(II)I" "jpamb.cases.Simple.doNothing!()V" "jpamb.cases.Simple.doNothing:()V" "jpamb.cases.Simple.earlyReturn!()I" "jpamb.cases.Simple.earlyReturn:()I" "jpamb.cases.Simple.justAdd!(1, 2)I" "jpamb.cases.Simple.justAdd:(II)I" "jpamb.cases.Simple.justMulitply!(1, 2)I" "jpamb.cases.Simple.justMulitply:(II)I" "jpamb.cases.Simple.justReturn!()I" "jpamb.cases.Simple.justReturn:()I" "jpamb.cases.Simple.justReturnNothing!()V" "jpamb.cases.Simple.justReturnNothing:()V" "jpamb.cases.Simple.multiError!(false)I" "jpamb.cases.Simple.multiError!(true)I" "jpamb.cases.Simple.multiError:(Z)I" "jpamb.cases.Strings.sayHello!(s'hello')V" "jpamb.cases.Strings.sayHello!(s'not hello')V" "jpamb.cases.Strings.sayHello:(Ljava/lang/String;)V" "jpamb.cases.Tricky.collatz!(0)V" "jpamb.cases.Tricky.collatz!(24)V" "jpamb.cases.Tricky.collatz:(I)V")
    :timeout 2.0
    :max_steps 100
    :abstract true
  )
  :results ((interpret-result
      :experiment "jpamb.cases.Arrays.arrayContent!()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arrayContent:()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arrayContentAboveMinus13!()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arrayContentAboveMinus13:()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arrayInBounds!()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arrayInBounds:()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arrayIsNull!()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arrayIsNull:()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arrayIsNullLength!()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arrayIsNullLength:()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arrayLength!()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arrayLength:()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arrayNotEmpty!([I:1])V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arrayNotEmpty!([I:])V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arrayNotEmpty:([I)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arrayOutOfBounds!()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arrayOutOfBounds:()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arraySometimesNull!(0)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arraySometimesNull!(11)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arraySometimesNull:(I)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arraySpellsHello!([C:'h', 'e', 'l', 'l', 'o'])V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arraySpellsHello!([C:'x'])V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arraySpellsHello!([C:])V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arraySpellsHello:([C)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arraySumIsLarge!([I:50, 100, 200])V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arraySumIsLarge!([I:])V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.arraySumIsLarge:([I)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.binarySearch!(3)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.binarySearch!(6)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Arrays.binarySearch:(I)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Calls.allPrimesArePositive!(-1)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Calls.allPrimesArePositive!(0)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Calls.allPrimesArePositive!(100)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Calls.allPrimesArePositive:(I)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Calls.callsAssertFalse!()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Calls.callsAssertFalse:()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Calls.callsAssertFib!(0)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Calls.callsAssertFib!(8)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Calls.callsAssertFib:(I)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Calls.callsAssertIf!(false)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Calls.callsAssertIf!(true)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Calls.callsAssertIf:(Z)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Calls.callsAssertIfWithTrue!()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Calls.callsAssertIfWithTrue:()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Calls.callsAssertTrue!()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Calls.callsAssertTrue:()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Dependent.badNormalizedDistance!(0, 0)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Dependent.badNormalizedDistance!(1, 1)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Dependent.badNormalizedDistance:(II)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Dependent.divisionLoop!(0)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Dependent.divisionLoop!(1)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Dependent.divisionLoop:(I)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Dependent.normalizedDistance!(0, 0)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Dependent.normalizedDistance:(II)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Dependent.safeDivByN!(0)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Dependent.safeDivByN!(1)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Dependent.safeDivByN:(I)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Loops.forever!()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Loops.forever:()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Loops.neverAsserts!()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Loops.neverAsserts:()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Loops.neverDivides!()I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Loops.neverDivides:()I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Loops.terminates!()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Loops.terminates:()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.assertBoolean!(false)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.assertBoolean!(true)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.assertBoolean:(Z)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.assertFalse!()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.assertFalse:()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.assertInteger!(0)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.assertInteger!(1)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.assertInteger:(I)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.assertPositive!(-1)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.assertPositive!(1)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.assertPositive:(I)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.assertTrue!()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.assertTrue:()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.checkBeforeAssert!(-1)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.checkBeforeAssert!(0)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.checkBeforeAssert:(I)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.checkBeforeDivideByN!(0)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.checkBeforeDivideByN!(1)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.checkBeforeDivideByN2!(0)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.checkBeforeDivideByN2:(I)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.checkBeforeDivideByN:(I)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.divideByN!(0)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.divideByN!(1)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.divideByN:(I)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.divideByNMinus10054203!(0)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.divideByNMinus10054203!(10054203)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.divideByNMinus10054203:(I)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.divideByZero!()I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.divideByZero:()I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.divideZeroByZero!(0, 0)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.divideZeroByZero!(0, 1)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.divideZeroByZero:(II)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.doNothing!()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.doNothing:()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.earlyReturn!()I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.earlyReturn:()I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.justAdd!(1, 2)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.justAdd:(II)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.justMulitply!(1, 2)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.justMulitply:(II)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.justReturn!()I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.justReturn:()I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.justReturnNothing!()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.justReturnNothing:()V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.multiError!(false)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.multiError!(true)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Simple.multiError:(Z)I"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Strings.sayHello!(s'hello')V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Strings.sayHello!(s'not hello')V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Strings.sayHello:(Ljava/lang/String;)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Tricky.collatz!(0)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Tricky.collatz!(24)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ) (interpret-result
      :experiment "jpamb.cases.Tricky.collatz:(I)V"
      :response -
      :duration (duration
        :absolute 0
        :relative 0
      )
      :calibrates ()
    ))
)