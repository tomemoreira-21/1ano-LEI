{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use :" #-}
module Main where 
import Graphics.Gloss.Interface.Pure.Game 
import Pacman 

janela :: Display 
janela = InWindow "Pacman" (1000,1000) (0,0)

fundo :: Color 
fundo = black  

fps :: Int 
fps = 60 

jogo :: Jogo
jogo = Jogo {pacman = Pacman {posicao = (0,0),vida = 10},
            comida = [(1,1),(3,3),(-3,5)]
            }

desenhaJogo :: Jogo -> Picture 
desenhaJogo j = Scale 20 20 $ Pictures ([Translate x y (color yellow $ circleSolid 20)] ++ map (\(a,b) -> Translate a b (color red $ circleSolid 20)) c)
    where 
        c = comida j 
        (x,y) = posicao (pacman j) 

eventoJogo :: Event -> Jogo -> Jogo 
eventoJogo (EventKey (SpecialKey k) Down _ _) j =
            case k of 
                KeyUp -> atualizaJogo Cima j 
                KeyDown -> atualizaJogo Baixo j 
                KeyLeft -> atualizaJogo Esquerda j 
                KeyRight -> atualizaJogo Direita j 
eventoJogo _ j = j 

main :: IO ()
main = do play janela 
               fundo 
               fps 
               jogo 
               desenhaJogo 
               eventoJogo
               (const id)
    