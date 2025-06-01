{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Use camelCase" #-}
{-# HLINT ignore "Use notElem" #-}
{-# HLINT ignore "Use infix" #-}

-- 1 
(\\\) :: Eq a => [a] -> [a] -> [a]
(\\\) l [] = l 
(\\\) [] l = []
(\\\) l (x2:xs2) = (delete x2 l) \\\ xs2 

-- 2 
type MSet a = [(a,Int)] 

-- 2 a) 
removeMSet :: Eq a => a -> [(a,Int)] -> [(a,Int)]
removeMSet _ [] = []
removeMSet n [(ch,1)] |(n==ch) = [] 
removeMSet n ((ch,num):t)
    |(n==ch) = (ch,num-1): removeMSet n t 
    |otherwise = (ch,num) : removeMSet n t 

-- 2 b) 
calcula :: MSet a -> ([a],Int)
calcula [(ch,num)] = ([ch],num)
calcula l = (juntar_char l, somanum l)

juntar_char :: MSet a -> [a]
juntar_char [] = []
juntar_char ((ch,num):t) = ch:juntar_char t 

somanum :: MSet a -> Int 
somanum [] = 0
somanum ((ch,num):t) = num + somanum t 

-- 3
partes :: String -> Char -> [String]
partes (h:t) ch = partesAux t [h] ch
    where
        partesAux l ac _ |(null l || l == [ch]) = [ac]
        partesAux (x:xs) ac ch |(x==ch) = ac: partesAux xs [] ch
                               |otherwise = partesAux xs (ac++[x]) ch
