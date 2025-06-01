{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use camelCase" #-}

-- 1 
zip' :: [a] -> [b] -> [(a,b)]
zip' [] n = []
zip' n [] = []
zip' (x1:xs1) (x2:xs2) = (x1,x2) : zip' xs1 xs2 

-- 2 
preCrescente :: Ord a => [a] -> [a]
preCrescente [] = []
preCrescente (x:y:xs) 
    |(x<y) = x: preCrescente (y:xs)
    |otherwise = [x]

-- 3 
amplitude :: [Int] -> Int 
amplitude [] = 0 
amplitude (h:t) = amplitudeAc t h h 
    where 
        amplitudeAc [] acmin acmax = acmax - acmin 
        amplitudeAc (x:xs) acmin acmax |(x<acmin) = amplitudeAc xs x acmax
                                       |(x>acmax) = amplitudeAc xs acmin x    

-- 4 
type Mat a = [[a]]
soma :: Num a => Mat a -> Mat a -> Mat a 
soma [] [] = []
soma (x1:xs1) (x2:xs2) = somar x1 x2 : soma xs1 xs2

somar :: Num a => [a] -> [a] -> [a]  
somar [] [] = []
somar (x1:xs1) (x2:xs2) = (x1+x2) : somar xs1 xs2 

-- 7 (nao funciona)
organiza :: Eq a => [a] -> [(a,[Int])]
organiza [] = []
organiza l@(x:xs) = (x,posicoes x l) : organiza l

posicoes :: Eq a => a -> [a] -> [Int]
posicoes _ [] = []
posicoes a (x:xs)
    |(a==x) = 0 : map (+1) (posicoes a xs)
    |otherwise = map (+1) (posicoes a xs)