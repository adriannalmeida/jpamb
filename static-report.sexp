(analysis-summary
  :config (analysis-config
    :cmd (dynamic-analysis)
    :analysis (analysis-info
      :name dynamic
      :version 1.0
      :group Hello
      :tags (dynamic python)
      :system Linux-7.0.0-31-generic-x86_64-with-glibc2.43
    )
    :experiments (
      :"jpamb.cases.Arrays.arrayContent:()V" ()
      :"jpamb.cases.Arrays.arrayContentAboveMinus13:()V" ()
      :"jpamb.cases.Arrays.arrayInBounds:()V" ()
      :"jpamb.cases.Arrays.arrayIsNull:()V" ()
      :"jpamb.cases.Arrays.arrayIsNullLength:()V" ()
      :"jpamb.cases.Arrays.arrayLength:()V" ()
      :"jpamb.cases.Arrays.arrayNotEmpty:([I)V" ()
      :"jpamb.cases.Arrays.arrayOutOfBounds:()V" ()
      :"jpamb.cases.Arrays.arraySometimesNull:(I)V" ()
      :"jpamb.cases.Arrays.arraySpellsHello:([C)V" ()
      :"jpamb.cases.Arrays.arraySumIsLarge:([I)V" ()
      :"jpamb.cases.Arrays.binarySearch:(I)V" ()
      :"jpamb.cases.Calls.allPrimesArePositive:(I)V" ()
      :"jpamb.cases.Calls.callsAssertFalse:()V" ()
      :"jpamb.cases.Calls.callsAssertFib:(I)V" ()
      :"jpamb.cases.Calls.callsAssertIf:(Z)V" ()
      :"jpamb.cases.Calls.callsAssertIfWithTrue:()V" ()
      :"jpamb.cases.Calls.callsAssertTrue:()V" ()
      :"jpamb.cases.Dependent.badNormalizedDistance:(II)I" ()
      :"jpamb.cases.Dependent.divisionLoop:(I)V" ()
      :"jpamb.cases.Dependent.normalizedDistance:(II)I" ()
      :"jpamb.cases.Dependent.safeDivByN:(I)I" ()
      :"jpamb.cases.Loops.forever:()V" ()
      :"jpamb.cases.Loops.neverAsserts:()V" ()
      :"jpamb.cases.Loops.neverDivides:()I" ()
      :"jpamb.cases.Loops.terminates:()V" ()
      :"jpamb.cases.Simple.assertBoolean:(Z)V" ()
      :"jpamb.cases.Simple.assertFalse:()V" ()
      :"jpamb.cases.Simple.assertInteger:(I)V" ()
      :"jpamb.cases.Simple.assertPositive:(I)V" ()
      :"jpamb.cases.Simple.assertTrue:()V" ()
      :"jpamb.cases.Simple.checkBeforeAssert:(I)V" ()
      :"jpamb.cases.Simple.checkBeforeDivideByN2:(I)I" ()
      :"jpamb.cases.Simple.checkBeforeDivideByN:(I)I" ()
      :"jpamb.cases.Simple.divideByN:(I)I" ()
      :"jpamb.cases.Simple.divideByNMinus10054203:(I)I" ()
      :"jpamb.cases.Simple.divideByZero:()I" ()
      :"jpamb.cases.Simple.divideZeroByZero:(II)I" ()
      :"jpamb.cases.Simple.doNothing:()V" ()
      :"jpamb.cases.Simple.earlyReturn:()I" ()
      :"jpamb.cases.Simple.justAdd:(II)I" ()
      :"jpamb.cases.Simple.justMulitply:(II)I" ()
      :"jpamb.cases.Simple.justReturn:()I" ()
      :"jpamb.cases.Simple.justReturnNothing:()V" ()
      :"jpamb.cases.Simple.multiError:(Z)I" ()
      :"jpamb.cases.Strings.sayHello:(Ljava/lang/String;)V" ()
      :"jpamb.cases.Tricky.collatz:(I)V" ()
    )
    :iterations 3
    :timeout 5.0
  )
  :results (
    :"jpamb.cases.Arrays.arrayContent:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 82160509
          :relative 1.381531604649829
        )
        :calibrates (3501154 3324771)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 74471185
          :relative 1.4579469765145794
        )
        :calibrates (2549483 2639369)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 75384363
          :relative 1.4606853585570754
        )
        :calibrates (2548250 2671214)
      ))
    :"jpamb.cases.Arrays.arrayContentAboveMinus13:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 76762228
          :relative 1.3866505868561
        )
        :calibrates (3205387 3097318)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 74926205
          :relative 1.4608395101403142
        )
        :calibrates (2546138 2639763)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 88047092
          :relative 1.5217412766828065
        )
        :calibrates (2562512 2734168)
      ))
    :"jpamb.cases.Arrays.arrayInBounds:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 73711071
          :relative 1.3769430062794097
        )
        :calibrates (3002288 3186701)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 71902974
          :relative 1.4445609142601457
        )
        :calibrates (2546459 2620273)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 68269538
          :relative 1.4105501231572104
        )
        :calibrates (2651806 2653456)
      ))
    :"jpamb.cases.Arrays.arrayIsNull:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 71875724
          :relative 1.3730600487708362
        )
        :calibrates (3030068 3059019)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 71203625
          :relative 1.4422303801767935
        )
        :calibrates (2544339 2599670)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 67441674
          :relative 1.4051129321607974
        )
        :calibrates (2576449 2730506)
      ))
    :"jpamb.cases.Arrays.arrayIsNullLength:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 76687809
          :relative 1.4026099213201209
        )
        :calibrates (3018350 3051059)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 71068782
          :relative 1.4305456039330968
        )
        :calibrates (2604863 2669418)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 70008279
          :relative 1.418226000088946
        )
        :calibrates (2682783 2662287)
      ))
    :"jpamb.cases.Arrays.arrayLength:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 68955311
          :relative 1.3571310413474347
        )
        :calibrates (3003559 3056358)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 75228235
          :relative 1.4500192001563854
        )
        :calibrates (2551882 2786279)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 69648136
          :relative 1.4243258411674875
        )
        :calibrates (2579888 2663520)
      ))
    :"jpamb.cases.Arrays.arrayNotEmpty:([I)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 71678603
          :relative 1.3695454989364042
        )
        :calibrates (3003935 3117793)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 67033819
          :relative 1.4038792050961177
        )
        :calibrates (2625367 2664500)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 68813845
          :relative 1.413144622395619
        )
        :calibrates (2552958 2762751)
      ))
    :"jpamb.cases.Arrays.arrayOutOfBounds:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" found
          )
        )
        :duration (duration
          :absolute 77998754
          :relative 1.4030413179443204
        )
        :calibrates (3031881 3135153)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" found
          )
        )
        :duration (duration
          :absolute 71005925
          :relative 1.4247859305442696
        )
        :calibrates (2692362 2647606)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" found
          )
        )
        :duration (duration
          :absolute 72756971
          :relative 1.4353328518269022
        )
        :calibrates (2695772 2644603)
      ))
    :"jpamb.cases.Arrays.arraySometimesNull:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" found
          )
        )
        :duration (duration
          :absolute 77784541
          :relative 1.4114389172383046
        )
        :calibrates (2984625 3047695)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" found
          )
        )
        :duration (duration
          :absolute 65471515
          :relative 1.40027909106827
        )
        :calibrates (2573825 2635762)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" found
          )
        )
        :duration (duration
          :absolute 67818469
          :relative 1.402749647189446
        )
        :calibrates (2704214 2661510)
      ))
    :"jpamb.cases.Arrays.arraySpellsHello:([C)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" found
          )
        )
        :duration (duration
          :absolute 71826076
          :relative 1.3733102805315163
        )
        :calibrates (3008466 3072910)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" found
          )
        )
        :duration (duration
          :absolute 76388010
          :relative 1.4694665256699129
        )
        :calibrates (2550594 2632495)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" found
          )
        )
        :duration (duration
          :absolute 73977729
          :relative 1.451035480196962
        )
        :calibrates (2604281 2632875)
      ))
    :"jpamb.cases.Arrays.arraySumIsLarge:([I)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 77580308
          :relative 1.4079977380461093
        )
        :calibrates (2997887 3066456)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 72884653
          :relative 1.4462902045890123
        )
        :calibrates (2555018 2661442)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 80995219
          :relative 1.4617524776401754
        )
        :calibrates (2546499 3047687)
      ))
    :"jpamb.cases.Arrays.binarySearch:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 71518015
          :relative 1.3698075152793945
        )
        :calibrates (3028922 3075407)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 72472646
          :relative 1.424011470800512
        )
        :calibrates (2597900 2862100)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 79449275
          :relative 1.4804601983187307
        )
        :calibrates (2548752 2707301)
      ))
    :"jpamb.cases.Calls.allPrimesArePositive:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* timeout
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 74873656
          :relative 1.3922017549384633
        )
        :calibrates (2990778 3078783)
      ) (analysis-result
        :response (response
          :predictions (
            :* timeout
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 77686507
          :relative 1.464802652641774
        )
        :calibrates (2669318 2658789)
      ) (analysis-result
        :response (response
          :predictions (
            :* timeout
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 77808420
          :relative 1.4642319975655522
        )
        :calibrates (2572257 2771228)
      ))
    :"jpamb.cases.Calls.callsAssertFalse:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 74514435
          :relative 1.3801076905180027
        )
        :calibrates (3009137 3201880)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 69599195
          :relative 1.401765555635739
        )
        :calibrates (2640387 2878718)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 71576757
          :relative 1.4354750630719049
        )
        :calibrates (2580876 2671151)
      ))
    :"jpamb.cases.Calls.callsAssertFib:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* timeout
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 72871097
          :relative 1.3651507539239316
        )
        :calibrates (3049634 3237237)
      ) (analysis-result
        :response (response
          :predictions (
            :* timeout
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 77101745
          :relative 1.4600471330110714
        )
        :calibrates (2584007 2762216)
      ) (analysis-result
        :response (response
          :predictions (
            :* timeout
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 84252028
          :relative 1.5109318555420423
        )
        :calibrates (2588098 2608014)
      ))
    :"jpamb.cases.Calls.callsAssertIf:(Z)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 66360999
          :relative 1.3108862929984704
        )
        :calibrates (3227738 3259452)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 69934460
          :relative 1.4159272418096174
        )
        :calibrates (2717682 2650089)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 73561562
          :relative 1.4566221834580064
        )
        :calibrates (2552105 2589027)
      ))
    :"jpamb.cases.Calls.callsAssertIfWithTrue:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 75646624
          :relative 1.3862694168581906
        )
        :calibrates (3121419 3095141)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 74457338
          :relative 1.4471722635982702
        )
        :calibrates (2569315 2748892)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 79365672
          :relative 1.485843663998973
        )
        :calibrates (2549483 2636356)
      ))
    :"jpamb.cases.Calls.callsAssertTrue:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 68945237
          :relative 1.3256616427162073
        )
        :calibrates (3339676 3174697)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 70177214
          :relative 1.424037673245158
        )
        :calibrates (2622988 2663758)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 66827375
          :relative 1.4087317507004125
        )
        :calibrates (2557583 2657397)
      ))
    :"jpamb.cases.Dependent.badNormalizedDistance:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 66776595
          :relative 1.3115958159291705
        )
        :calibrates (3401096 3116065)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 76154104
          :relative 1.4669918179685293
        )
        :calibrates (2553940 2642806)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 73065727
          :relative 1.4481213489791152
        )
        :calibrates (2571868 2635549)
      ))
    :"jpamb.cases.Dependent.divisionLoop:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 80681269
          :relative 1.4049650482020388
        )
        :calibrates (3166031 3184904)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 79642730
          :relative 1.4870898688172958
        )
        :calibrates (2544917 2644114)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 73805204
          :relative 1.455078748763336
        )
        :calibrates (2566694 2609830)
      ))
    :"jpamb.cases.Dependent.normalizedDistance:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 81327866
          :relative 1.423636418805937
        )
        :calibrates (3030507 3101928)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 80200652
          :relative 1.4817231611158508
        )
        :calibrates (2551058 2739296)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 77577468
          :relative 1.4762937501335167
        )
        :calibrates (2544492 2637203)
      ))
    :"jpamb.cases.Dependent.safeDivByN:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 85067447
          :relative 1.4009655679485054
        )
        :calibrates (3064059 3694091)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 78603626
          :relative 1.4787188830406255
        )
        :calibrates (2568134 2652866)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 75984790
          :relative 1.4708621580194252
        )
        :calibrates (2561624 2577564)
      ))
    :"jpamb.cases.Loops.forever:()V" ((analysis-result
        :response (response
          :predictions (
            :* timeout
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 77457445
          :relative 1.3571120840500872
        )
        :calibrates (3506121 3301276)
      ) (analysis-result
        :response (response
          :predictions (
            :* timeout
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 74988883
          :relative 1.4543647911367148
        )
        :calibrates (2582982 2685216)
      ) (analysis-result
        :response (response
          :predictions (
            :* timeout
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 79186145
          :relative 1.4843929469292283
        )
        :calibrates (2549941 2641480)
      ))
    :"jpamb.cases.Loops.neverAsserts:()V" ((analysis-result
        :response (response
          :predictions (
            :* timeout
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 75226166
          :relative 1.3790122492820118
        )
        :calibrates (3192264 3093914)
      ) (analysis-result
        :response (response
          :predictions (
            :* timeout
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 70377475
          :relative 1.430219900943475
        )
        :calibrates (2587142 2639753)
      ) (analysis-result
        :response (response
          :predictions (
            :* timeout
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 79278662
          :relative 1.4817327009702508
        )
        :calibrates (2547659 2681762)
      ))
    :"jpamb.cases.Loops.neverDivides:()I" ((analysis-result
        :response (response
          :predictions (
            :* timeout
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 74670280
          :relative 1.3791175065063663
        )
        :calibrates (3032330 3205884)
      ) (analysis-result
        :response (response
          :predictions (
            :* timeout
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 78264383
          :relative 1.4756728297422188
        )
        :calibrates (2563623 2671433)
      ) (analysis-result
        :response (response
          :predictions (
            :* timeout
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 75723030
          :relative 1.457267637390348
        )
        :calibrates (2613367 2670968)
      ))
    :"jpamb.cases.Loops.terminates:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 76526396
          :relative 1.3853251634107575
        )
        :calibrates (3251168 3051379)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 81238605
          :relative 1.4823166796888214
        )
        :calibrates (2559315 2792188)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 71343809
          :relative 1.4276947691675812
        )
        :calibrates (2620531 2709031)
      ))
    :"jpamb.cases.Simple.assertBoolean:(Z)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 80607493
          :relative 1.4133631097274288
        )
        :calibrates (3001807 3221802)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 77392630
          :relative 1.456707774932479
        )
        :calibrates (2724697 2683118)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 64758302
          :relative 1.3960669482513433
        )
        :calibrates (2560142 2642914)
      ))
    :"jpamb.cases.Simple.assertFalse:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 79873698
          :relative 1.3956627352138364
        )
        :calibrates (3240159 3183331)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 70618714
          :relative 1.4144970205230047
        )
        :calibrates (2560458 2877712)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 72735448
          :relative 1.4479776026094553
        )
        :calibrates (2549533 2636061)
      ))
    :"jpamb.cases.Simple.assertInteger:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 78309032
          :relative 1.4036910730965428
        )
        :calibrates (3066642 3115668)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 68475598
          :relative 1.3989541276446555
        )
        :calibrates (2775118 2690153)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 79762679
          :relative 1.4788073800070372
        )
        :calibrates (2545655 2751252)
      ))
    :"jpamb.cases.Simple.assertPositive:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 82122197
          :relative 1.4260204047121516
        )
        :calibrates (3023773 3134659)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 67237287
          :relative 1.399682942312171
        )
        :calibrates (2573013 2784426)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 71442099
          :relative 1.4244654077613559
        )
        :calibrates (2713636 2663101)
      ))
    :"jpamb.cases.Simple.assertTrue:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 75761901
          :relative 1.387970385204636
        )
        :calibrates (3147359 3054337)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 68879376
          :relative 1.4176093159780228
        )
        :calibrates (2592822 2673530)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 64965464
          :relative 1.3946681150050275
        )
        :calibrates (2597613 2638927)
      ))
    :"jpamb.cases.Simple.checkBeforeAssert:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 75714565
          :relative 1.3498176148827132
        )
        :calibrates (3715110 3051822)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 73409758
          :relative 1.4466268008954906
        )
        :calibrates (2580872 2669100)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 83044818
          :relative 1.5004144188085544
        )
        :calibrates (2550881 2696325)
      ))
    :"jpamb.cases.Simple.checkBeforeDivideByN2:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 80163822
          :relative 1.4103856351427773
        )
        :calibrates (3052598 3179335)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 71398886
          :relative 1.4343793491859127
        )
        :calibrates (2610530 2641680)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 68313181
          :relative 1.4075164358823877
        )
        :calibrates (2690000 2655866)
      ))
    :"jpamb.cases.Simple.checkBeforeDivideByN:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 83422364
          :relative 1.4238458873436477
        )
        :calibrates (3185075 3102260)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 78287402
          :relative 1.4778570629637615
        )
        :calibrates (2552963 2657362)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 69138175
          :relative 1.4232205286467297
        )
        :calibrates (2581241 2637039)
      ))
    :"jpamb.cases.Simple.divideByN:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 67645457
          :relative 1.2669597335886706
        )
        :calibrates (4242860 3073733)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 72709862
          :relative 1.437025109260792
        )
        :calibrates (2587674 2728488)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 80853249
          :relative 1.490958889332462
        )
        :calibrates (2549282 2671897)
      ))
    :"jpamb.cases.Simple.divideByNMinus10054203:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 67686292
          :relative 1.3356504235388442
        )
        :calibrates (3049563 3200441)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 68204966
          :relative 1.4174512957444454
        )
        :calibrates (2563896 2652790)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 75564899
          :relative 1.4561240344459438
        )
        :calibrates (2622080 2665124)
      ))
    :"jpamb.cases.Simple.divideByZero:()I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 77600675
          :relative 1.4006741068500923
        )
        :calibrates (3095835 3073259)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 68391223
          :relative 1.417821405244793
        )
        :calibrates (2551112 2675364)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 67996824
          :relative 1.4163230259468695
        )
        :calibrates (2566719 2647576)
      ))
    :"jpamb.cases.Simple.divideZeroByZero:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 77347004
          :relative 1.4033177168804762
        )
        :calibrates (3053602 3058010)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 69185946
          :relative 1.4049711991613458
        )
        :calibrates (2761386 2684602)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 75261365
          :relative 1.4602038099643146
        )
        :calibrates (2619529 2597200)
      ))
    :"jpamb.cases.Simple.doNothing:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 73352723
          :relative 1.3799379307043034
        )
        :calibrates (3021683 3094892)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 67835583
          :relative 1.4111721718887118
        )
        :calibrates (2579685 2684309)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 81611382
          :relative 1.1299467623779027
        )
        :calibrates (2543395 9557959)
      ))
    :"jpamb.cases.Simple.earlyReturn:()I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 74364318
          :relative 1.3679291210768283
        )
        :calibrates (3054923 3319861)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 66242542
          :relative 1.4012359030750454
        )
        :calibrates (2604924 2654414)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 83270185
          :relative 0.9078105559822209
        )
        :calibrates (6384414 14208081)
      ))
    :"jpamb.cases.Simple.justAdd:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 73353429
          :relative 1.3699134087132512
        )
        :calibrates (3011544 3247918)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 73122604
          :relative 1.4474371833175321
        )
        :calibrates (2574087 2645600)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 74563994
          :relative 0.9055960688247016
        )
        :calibrates (9003707 9530034)
      ))
    :"jpamb.cases.Simple.justMulitply:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 68184162
          :relative 1.3298361245891026
        )
        :calibrates (3176727 3204106)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 73613684
          :relative 1.4462032332577714
        )
        :calibrates (2548829 2720864)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 80116311
          :relative 0.8099816218164413
        )
        :calibrates (10609897 14208248)
      ))
    :"jpamb.cases.Simple.justReturn:()I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 65923002
          :relative 1.3194195098000612
        )
        :calibrates (3243958 3075029)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 75350601
          :relative 1.46225855148895
        )
        :calibrates (2563283 2634979)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 78368869
          :relative 0.9123961903724053
        )
        :calibrates (9590498 9586357)
      ))
    :"jpamb.cases.Simple.justReturnNothing:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 70754718
          :relative 1.3624069349562973
        )
        :calibrates (3064246 3078725)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 76079986
          :relative 1.4629643256423908
        )
        :calibrates (2551426 2688632)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 78531468
          :relative 0.7954668448602704
        )
        :calibrates (10935720 14218269)
      ))
    :"jpamb.cases.Simple.multiError:(Z)I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 72908093
          :relative 1.380119714148595
        )
        :calibrates (3006401 3070554)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 74700168
          :relative 1.461011002001972
        )
        :calibrates (2544267 2623948)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 78093126
          :relative 0.8039873410010443
        )
        :calibrates (9789645 14737978)
      ))
    :"jpamb.cases.Strings.sayHello:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 71949423
          :relative 1.3745318325860671
        )
        :calibrates (3007736 3066973)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 72044680
          :relative 1.4438057644916917
        )
        :calibrates (2550295 2635629)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 78449244
          :relative 0.909254209819769
        )
        :calibrates (9736410 9599497)
      ))
    :"jpamb.cases.Tricky.collatz:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* timeout
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 73362395
          :relative 1.4138782430960115
        )
        :calibrates (3022147 2635362)
      ) (analysis-result
        :response (response
          :predictions (
            :* timeout
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 73736173
          :relative 1.4530102715488296
        )
        :calibrates (2558940 2637433)
      ) (analysis-result
        :response (response
          :predictions (
            :* timeout
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 80946612
          :relative 0.9056577057528182
        )
        :calibrates (10749459 9367900)
      ))
  )
)