{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Eta reduce" #-}
module Pacman where 

type Posicao = (Float,Float)
type Comida = [(Float,Float)]

data Pacman = Pacman {posicao :: Posicao,
                      vida :: Int   
                    }

data Jogo = Jogo {comida :: Comida,
                  pacman :: Pacman}

data Movimento = Cima | Baixo | Esquerda | Direita 

move :: Movimento -> Pacman -> Pacman 
move move p = case move of 
        Cima -> p {posicao = (x,y+5)}
        Baixo -> p {posicao = (x,y+5)}
        Esquerda -> p {posicao = (x-5,y)}
        Direita -> p {posicao = (x+5,y)}
        where 
            (x,y) = posicao p  

come :: Pacman -> Comida -> Comida 
come p comida = filter (\(x,y) -> x/= px || y /= py) comida
    where 
        (px,py) = posicao p 

atualizaJogo :: Movimento -> Jogo -> Jogo 
atualizaJogo m j = let p' = move m (pacman j) 
                   in j {pacman = p', comida = come p' (comida j)}