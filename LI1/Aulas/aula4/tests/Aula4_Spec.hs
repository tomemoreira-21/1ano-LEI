module Aula4_Spec where 
import Test.HUnit 
import Aula4
import Test.HUnit (Test(TestCase))

m1 = [[1,2,3],[4,5,6],[7,8,9]]
m2 = [[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]]
m3 = [[1,2],[3,4],[5,6]]
m4 = [[9,8,7,6],[2,4,10,4],[1,2,9,11]]

tests = TestLabel "Tests sobre a trocaPU"
        (TestList 
         [TestCase (assertEqual "m1" [[7,8,9],[4,5,6],[1,2,3]] (trocaPU m1)),
         TestCase (assertEqual "m2" [[0,0,0,1],[0,1,0,0],[0,0,1,0],[1,0,0,0]] (trocaPU m2)),  
         TestCase (assertEqual "m3" [[5,6],[3,4],[1,2]] (trocaPU m3))
         ])

tests2 = TestLabel "Testes sobre posicao de um elemento "
        (TestList
         [TestCase (assertEqual "m1" (1,0) (posicao_elemento 2 m1)),
         TestCase (assertEqual "m4" (0,2)  (posicao_elemento 1 m4)),  
         TestCase (assertEqual "m3" (1,2) (posicao_elemento 6 m3))
        ])


