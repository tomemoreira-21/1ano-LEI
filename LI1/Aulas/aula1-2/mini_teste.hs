{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
{-# HLINT ignore "Redundant bracket" #-}

-- 1 a) 
func :: [String] -> [String] -> String 
func l1 l2 = last(l1) ++ "," ++ [head(head(l1))] ++ ". " ++ "& " ++ last(l2) ++ "," ++ [head(head(l2))] ++ "."

-- 1 b) 
func2 :: [String] -> [String] -> String 
func2 l1 l2 = head(head(l1)) : '.' : last(l1) ++ " & " ++ head(head(l2)) : '.' : last(l2)

-- 2 
func3 :: [[String]] -> String 
func3 l 
    |(length l == 2) = last(head(l)) ++ " & " ++ last(last(l))
    |otherwise = last(head(l)) ++ " et al."

-- 3 
type Ponto = (Double, Double)
data Figura =
        Circulo Ponto Double |
        Rectangulo Ponto Ponto |
        Quadrado Ponto Double deriving (Show,Eq)

-- 3 a) 
dist :: Figura -> Double 
dist (Circulo (cx,cy) r) = 2*r 
dist (Quadrado (x,y) l) = sqrt(l^2 + l^2)
dist (Rectangulo (x1,y1) (x2,y2)) = sqrt((x1-x2)^2 + (y1-y2)^2)

-- 3 b) 
contida :: Figura -> Bool 
contida (Circulo (cx,cy) r) = (cx-r) >= 0 && (cy-r) >= 0
contida (Rectangulo (x1,y1) (x2,y2)) = (x1 >= 0 && x2 >= 0) && (y1 >= 0 && y2 >= 0)
contida (Quadrado (x,y) l) = x>=0 && (y-l)>=0 

-- 3 c) 
translação :: Figura -> (Double,Double) -> Figura 
translação (Circulo (cx,cy) r) (x,y) = Circulo (cx+x,cy+y) r
translação (Rectangulo (x1,y1) (x2,y2)) (x,y) = Rectangulo (x1+x,y1+y) (x2+x,y2+y)
translação (Quadrado (x1,y1) l) (x,y) = Quadrado (x1+x,y1+y) l

-- 3 d) 
perimetro :: Figura -> Figura 
perimetro (Circulo (cx,cy) r) = Circulo (cx,cy) (r/2)
perimetro (Quadrado (x1,y1) l) = Quadrado (x1,y1) (l/2) 
perimetro (Rectangulo (x1,y1) (x2,y2)) = Rectangulo (x_s_e,y_s_e) (x_novo,y_novo) 
        where
            x_s_e = min x1 x2 
            y_s_e = max y1 y2 
            x_i_d = max x1 x2 
            y_i_d = min y1 y2
            x_novo = x_s_e + (x_i_d - x_s_e)/2
            y_novo = y_s_e - (y_s_e - y_i_d)/2

-- 4
data Figura' =
        Triangulo' Ponto Ponto Ponto |
        Circulo' Ponto Double |
        Rectangulo' Ponto Ponto |
        Quadrado' Ponto Double deriving (Show,Eq)

-- 4 a)
dist_ordenadas :: Figura' -> Double
dist_ordenadas (Triangulo' (x1,y1) (x2,y2) (x3,y3)) = min (min x1 x2) x3
dist_ordenadas (Circulo' (cx,cy) r) = cx-r 
dist_ordenadas (Rectangulo' (x1,y1) (x2,y2)) = min x1 x2 
dist_ordenadas (Quadrado' (x,y) l) = x 

-- 4 b) 
par_triangulos :: Figura' -> (Figura',Figura')
par_triangulos (Triangulo' p1 p2 p3) = (Triangulo' p1 p2 p3, Triangulo' p1 p2 p3)
par_triangulos (Circulo' (cx,cy) r) = (Triangulo' (cx-r,cy) (cx+r,cy) (cx,cy+r), Triangulo' (cx-r,cy) (cx+r,cy) (cx,cy-r))
par_triangulos (Quadrado' (x,y) l) = (Triangulo' (x,y) (x,y-l) (x+l,y), Triangulo' (x,y-l) (x+l,y-l) (x+l,y))
par_triangulos (Rectangulo' (x1,y1) (x2,y2)) = (Triangulo' (x_s_e,y_s_e) (x_i_d,y_s_e) (x_i_d,y_i_d), Triangulo' (x_s_e,y_s_e) (x_s_e,y_i_d) (x_i_d,y_i_d))
            where 
                x_s_e = min x1 x2 
                y_s_e = max y1 y2 
                x_i_d = max x1 x2 
                y_i_d = min y1 y2

-- 5 
type Horas = (Integer, Integer) 
-- 5 a) 
horas_intervalo :: Horas -> Horas -> Horas 
horas_intervalo (h1,m1) (h2,m2) = (div totalfinal 60, mod totalfinal 60)
    where 
        totalmin1 = h1*60 + m1 
        totalmin2 = h2*60 + m2 
        duração = totalmin2 - totalmin1 
        totalfinal = totalmin1 + (div duração 2)

-- 5 b) 
horas_fim :: Horas -> Horas -> Horas 
horas_fim (h1,m1) (hd,md)
    |(horas >= 24) = (mod horas 24,minutos)
    |otherwise = (horas,minutos)
    where 
        totalmin1 = h1*60 + m1 
        totalminduração = hd*60 + md 
        totalminfinal = totalmin1 + totalminduração
        horas = div totalminfinal 60
        minutos = mod totalminfinal 60

-- 5 c)
horas_list :: [Horas] -> Horas 
horas_list l
    |(totalminchegada_normal >= totalminpartida) = (div duração_normal 60, mod duração_normal 60)
    |otherwise = (div duração_especial 60, mod duração_especial 60) 
    where 
        hora_partida = head(l)
        hora_chegada = last(l)
        totalminpartida = fst(hora_partida)*60 + snd(hora_partida)
        totalminchegada_normal = fst(hora_chegada)*60 + snd(hora_chegada)
        totalminchegada_especial = (fst(hora_chegada)+24)*60 + snd(hora_chegada)
        duração_normal = totalminchegada_normal - totalminpartida
        duração_especial = totalminchegada_especial - totalminpartida
