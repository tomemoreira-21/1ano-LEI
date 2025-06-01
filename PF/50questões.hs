{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use map" #-}
{-# HLINT ignore "Redundant if" #-}
{-# HLINT ignore "Use infix" #-}
{-# HLINT ignore "Use camelCase" #-}
{-# HLINT ignore "Use list comprehension" #-}
{-# HLINT ignore "Use notElem" #-}
-- 50 questões 

-- 1 
enumFromTo' :: Int -> Int -> [Int]
enumFromTo' n1 n2 |(n1==n2) = [n1]
                  |(n1<n2) = n1 : enumFromTo' (n1+1) n2
                  |otherwise = n2: enumFromTo' (n2+1) n1 

-- 2 
enumFromThenTo' :: Int -> Int -> Int -> [Int]
enumFromThenTo' n1 s n2 |(n1>n2 && s>=n1 || n1 < n2 && s < n1) = []
                        |(n1<=n2 && s>=n1) = n1: enumFromThenTo' s (s + n') n2 
                        where 
                            n' = (s - n1) 
-- 3 
concat' :: [a] -> [a] -> [a] 
concat' [] l = l 
concat' l [] = l
concat' (x1:xs1) l = x1 : concat' xs1 l 

-- 4 
posicao :: [a] -> Int -> a
posicao l n |n>=length l = error "posicao inexistente"
posicao p@(x:xs) n |(n==0) = x 
                   |otherwise = posicao xs (n-1)
 
-- 5 
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

-- 6 
take' :: Int -> [a] -> [a]
take' _ [] = []
take' n (x:xs) |(n>=tam) = (x:xs)
               |n > 0 = x: take' (n-1) xs
               |otherwise = []
               where 
                tam = length (x:xs)

-- 7
drop' :: Int -> [a] -> [a]
drop' n (x:xs) |(n>=tam) = [] 
               |(n>0) = drop' (n-1) xs 
               |otherwise = (x:xs) 
               where 
                tam = length (x:xs)

-- 8 
zip' :: [a] -> [b] -> [(a,b)]
zip' [] _ = []
zip' _ [] = []
zip' (x1:xs1) (x2:xs2) = (x1,x2): zip' xs1 xs2 

-- 9
replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' n num = num: replicate' (n-1) num 

-- 10
intersperce' :: a -> [a] -> [a]
intersperce' _ [] = []
intersperce' _ [x] = [x]
intersperce' n (x:xs) = x:n: intersperce' n xs 

-- 11 
group' :: Eq a => [a] -> [[a]]
group' [] = []
group' [x] = [[x]]
group' (x:xs) 
      |(x==head(le)) = (x:le) : ld 
      |otherwise = [x] : (le:ld)
      where 
        (le:ld) = group' xs 
                
-- 12 
concatenar :: [[a]] -> [a]
concatenar [] = []
concatenar (x:xs) = x ++ concatenar xs 

-- 13 
-- Utilizando o map
inits :: [a] -> [[a]]
inits [] = [[]]
inits (x:xs) = [] : map (x:) (inits xs) 
  
-- Ttilizando o acumulador
inits' :: [a] -> [[a]]
inits' [] = [[]]
inits' l = initAux l []
  where 
    initAux [] ac = [reverse ac]
    initAux (x:xs) ac = reverse ac: initAux xs (x:ac)

-- 14
tails :: [a] -> [[a]]
tails [] = [[]]
tails p@(x:xs) = p:tails xs 

-- 15 
heads :: [[a]] -> [a]
heads [] = []
heads (x:xs) |not (null x) = head(x) : heads xs 
             |otherwise = heads xs 

-- 16 
total :: [[a]] -> Int 
total [] = 0
total (x:xs) = comp x + total xs 

comp :: [a] -> Int 
comp [] = 0
comp (x:xs) = 1 + comp xs 

-- 17 
fun :: [(a,b,c)] -> [(a,c)]
fun [] = []
fun ((a,b,c):t) = (a,c) : fun t 

-- 18 
cola :: [(String,b,c)] -> String 
cola [] = ""
cola ((n,i1,i2):t) = n ++ cola t  

-- 19 
idade :: Int -> Int -> [(String,Int)] -> [String] 
idade _ _ [] = []
idade ano i ((nome,year):t) |(age >= i) = nome : idade ano i t 
                            |otherwise = idade ano i t
                            where 
                              age = ano - year 

-- 20 
powerEnumFrom :: Int -> Int -> [Int]
powerEnumFrom n m |(m-1 == 0) = [1]
                  |(m-1 > 0) = powerEnumFrom n (m-1) ++ [n^(m-1)]
                  |otherwise = []
                  
-- 21 
-- 1 º forma (usando list comprehension)
isPrime :: Int -> Bool 
isPrime n = let list = [m | m <- [2 .. floor(sqrt(fromIntegral n))], mod n m == 0] 
            in null list 

-- 2º forma (usando listas com os divisores de n sem ser o 1 e ele próprio)
isPrime' :: Int -> Bool 
isPrime' n = let list = isPrimeAux n 2 
             in null list  

isPrimeAux :: Int -> Int -> [Int]
isPrimeAux n m |m>floor(sqrt(fromIntegral n)) = []
               |otherwise = if mod n m == 0 then m : isPrimeAux n (m+1) else isPrimeAux n (m+1)


-- 3 º forma (usando listas com todos os divisores de n)
isPrime'' :: Int -> Bool 
isPrime'' n = (divisores_n == [1,n])
  where 
    divisores_n = divprime n 1 

divprime :: Int -> Int -> [Int]
divprime n m |(m>n) = []
             |otherwise = if mod n m == 0 then m : divprime n (m+1) else divprime n (m+1) 

-- 22
isPrefixOf' :: Eq a => [a] -> [a] -> Bool 
isPrefixOf' [] l = True 
isPrefixOf' l [] = False 
isPrefixOf' (x1:xs1) (x2:xs2) = (x1==x2 && isPrefixOf' xs1 xs2) 

-- 23 
isSuffixOf' :: Eq a => [a] -> [a] -> Bool 
isSuffixOf' [] l = True 
isSuffixOf' l [] = False 
isSuffixOf' l1 l2@(x2:xs2) = (l1 == l2 || isSuffixOf' l1 xs2) 

-- 24 
isSubsequenceOf' :: Eq a => [a] -> [a] -> Bool 
isSubsequenceOf' [] _ = True 
isSubsequenceOf' _ [] = False 
isSubsequenceOf' (x:xs) (y:ys) 
    |(x==y) = isSubsequenceOf' xs ys 
    |otherwise = isSubsequenceOf' (x:xs) ys 

-- 25 
elemIndices :: Eq a => a -> [a] -> [Int]
elemIndices _ [] = []
elemIndices n (x:xs)
  |(n==x) = 0 : map (+1) (elemIndices n xs)
  |otherwise = map (+1) (elemIndices n xs)

-- 26 
nub :: Eq a => [a] -> [a]
nub [] = []
nub (x:xs) 
  |(elem x xs) = nub xs 
  |otherwise = x: nub xs 

-- 27 
delete' :: Eq a => a -> [a] -> [a]
delete' n (x:xs) |(n==x) = xs 
                 |otherwise = x : delete' n xs 

-- 28 
(\\\) :: Eq a => [a] -> [a] -> [a]
(\\\) l [] = l 
(\\\) [] l = []
(\\\) l (x2:xs2) = (delete x2 l) \\\ xs2 

-- 29 
union' :: Eq a => [a] -> [a] -> [a]
union' l [] = l 
union' [] l = []
union' l1@(x1:xs1) l2@(x2:xs2)
  |(elem x2 l1) = union' xs1 xs2 
  |otherwise = x2: union' l1 xs2 

-- 30 
intersect' :: Eq a => [a] -> [a] -> [a]
intersect' [] l = []
intersect' l [] = []
intersect' (x1:xs1) l
  |(elem x1 l) = x1: intersect' xs1 l 
  |otherwise = intersect' xs1 l  


-- 31 
insert' :: Ord a => a -> [a] -> [a]
insert' n [] = [n]
insert' n p1@(x1:xs1) |(n<x1) = n : p1 
                      |otherwise = x1 : insert' n xs1 

-- 32 
unwords' :: [String] -> String 
unwords' [] = ""
unwords' [x] = x 
unwords' (x1:xs1) = x1 ++ " " ++ unwords' xs1

-- 33 
unlines' :: [String] -> String 
unlines' [] = ""
unlines' (x1:xs1) = x1 ++ "\n" ++ unlines' xs1 

-- 34 
pMaior :: [Int] -> Int 
pMaior [x] = 0 
pMaior p@(x1:xs1) |(maior p == x1) = 0 
                  |otherwise = 1 + pMaior xs1 

maior :: [Int] -> Int 
maior [x] = x 
maior (x1:xs1) |(x1 > maior xs1) = x1 
               |otherwise = maior xs1 

-- 35 
lookup' :: Eq a => a -> [(a,b)] -> Maybe b 
lookup' _ [] = Nothing 
lookup' ch ((c,num):t) |(ch == c) = Just num 
                       |otherwise = lookup' ch t 

-- 36 
preCrescente :: Ord a => [a] -> [a]
preCrescente [] = []
preCrescente (x:y:xs) |(y>x) = x:preCrescente (y:xs) 
                      |otherwise = [x]

-- 37
iSort :: Ord a => [a] -> [a] 
iSort [] = []
iSort (x:xs) = insert x (iSort xs)

insert :: Ord a => a -> [a] -> [a]
insert n [] = [n]
insert n l@(x:xs) |(n<x) = n:l 
                  |otherwise = x: insert n xs 

-- 38 
menor :: String -> String -> Bool 
menor l [] = False 
menor [] l = True 
menor (x1:xs1) (x2:xs2) 
    |(x1==x2) = menor xs1 xs2 
    |otherwise = x1<x2 

-- 39 
elemMSet :: Eq a => a -> [(a,Int)] -> Bool
elemMSet _ [] = False 
elemMSet ch ((c,num):t) = (ch == c || elemMSet ch t)

-- 40 
converteMSet :: [(a,Int)] -> [a]
converteMSet [] = []
converteMSet ((ch,num):t) = juntar_char (ch,num) ++ converteMSet t 

juntar_char :: (a,Int) -> [a] 
juntar_char (ch,1) = [ch] 
juntar_char (ch,num) = ch : juntar_char (ch,num-1) 

-- 41 
insereMSet :: Eq a => a -> [(a,Int)] -> [(a,Int)]
insereMSet _ [] = []
insereMSet ch ((c,num):t) |(ch == c) = (c,num+1) : t 
                          |otherwise = (c,num) : insereMSet ch t 

-- 42 
removeMSet :: Eq a => a -> [(a,Int)] -> [(a,Int)]
removeMSet _ [] = []
removeMSet ch ((c,num):t) 
    |(ch==c) = if num > 1 then (c,num-1) : removeMSet ch t else t 
    |otherwise = (c,num) : removeMSet ch t 

existe :: Eq a => a -> [(a,Int)] -> Bool 
existe _ [] = False 
existe ch ((c,i):t) = (ch == c || existe ch t)

-- 43 
constroiMSet :: Ord a => [a] -> [(a, Int)]
constroiMSet [] = []
constroiMSet l = let list = contar_list l 
                 in tuplas list 

tuplas :: Ord a => [[a]] -> [(a,Int)]
tuplas [] = []
tuplas (x:xs) = (head x,length x) : tuplas xs 

-- a função faz o seguinte "aabcc" -> ["aa","b","cc"]
contar_list :: Ord a => [a] -> [[a]]
contar_list [] = []
contar_list [x] = [[x]]
contar_list (x:y:xs) |(x == y) = (x:l) : ls 
                     |otherwise = [x] : (l:ls) 
                     where 
                        (l:ls) = contar_list (y:xs) 
                                  

-- 44
partitionEithers' :: [Either a b] -> ([a],[b])
partitionEithers' [] = ([],[])
partitionEithers' (x:xs) = case x of 
                          Left x1 -> (x1:le,ld)
                          Right x1 -> (le,x1:ld)                    
                          where 
                              (le,ld) = partitionEithers' xs
-- 45 
catMaybes' :: [Maybe a] -> [a] 
catMaybes' [] = []
catMaybes' (x:xs) = case x of 
                    Just x -> x: catMaybes' xs 
                    Nothing -> catMaybes' xs 

--46
data Movimento = Norte | Sul | Este | Oeste deriving (Show,Eq)
caminho :: (Int,Int) -> (Int,Int) -> [Movimento]
caminho (xi,yi) (xf,yf) 
    |(distX == 0 && distY == 0) = []
    |(distX > 0) = Este : caminho (xi+1,yi) (xf,yf)
    |(distX < 0) = Oeste: caminho (xi-1,yi) (xf,yf)
    |(distY > 0) = Norte : caminho (xi,yi+1) (xf,yf)
    |(distY < 0 ) = Sul : caminho (xi,yi-1) (xf,yf)         
    where 
      distX = xf - xi
      distY = yf - yi 

-- Outra alternativa 
caminho' :: (Int,Int) -> (Int,Int) -> [Movimento]
caminho' (xi,yi) (xf,yf) = 
  let distX = xf - xi 
      distY = yf - yi
      variaveisx = if distX > 0 then replicate' distX Este else replicate' (abs distX) Oeste 
      variaveisy = if distY > 0 then replicate' distY Norte else replicate' (abs distY) Sul 
  in variaveisx ++ variaveisy   

-- 47 
hasLoops :: (Int,Int) -> [Movimento] -> Bool 
hasLoops _ [] = False 
hasLoops n l = let posicoes = movimentacao n l 
               in elem n posicoes

-- esta função escreve todas as posicões ao longo do movimento 
movimentacao :: (Int,Int) -> [Movimento] -> [(Int,Int)]
movimentacao (x,y) [] = []
movimentacao (x,y) (x1:xs1) 
  |(x1==Norte) = (x,y+1) : movimentacao (x,y+1) xs1 
  |(x1==Sul) = (x,y-1) : movimentacao (x,y-1) xs1 
  |(x1==Oeste) = (x-1,y) : movimentacao (x-1,y) xs1 
  |otherwise = (x+1,y) : movimentacao (x+1,y) xs1 


-- 48 
type Ponto = (Float,Float)
data Rectangulo = Rect Ponto Ponto

-- Considero que a 1ºcoordenada -> canto inferior esquerdo 
-- Considero que a 2ºcoordenada -> canto superior direito 

contaQuadrados :: [Rectangulo] -> Int
contaQuadrados [] = 0 
contaQuadrados ((Rect p1 p2):t) 
            |(distX == distY) = 1 + contaQuadrados t
            |otherwise = contaQuadrados t 
            where 
              (x1,y1) = p1
              (x2,y2) = p2 
              distX = abs(x2-x1)
              distY = abs(y2-y1)


-- 49 
-- Considero que a 1ºcoordenada -> canto inferior esquerdo 
-- Considero que a 2ºcoordenada -> canto superior direito 

areaTotal :: [Rectangulo] -> Float 
areaTotal [] = 0 
areaTotal (h:t) = area h + areaTotal t  

area :: Rectangulo -> Float 
area (Rect p1 p2) = distX * distY 
  where 
      (x1,y1) = p1 
      (x2,y2) = p2 
      distX = abs(x2-x1)
      distY = abs(y2-y1)

-- 50 
data Equipamento = Bom | Razoavel | Avariado deriving (Show,Eq)

naoReparar :: [Equipamento] -> Int 
naoReparar [] = 0 
naoReparar (x:xs) 
  |(x==Bom || x==Razoavel) = 1 + naoReparar xs 
  |otherwise = naoReparar xs 
