module MiniTeste where
import Test.HUnit
-- Questão 1
-- 1 
f :: [Int] -> [Int] -> [Int]
f l [] = l 
f [] l = l 
f (x:xs) (y:ys) |x<=y = x : f xs (y:ys)
                |otherwise = y : f (x:xs) ys 

--2 
{-|
Esta função recebe duas listas ordenadas e vai devolver uma única lista ordenada resultante da concatenação das duas 

==__Exemplos de utilização__

>>> f [1,3] [4,5]
[1,3,4,5]

>>> f [4,6] [5,7]
[4,5,6,7]
-}

-- 3 
teste1 :: Test 
teste2 :: Test 
teste3 :: Test 
testar :: Test 
teste1 = "quando uma das listas é vazia" ~: [1,3] ~=? f [1,3] []
teste2 = "a lista resultante já está ordenada" ~: [1,2,3,4] ~=? f [1,2] [3,4]
teste3 = "tem de ordenar a lista resultante" ~: [1,2,3,4] ~=? f [1,3] [2,4]
testar = test [teste1,teste2,teste3]

-- Questão 2 
type Ponto = (Int,Int)
data Figura = Circulo Ponto Int 

-- 1 
g :: [Ponto] -> Ponto -> Figura -> [Ponto]
g [] _ _ = []
g ((x1,y1):t) (x,y) l@(Circulo (cx,cy) r) |(pertence (novox,novoy) l) = g t (x,y) l 
                                          |otherwise = (novox,novoy) : g t (x,y) l 
                                          where 
                                             (novox,novoy) = (x1+x,y1+y)

pertence :: Ponto -> Figura -> Bool 
pertence (x,y) (Circulo (cx,cy) r) = (x>= cx-r && x<= cx+r) && (y>=cy-r && y<= cy+r)

-- 2
{-|
Esta função recebe uma lista de pontos, um vetor de translação e devolve uma lista de pontos,já com o vetor de translação aplicado, que não estão no interior da figura

==__Exemplos de utilização__

>>> g [(2,3),(3,4),(6,7),(-1,-1)] (1,1) (Circulo (0,0) 5)
[(7,8)]

-}
t1 :: Test 
t2 :: Test 
t3 :: Test 
teste :: Test 
t1 = "recebe uma lista de pontos vazia" ~: [] ~=? g [] (1,1) (Circulo (0,0) 2)
t2 = "todos os pontos resultantes estão no interior da figura" ~: [] ~=? g [(1,1),(-1,0)] (0,0) (Circulo (0,0) 2)
t3 = "todos os pontos resultantes estão no exterior da figura" ~: [(3,4),(4,3)] ~=? g [(2,3),(3,2)] (1,1) (Circulo (0,0) 2)
teste = test [t1,t2,t3]
