-- com deriving show
data Movimento = Norte | Sul | Este | Oeste 
                  deriving Show

x = Norte 

-- sem deriving show
data Movimento = Norte | Sul | Este | Oeste 
instance (Show Movimento) where
    show Norte = "N"
    show Sul = "S"
    show Oeste = "O"
    show Este = "E"

--tipos
--exemplo
type Ponto = (Double,Double) 
type D3 = (Double,Double,Double)


