module Main where 
import Graphics.Gloss

main :: IO ()
main = display window background imagem
    where 
        window = InWindow "LI1" (400,400) (0,0) -- "LI1" -> nome da janela 
                                                -- (400,400) -> tamanho da janela
                                                -- (0,0) -> posicao da janela na tela
        background = green 
        imagem = Pictures [Color red $ ThickCircle 50 5, 
                           Color blue $ ThickCircle 200 5, 
                           Color violet $ Polygon [(-100,100),(100,100),(100,-100),(-100,-100)] 
                            ]

