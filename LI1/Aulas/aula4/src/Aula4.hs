{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use map" #-}
{-# HLINT ignore "Use camelCase" #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Eta reduce" #-}
{-|
Module : Ficha 4
Description : Este módulo contém várias funções recursivas da ficha 4
Copyright : Tomé Moreira 
LI1 
-}
module Aula4 where 
import Control.Concurrent (waitQSem)

-- |Matriz sobre um tipo de dados 
type Matriz a = [[a]]

-- |Esta função recebe uma matriz não vazia, troca a primeira linha com a última 
trocaPU :: Matriz a -- ^ Matriz original não vazia
        -> Matriz a -- ^ Matriz resultante, com a primeira e a última linha trocada

trocaPU m = ultima : meio ++ [primeira] 
    where 
        primeira = head m 
        ultima = last m
        meio = tail (init m)

-- |Esta função recebe uma matriz não vazia, e troca a primeira coluna com a última 
trocaCO :: Matriz a -- ^ Matriz original não vazia
        -> Matriz a -- ^ Matriz resultante, com a primeira coluna trocada com a última coluna

-- |Função principal
trocaCO [] = []
trocaCO (x:xs) = trocaCOAux x : trocaCO xs 

-- |Função auxiliar 
trocaCOAux :: [a] -> [a] 
trocaCOAux [] = []
trocaCOAux l = ultimo : meio ++ [primeiro] 
        where 
            primeiro = head l  
            meio = tail (init l)
            ultimo = last l 

-- |Esta função dada a posicao devolve o elemento 
elemento_matriz :: (Int,Int) -- ^ Posição dada
                -> Matriz Int -- ^ Matriz dada
                -> Int -- ^ Elemento da matriz 

elemento_matriz (x,y) l = let list = devolve_linha y l 
                          in devolve_coluna x list

devolve_linha :: Int -> Matriz Int -> [Int] 
devolve_linha n (x:xs) 
        |(n==0) = x 
        |otherwise = devolve_linha (n-1) xs

devolve_coluna :: Int -> [Int] -> Int 
devolve_coluna n (x:xs)
        |(n==0) = x 
        |otherwise = devolve_coluna (n-1) xs 

-- |Esta função dá a posicão de um elemento da matriz 
posicao :: Int -> Matriz Int -> (Int,Int)
posicao n l = let list_linha = devolve_linha (valor_linha n l) l 
              in (valor_coluna n list_linha, valor_linha n l)

valor_coluna :: Int -> [Int] -> Int 
valor_coluna n (x:xs)
        |(n==x) = 0 
        |otherwise = 1 + valor_coluna n xs  
                      
valor_linha :: Int -> Matriz Int -> Int 
valor_linha n (x:xs) 
     |(elem n x) = 0 
     |otherwise = 1 + valor_linha n xs 

-- |Esta função substitui um elemento de uma posicao por outro valor 
substituielem :: a -> (Int,Int) -> Matriz a -> Matriz a 
substituielem _ _ [] = []
substituielem n (c,l) (h:t) |(l==0) = substitui n c h : t  
                            |otherwise = h : substituielem n (c,l-1) t 

substitui :: a -> Int -> [a] -> [a]
substitui _ _ [] = []
substitui n col (h:t) |(col == 0) = n : t 
                      |otherwise = h : substitui n (col-1) t 

-- Reformulando algumas com as funções pré-definidas
-- 2 
trocarLinha :: Matriz a -> Matriz a 
trocarLinha l = ultima ++ meio ++ primeira 
        where 
            ultima = drop (length l - 1) l
            primeira = take 1 l 
            meio = tail (init l)

-- 3 
trocarColuna :: Matriz a -> Matriz a 
trocarColuna [] = []
trocarColuna (x:xs) = trocarColunaAux x : trocarColuna xs 

trocarColunaAux :: [a] -> [a]
trocarColunaAux [] = []
trocarColunaAux l = ultima ++ meio ++ primeira
        where 
           ultima = drop (length l - 1) l 
           primeira = take 1 l 
           meio = tail(init l)

-- 4 
elemento_posicao :: (Int,Int) -> Matriz Int -> Int 
elemento_posicao (x,y) l = let list_linha = (l !! y)
                           in (list_linha !! x)

-- 5
posicao_elemento :: Int -> Matriz Int -> (Int,Int)
posicao_elemento n l = (coluna n l, linha n l)

linha :: Int -> Matriz Int -> Int 
linha n (x:xs) 
     |(elem n x) = 0 
     |otherwise = 1 + linha n xs 

coluna :: Int -> Matriz Int -> Int 
coluna n l = valor_coluna n (l !! linha n l) 


