import Exemplo2
import Test.HUnit

-- 1ºforma de fazer
testsDiv = TestLabel "Testes sobre a mydiv "
           (TestList 
            [TestCase (assertEqual "mydiv 1 3" 0.33 (mydiv 1 3)),
             TestCase (assertEqual "mydiv 5 0" 0 (mydiv 5 0)),
             TestCase (assertEqual "mydiv 15 3" 5 (mydiv 15 3))
            ])

testsDiv1 = TestLabel "Testes sobre mydiv1"
            (TestList
            [TestCase (assertEqual "mydiv 15 3" 5 (mydiv 15 3))
            ]) 

-- 2ºforma de fazer 
testesDiv = "Tests sobre a mydiv"
     ~: TestList 
      [ "teste sobre mydiv 1 3" ~: (1/3) ~=? mydiv 1 3, 
        "teste sobre mydiv 5 0" ~: 0 ~=? mydiv 5 0,
        "teste sobre mydiv 15 3" ~: (15/3) ~=? mydiv 15 3
      ]

testesDiv1 = "Tests sobre a mydiv1"
      ~: TestList
      ["teste sobre mydiv1 5 0" ~: 0 ~=? mydiv1 5 0]

