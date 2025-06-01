import Test.HUnit 

-- minha função soma 
mysum :: Int -> Int -> Int 
mysum x y = x + y 

-- os meus testes 

-- assertEqual :: (Eq a, Show a) => String -> a -> a -> Assertion
-- String -> corresponde à mensagem que aparece se der erro 
-- primeiro a -> valor esperado 
-- segundo a -> valor resultante 

test1 = TestCase (assertEqual "Test: mysum 1 2" 3 (mysum 1 2))
test2 = TestCase (assertEqual "for 5+5," 10 (mysum 5 5))
test3 = TestCase (assertEqual "for 100+100," 100 (mysum 100 100))

-- comando para correr um a um é o runTestTT 

-- comando para correr todos os testes de uma só vez 
--            runTestTT (TestList [t1,t2,t3])

-- testes com label 
tests = TestList [
    TestLabel "Teste 1 (1,2)" test1,
    TestLabel "Teste 2 (5,5)" test2,
    TestLabel "Teste 3 (100,100)" test3 ]

-- pode ser corrido com runTestTT tests
