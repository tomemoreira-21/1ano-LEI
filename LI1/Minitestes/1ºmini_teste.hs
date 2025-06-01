-- 1. 
type Horas = (Int,Int)

func :: Horas -> Horas -> Horas 
func (h1,m1) (h2,m2) = (div totalfinal 60, mod totalfinal 60)
    where 
        totalmin1 = h1*60 + m1 
        totalmin2 = h2*60 + m2 
        duração = totalmin2 - totalmin1 
        totalfinal = totalmin1 + (div duração 2) - 5
    
-- 2. 
type Ponto = (Double,Double)

data Figura = Circulo Ponto Double 
             |Rectangulo Ponto Ponto 
             |Quadrado Ponto Double 
             deriving (Show,Eq)

movimento :: Figura -> (Double,Double) -> Figura 
movimento (Circulo (cx,cy) r) (x,y) = Circulo (cx+x,cy+y) r 
movimento (Rectangulo (x1,y1) (x2,y2)) (x,y) = Rectangulo (x1+x,y1+y) (x2+x,y2+y)
movimento (Quadrado (x1,y1) l) (x,y) = Quadrado (x1+x,y1+y) l 
        
        