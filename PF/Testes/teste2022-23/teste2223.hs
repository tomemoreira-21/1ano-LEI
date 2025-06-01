import Test.HUnit 

-- testes 1)  
m1 = ["Prog","Func"]
m2 = ["Funcional"]
m3 = ["Ola","Tome","Lindo"]
testes1 = TestLabel "Testes sobre o exercício 1"
         (TestList 
         [TestCase (assertEqual "t1" "Prog\nFunc" (unlines' m1)),  
          TestCase (assertEqual "t2" "Funcional" (unlines' m2)),
          TestCase (assertEqual "t3" "Ola\nTome\nLindo" (unlines' m3))           
         ])
         
-- 1
unlines' :: [String] -> String
unlines' [] = [] 
unlines' [x] = x 
unlines' (h:t) = h ++ "\n" ++ unlines' t 


