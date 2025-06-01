module Main where

import Graphics.Gloss.Interface.Pure.Game

data Movimento = N | S | E | O | Parado 
data Estado = Estado (Float, Float)
                     Movimento 

-- tipo world -> tipo qualquer "tipo a"

janela :: Display 
janela = InWindow "Ficha 5 - Exercicio 2" (1000,1000) (0,0)

fundo :: Color 
fundo = white 

fps :: Int 
fps = 60 

estadoInicial :: Estado 
estadoInicial = Estado (0,0) Parado 

-- Ele desenha por defeito na origem, então fazemos o translate para movimentar para onde queremos
desenhaEstado :: Estado -> Picture
desenhaEstado (Estado (x,y) m) = Translate x y poligono
    where
        poligono :: Picture
        poligono = scale 10 10 $ Polygon [(0,0),(10,0),(10,10),(0,10)]

reageEvento :: Event -> Estado -> Estado 
reageEvento (EventKey (SpecialKey KeyUp) Down _ _ ) (Estado (x,y) m) |dentroDaJanela (x,y+5) = Estado (x,y+5) N 
                                                                     |otherwise = Estado (x,y) m 
reageEvento (EventKey (SpecialKey KeyDown) Down _ _) (Estado (x,y) m) |dentroDaJanela (x,y-5) = Estado (x,y-5) S
                                                                      |otherwise = Estado (x,y) m  
reageEvento (EventKey (SpecialKey KeyLeft) Down _ _) (Estado (x,y) m) |dentroDaJanela (x-5,y) = Estado (x-5,y) O
                                                                      |otherwise = Estado (x,y) m 
reageEvento (EventKey (SpecialKey KeyRight) Down _ _) (Estado (x,y) m) |dentroDaJanela (x,y-5) = Estado (x,y-5) E 
                                                                       |otherwise = Estado (x,y) m 
reageEvento (EventKey (SpecialKey _) Up _ _) (Estado (x,y) m) = Estado (x,y) Parado 
reageEvento _ s = s 

reageTempo :: Float -> Estado -> Estado 
reageTempo _ e@(Estado (x,y) m) = Estado p' m 
    where 
        p = proximaposição (x,y) m 
        p' = if dentroDaJanela p then p else (x,y)  

proximaposição :: (Float,Float) -> Movimento -> (Float,Float) 
proximaposição (x,y) Parado = (x,y) 
proximaposição (x,y) N = (x,y+5) 
proximaposição (x,y) S = (x,y-5)  
proximaposição (x,y) E = (x+5,y) 
proximaposição (x,y) O = (x-5,y) 
 
dentroDaJanela ::  (Float,Float) -> Bool 
dentroDaJanela (x,y) = x+50 <= 450 && x-50 >= -550 && y-50 >= -550 && y+50 <= 450


main :: IO ()
main = do play janela 
               fundo 
               fps 
               estadoInicial
               desenhaEstado
               reageEvento
               reageTempo