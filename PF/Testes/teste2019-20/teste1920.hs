{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Use infix" #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use map" #-}

-- 1 a) 
intersect :: Eq a => [a] -> [a] -> [a]
intersect l [] = []
intersect [] l = []
intersect (x:xs) l 
    |(elem x l) = x: intersect xs l 
    |otherwise = intersect xs l 

-- 1 b) 
tails :: [a] -> [[a]]
tails [] = [[]]
tails p@(x:xs) = p: tails xs 

-- 2 
type ConjInt = [Intervalo]
type Intervalo = (Int,Int)

-- 2 a) 
elems :: ConjInt -> [Int]
elems [] = []
elems ((i,f):t) = [i..f] ++ elems t 

-- 2 b) 
geraconj :: [Int] -> ConjInt 
geraconj [] = []
geraconj [x] = [(x,x)]
geraconj l = let lista = listconj l
             in conj lista 

conj :: [[Int]] -> ConjInt 
conj [] = []
conj [[x]] = [(x,x)]
conj (x:xs) = (head(x),last(x)) : conj xs 

listconj :: [Int] -> [[Int]]
listconj [] = []
listconj [x] = [[x]]
listconj (x:xs) 
    |(x == head(le) - 1 ) = (x:le) : ld 
    |otherwise = [x] : (le:ld)
    where 
        (le:ld) = listconj xs 

-- 3 
data Contacto = Casa Integer
              | Trab Integer
              | Tlm Integer
              | Email String
    deriving (Show)

type Nome = String
type Agenda = [(Nome, [Contacto])]

-- 3 a) 
acrescEmail :: Nome -> String -> Agenda -> Agenda 
acrescEmail nome e [] = [(nome,[Email e])]
acrescEmail nome e ((n,contac):t) 
    |(nome == n) = ((n,contac ++ [Email e])) : t 
    |otherwise = (n,contac) :acrescEmail nome e t 

-- 3 b) 
verEmails :: Nome -> Agenda -> Maybe [String] 
verEmails _ [] = Nothing 
verEmails nome ((n,contac):t)
    |(nome == n) = Just(removerEmails contac) 
    |otherwise = verEmails nome t  

removerEmails :: [Contacto] -> [String] 
removerEmails  [] = []
removerEmails (Email x:xs) = x : removerEmails xs  
removerEmails (_:xs) = removerEmails xs 

-- 3 c) 
consulta :: [Contacto] -> ([Integer],[String]) 
consulta [] = ([],[])
consulta l = (removerNum l,removerEmails l)


removerNum :: [Contacto] -> [Integer]
removerNum [] = []
removerNum ((Casa x):xs) = x: removerNum xs 
removerNum ((Trab x):xs) = x: removerNum xs 
removerNum ((Tlm x):xs) = x: removerNum xs 
removerNum (_:xs) = removerNum xs 

