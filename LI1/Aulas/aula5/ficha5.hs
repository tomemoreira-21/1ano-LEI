module Main where 
import Graphics.Gloss

-- Ficha 
-- Tarefas 1 
circulo1 :: Picture
circulo1 = Circle 50

circulo2 :: Picture
circulo2 = rotate (-45) $ scale 0.5 1 $ Translate (-60) 30 circulo1

circulo3 :: Picture 
circulo3 = scale 1 0.5 $ color yellow $ circleSolid 20

quadradoVerde :: Picture 
quadradoVerde = color green $ rectangleSolid 20 20 

linhaPoligonal :: Picture 
linhaPoligonal = Line [(0,0),(-200,0),(200,200),(0,200),(0,0)]

circuloVermelho = Color red circulo1
circuloAzul = Color blue circulo2

circulos = Pictures [circuloVermelho, circuloAzul,circulo3]

figuras :: Picture 
figuras = Pictures [circulos,quadradoVerde,linhaPoligonal]

window :: Display
window = InWindow
    "Janela de Exemplo" -- título da janela
    (400,400) -- dimensão da janela
    (10,10) -- posição no ecrã

background :: Color
background = greyN 0.8

main :: IO ()
main = display window background figuras


