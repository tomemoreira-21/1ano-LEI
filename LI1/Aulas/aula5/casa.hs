module Main where
import Graphics.Gloss

window :: Display
window = InWindow "Casa linda" (400,400) (200,200)

background :: Color 
background = white 

quadrado :: Picture 
quadrado = Color orange $ Polygon [(-50,50),(50,50),(50,-50),(-50,-50)]

triangulo :: Picture 
triangulo = Polygon [(-50,50),(0,100),(50,50)]

figuras :: Picture 
figuras = Pictures [quadrado,triangulo]


main :: IO ()
main = display window background figuras
