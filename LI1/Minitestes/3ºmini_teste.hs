module Main where 
import Test.HUnit
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game

-- |Recebe (x,y) as suas posicões no referencial 
type Coordenadas = (Float,Float)

-- |Recebe as coordenadas da figura e as coordenadas dos outros círculos
type Estado = (Coordenadas,[Coordenadas]) 

-- |Contém o valor inicial de cada uma das componentes 
estadoInicial :: Estado
estadoInicial = ((0,0),[(-100,100),(0,100),(100,100),(0,-50),(-50,40)])

-- |Responsável por desenhar na tela as figuras 
desenhaEstado :: Estado -> Picture
desenhaEstado ((x,y),circulos) = 
    Pictures ([color red $ translate x y $ circleSolid 30] ++ map desenha circulos)
    where 
        desenha (x1,y1) = translate x1 y1 $ color blue $ circleSolid 15  

-- |Responsável por fazer a interligação entre o teclado e o jogo
reageEvento :: Event -> Estado -> Estado 
reageEvento (EventKey (SpecialKey KeyLeft) Down _ _) ((x,y),circulos) = ((max (x-15) (-270),y),circulos)
reageEvento (EventKey (SpecialKey KeyRight) Down _ _) ((x,y),circulos) = ((min 270 (x+15),y),circulos)
reageEvento _ e = e 

-- |Responsável por mostrar como o jogo se desenrola em função da passagem do tempo
reageTempo :: Float -> Estado -> Estado 
reageTempo t ((x,y),circulos) = ((x, max (y-1) (-270)),circulos') 
    where 
        circulos' = filter (\(x1,y1) -> dist (x1,y1) (x,y) > 45) circulos 

-- |Função auxiliar responsável por calcular a distância entre dois pontos
dist :: Coordenadas -> Coordenadas -> Float 
dist (x1,y1) (x2,y2) = sqrt ((x1-x2)^2 + (y1-y2)^2)

-- |Frame rate do jogo
fr :: Int 
fr = 50 

-- |Componentes da Janela
dm :: Display
dm = InWindow "Jogo Exemplo" -- título da janela
                (600,600) -- dimensão da janela
                (200,200) -- posição no ecran

-- |Cor do background 
corFundo :: Color 
corFundo = (greyN 0.5)

-- |Função principal main
main :: IO ()
main = do play dm -- janela onde irá decorrer o jogo
               corFundo -- cor do fundo da janela
               fr -- frame rate
               estadoInicial -- define estado inicial do jogo
               desenhaEstado -- desenha o estado do jogo
               reageEvento -- reage a um evento
               reageTempo -- reage ao passar do tempo

-- teste unitário 
lista_inicial :: [Coordenadas]
lista_inicial = [(-100,100),(0,100),(100,100),(0,-50),(-50,40)]

t1 :: Test 
t1 = "Testar se os circulos menores reagem às teclas"
    ~: ((-15,0),lista_inicial)
    ~=? reageEvento (EventKey (SpecialKey KeyLeft) Down (Modifiers Up Up Up) (0,0)) estadoInicial 