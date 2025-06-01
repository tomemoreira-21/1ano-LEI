{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Use infix" #-}
{-# HLINT ignore "Use notElem" #-}
{-|
Module : Ficha 3
Description : Este módulo contém várias funções recursivas da ficha 3
Copyright : a111907@alunos.uminho.pt
LI1 
-}

module Ficha3 where 

-- |Esta função que recebe uma lista de strings e remove todas as strings iniciadas por um dado caractere

remove :: [String]  -- ^ Lista de palavras
        -> Char     -- ^ Character a remover
        -> [String] -- ^ Lista de palavras atualizada

remove [] _ = []
remove (x:xs) chr = let xs' = remove xs chr     
                    in if not (null (x:xs)) && chr == head(x) then xs' else x:xs'

-- |Esta função recebe uma lista de pares de inteiros e adiciona um valor dado à primeira componente de cada par
add :: [(Int,Int)] -- ^ Lista de pares inteiros 
    -> Int         -- ^ Valor dado para adicionar
     -> [(Int,Int)] -- ^ Lista de pares inteiros resultante 

add [] _ = []
add ((x,y):xs) n = (x+n,y):add xs n 

-- |Esta função recebe uma lista, não vazia, de pares de inteiros e calcula qual o maior valor da segunda componente
maior :: [(Int,Int)] -- ^ Lista de pares inteiros (obs: lista não pode ser vazia)
        -> Int       -- ^ Maior valor da segunda componente

maior [(x,y)] = y
maior ((x,y):xs) = max y (maior xs)

-- | Este tipo de dados representa o nome de uma pessoa 
type Nome = String

-- | Este tipo de dados representa as coordenadas de uma pessoa 
type Coordenada = (Double,Double)

-- Este tipo de dados representa um movimento 
data Movimento =
    -- |Norte  
    N 
    | -- |Sul 
    S 
    | -- |Este
    E 
    | -- |Oeste 
    W 
    deriving (Show,Eq)

 -- |Tipos de dados que representa um percurso
type Movimentos = [Movimento]

-- |Este tipo de dados representa a posição de uma pessoa 
data PosicaoPessoa = Pos 
                    Nome -- ^ Nome da pessoa 
                    Coordenada -- ^ Coordenadas da pessoa 
                    deriving (Show,Eq)

-- |Esta função recebe uma lista de posições de pessoas, atualize essa lista depois de todas executarem um movimento dado
posicoesM:: [PosicaoPessoa] -- ^ Lista de posições de pessoas 
            -> Movimento    -- ^ Movimento a ser efetuado
            -> [PosicaoPessoa] -- ^ Lista de posições de pessoas atualizadas

posicoesM [] _ = []
posicoesM ((Pos nome (x,y)):t) m = let p |(m==N) = (x,y+1)
                                         |(m==S) = (x,y-1)
                                         |(m==E) = (x+1,y)
                                         |otherwise = (x-1,y)
                                    in (Pos nome p):posicoesM t m


-- |Esta função recebe a posição de uma pessoa depois de executar uma sequência de movimentos
posicao:: PosicaoPessoa -> Movimentos -> PosicaoPessoa
posicao p [] = p 
posicao (Pos nome (x,y)) (h:t) = posicao (Pos nome p) t 
    where
        p = case h of 
            N -> (x,y+1)
            S -> (x,y-1)
            E -> (x+1,y)
            W -> (x-1,y)

-- |Esta função recebe uma lista de posições de pessoas, atualize essa lista depois de todas as pessoas executarem uma mesma sequência de movimentos
posicoesMs:: 
        [PosicaoPessoa] -- ^ Lista de posições de pessoas 
        -> Movimentos  -- ^ Movimentos a ser efetuados
        -> [PosicaoPessoa] -- ^ Lista de posições de pessoas atualizadas

posicoesMs [] [] = []
posicoesMs p [] = p
posicoesMs [] _ = []
posicoesMs (x:xs) moves = posicao x moves : posicoesMs xs moves 

-- |Esta função recebe uma lista de posições de pessoas e indica qual a posição mais a norte (em caso de igualdade, escolha uma posição)
pessoaNorte:: [PosicaoPessoa] -- ^ Lista de posições de pessoas 
            -> Maybe PosicaoPessoa -- ^ Pessoa mais a norte 

pessoaNorte [] = Nothing 
pessoaNorte [x] = Just (x)
pessoaNorte ((Pos nome1 (x1,y1)):(Pos nome2 (x2,y2):t)) 
    |(y2>y1) = pessoaNorte ((Pos nome2 (x2,y2):t))
    |otherwise = pessoaNorte ((Pos nome1 (x1,y1):t))

-- |Esta função calcula quais as pessoas mais posicionadas mais a norte 
pessoasNorte :: [PosicaoPessoa] -> [Nome]
pessoasNorte [] = []
pessoasNorte l = let ordenada = ordena l 
                 in list_nomes ordenada 

list_nomes :: [PosicaoPessoa] -> [Nome]
list_nomes [] = []
list_nomes (h:t) = retirarNome h : list_nomes t 

retirarNome :: PosicaoPessoa -> Nome
retirarNome (Pos nome (x,y)) = nome 

ordena :: [PosicaoPessoa] -> [PosicaoPessoa]
ordena [] = []
ordena (h:t) = insert h (ordena t)

insert :: PosicaoPessoa -> [PosicaoPessoa] -> [PosicaoPessoa]
insert x [] = [x]
insert (Pos n1 (x1,y1)) ((Pos n2 (x2,y2)):t) |(y1<y2) = (Pos n1 (x1,y1)) : ((Pos n2 (x2,y2)):t)
                                             |otherwise = (Pos n2 (x2,y2)) : insert (Pos n1 (x1,y1)) t 

-- 5 
deslocard :: [Int] -> Int -> [Int]
deslocard l 0 = l 
deslocard l n = deslocard (last l:init l) (n-1) 

-- 6 
deslocare :: [Int] -> Int -> [Int]
deslocare l 0 = l 
deslocare l n = deslocare (tail l ++ [head l]) (n-1)

-- 7 
func :: (Num a,Ord a) => a -> [a] -> a 
func n l |not (elem n l) = -1 
func n (h:t) |(n==h) = 0 
             |otherwise = 1 + func n t 

-- 8 
substituicao :: String -> Int -> String
substituicao [] _ = []
substituicao (h:t) pos |(pos == 0) = 'X' : t 
                       |otherwise = h: substituicao t (pos-1)

-- 9 (testar funções)
-- (!!) -> devolve as posições do elementos 
--         ex: [4,5,6] !! 2 -> 6 
-- concat -> concatena listas 
--         ex: concat [[1, 2], [3, 4], [5]] -> [1,2,3,4,5]
-- words -> dá uma string e devolve essa mesma string numa lista 
--          ex: words "Haskell é incrível" -> ["Haskell","é","incrível"]
-- unwords -> faz o contrário 
--          ex: unwords ["Haskell","é","incrível"] -> "Haskell é incrível" 
-- lines -> faz o seguinte:
--          ex: lines "a\nb" -> ["a","b"]
-- unlines -> faz o contrario 
--          ex: unlines ["a","b"] -> "a\nb" 
-- take e drop já sei 
-- splitAt -> divide uma lista em duas 
--          ex: splitAt 3 [1, 2, 3, 4, 5] -> ([1, 2, 3], [4, 5])
-- zip -> faz o seguinte
--       ex: zip [1, 2, 3] ["a", "b", "c"] -> [(1, "a"), (2, "b"), (3, "c")]
-- unzip -> faz o seguinte 
--       ex: unzip [(1, "a"), (2, "b"), (3, "c")] -> ([1, 2, 3], ["a", "b", "c"])
-- replicate -> faz o seguinte 
--       ex: replicate 5 3 -> [3, 3, 3, 3, 3]

-- 5 (reformulada)
movimentacao :: [Int] -> Int -> [Int]
movimentacao [] _ = []
movimentacao l 0 = l 
movimentacao p@(x:xs) n = drop (tam - n') p ++ take (tam - n') p 
        where 
            tam = length p 
            n' = mod n tam 

-- 6 (reformulada)
movimentacaor :: [Int] -> Int -> [Int]
movimentacaor [] _ = []
movimentacaor l 0 = l 
movimentacaor p@(x:xs) n = drop n' p ++ take n' p 
    where  
        tam = length p 
        n' = mod n tam 


-- 8 (reformulada)
substituicaor :: String -> Int -> String
substituicaor [] _ = []
substituicaor p@(x:xs) n = let (e,d) = splitAt n p
                           in e ++ "X" ++ tail d 
