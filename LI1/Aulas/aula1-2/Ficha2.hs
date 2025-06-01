-- 1.
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
{-# HLINT ignore "Redundant bracket" #-}
data Movimento = Norte | Sul | Este | Oeste deriving Show 
type Ponto = (Double,Double)

-- (a)
move :: Ponto -> Movimento -> Ponto 
move (x,y) Norte = (x,y+1)
move (x,y) Sul = (x,y-1)
move (x,y) Oeste = (x-1,y)
move (x,y) Este = (x+1,y)

-- (b)
dist :: Ponto -> Ponto -> Double 
dist (x1,y1) (x2,y2) = sqrt((x2-x1)^2 + (y2-y1)^2)

-- (c)
comp_func :: Ponto -> Ponto -> Ponto
comp_func (x3,y3) (x4,y4) 
    |(y3 > y4) = (x4,y4)
    |(y4 > y3) = (x3,y3)
    |otherwise = (x3,y3)

-- 2.
type Comprimento = Double
move_func :: Ponto -> Movimento -> Comprimento -> Ponto 
move_func (x_1,y_1) Norte comp= (x_1,min (y_1+1) comp)
move_func (x_1,y_1) Sul comp = (x_1,max(y_1 - 1)  0)
move_func (x_1,y_1) Oeste comp = (max(x_1-1) 0,y_1)
move_func (x_1,y_1) Este comp = (min(x_1+1) comp,y_1)

-- 3.
func_comp :: Ponto -> Comprimento -> Ponto 
func_comp (xx,yy) l = (xx,l - yy)

-- 4.
func_center :: Ponto -> Comprimento -> Ponto 
func_center (xx1,yy1) l1 = (xx1 + l1/2, yy1 + l1/2)

-- 5. 
type Velocidade = Double 
type Tempo = Double 
move2 :: Ponto -> Velocidade -> Tempo -> Ponto 
move2 (x3,y3) v t = (x3 + v*t, y3)

-- 6. 
move3 :: Ponto -> Velocidade -> Tempo -> Ponto 
move3 (x4,y4) vel time = (x4, y4 + vel*time)

-- 7. 
type Velocidade2 = (Double,Double)
move4 :: Ponto -> Velocidade2 -> Tempo -> Ponto 
move4 (x5,y5) (v1x,v1y) tem = (x5 + v1x*tem, y5 + v1y*tem)

-- 8.
data Figura = Circulo Ponto Double |
              Rectangulo Ponto Ponto |
              Quadrado Ponto Double deriving (Show,Eq)

-- 8. (a)
func_in :: Ponto -> Figura -> Bool 
func_in (x,y) (Circulo (cx,cy) r) = (x>=cx-r && x<=cx+r) && (y>=cy-r && y<=cy+r)      
func_in (x,y) (Rectangulo (x1,y1) (x2,y2)) = (x>=x1 && x<=x2) && (y>=y2 && y<=y1)
func_in (x,y) (Quadrado (x_1,y_1) l) = (x>=x_1 && x<= x_1 + l) && (y>=y_1 - l && y<=y_1)

--8. (b)
menorQuadrado :: Figura -> Figura 
menorQuadrado (Circulo (x,y) raio) = let xQ = x - raio 
                                         yQ = y + raio 
                                         lado = 2*raio
                                     in (Quadrado (xQ,yQ) lado)    

menorQuadrado (Rectangulo (x1,y1) (x2,y2)) 
    |(y1 > y2 && abs(x2 - x1) > abs(y1 -y2)) = (Quadrado (x1,y1) la1)
    |(y2 > y1 && abs(x2 - x1) > abs(y1 -y2)) = (Quadrado (x2,y2) la1)
    |(y1 > y2 && abs(y1 - y2) > abs(x1 - x2)) = (Quadrado (x1,y1) la2)
    |(y2 > y1 && abs(y1 - y2) > abs(x1 - x2)) = (Quadrado (x2,y2) la2)
    where 
        la1 = abs(x2-x1)
        la2 = abs(y1 - y2)  

--8. (c)
maiorCirculo :: Figura -> Figura 
maiorCirculo (Circulo (x,y) r) = (Circulo (x,y) r)
maiorCirculo (Quadrado (x,y) l) = let cx = (x + (x+l))/2
                                      cy = (y + (y-l))/2
                                      r = abs(y - cy)
                                  in (Circulo (cx,cy) r)
maiorCirculo (Rectangulo (x1,y1) (x2,y2)) =  let cx = (x1+x2)/2 
                                                 cy = (y1+y2)/2 
                                                 r = min (abs(y1-cy)) (abs(x1-cx))
                                             in (Circulo (cx,cy) r) 

-- 8. (d)
-- Dá False se as figuras forem de tipo diferente ou se a primeira não estiver contida na segunda
contida :: Figura -> Figura -> Bool 
contida (Circulo (x1,y1) r1) (Circulo (x2,y2) r2) = dist_centros < r2 - r1
    where
        dist_centros = sqrt((x1-x2)^2 + (y1-y2)^2)
contida (Rectangulo (x1,y1) (x2,y2)) (Rectangulo (x3,y3) (x4,y4)) = (dist_x_menor < dist_x_maior) && (dist_y_menor < dist_y_maior) 
    where 
        dist_x_menor = x4-x3
        dist_y_menor = y3-y4
        dist_x_maior = x2-x1 
        dist_y_maior = y1-y2
contida (Quadrado (x1,y1) l1) (Quadrado (x2,y2) l2) = ((x2+l2 > x1 && x2+l2 < x1+l1) && (y2-l2 > y1-l1 && y2-l2 < y1))
contida (_) (_) = False 

-- 8. e)
contida2 :: Figura -> Figura -> Bool 
contida2 (Circulo (x1,y1) r1) (Rectangulo (x2,y2) (x3,y3)) = (x1+r1 < x3 && x1-r1 > x2) && (y1+r1 < y2 && y1-r1 > y3)
contida2 (Rectangulo (x2,y2) (x3,y3)) (Circulo (x1,y1) r1) = (x2 > x1-r1 && x2< x1+r1) && (x3 > x1-r1 && x3< x1+r1) && (y2 > y1-r1 && y2 < y1+r1) && (y3 > y1-r1 && y3 < y1+r1)
contida2 (Circulo (x1,y1) r1) (Quadrado (x2,y2) l) = (x1+r1 > x2 && x1+r1 < x2+l) && (y1+r1 > y2-l && y1+r1 < y2) 
