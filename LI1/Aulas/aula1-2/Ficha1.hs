-- 2 a)
list_1_2 :: [a] -> (a,a)
list_1_2 lista = (head lista,last lista)

-- 2 b)
list_nomes :: [String] -> (String,String)
list_nomes list = (head list,last list)

-- 2 c)
list_name :: [String] -> String
list_name [] = " "
list_name listar = head(listar) ++ " " ++ last(listar)

-- 2 d)
tam_name :: [String] -> Int 
tam_name [] = 0
tam_name l = length (last l)

-- 2 e)
char_str :: Char -> String -> Bool 
char_str chr strin = elem chr strin 

-- 2 f)
cond_parimpar :: [a] -> [a]
cond_parimpar li  
    |(mod (length li) 2 == 0 ) = tail li
    |otherwise = init li 

-- 2 g) i)
func_junc :: [Int] -> [Int] -> [Int]
func_junc l1 l2 = l1 ++ l2

-- 2 g) ii)
tam_junc :: [Int] -> [Int] -> Int
tam_junc lista1 lista2 = length (lista1 ++ lista2)

-- 2 g) iii)
dif_junc :: [Int] -> [Int] -> Int
dif_junc li1 li2 = abs((length li1) - (length li2))

-- 2 g) iv)
pert_junc :: [Int] -> Int -> String
pert_junc list1 n 
    |(elem n list1) = "Sim"
    |otherwise = "Nao" 

-- 2 h)
comp_list :: [Int] -> [Int] -> [Int]
comp_list lis1 lis2 
    |(length lis1 < length lis2) = lis1 ++ lis2 
    |otherwise = lis2 ++ lis1

-- 2 i)
junc_list :: [Int] -> [Int] -> [Int]
junc_list listar1 listar2 
    |(head listar1 < head listar2) = listar1 ++ listar2
    |otherwise = listar2 ++ listar1 

-- 2 j)
tup_list :: ([a],[a]) -> (a,[a])
tup_list (tl1,tl2) = (head(tl1),tl2)

-- 2 k)
nome_list :: [String] -> String
nome_list listA = head(head listA) : '.' : last listA

-- 2 l)
list_pares :: [(Int,Int)] -> Int
list_pares [] = 0 
list_pares lIsta = snd(head lIsta)

-- 2 m)
pares_list :: [(Int,Int)] -> Int 
pares_list [] = 0
pares_list lis1 = fst(last lis1) + snd(last lis1)

-- 2 n)
idade_name :: (String,Int) -> (String,Int) -> String
idade_name (nome1,idade1) (nome2,idade2) 
    |(idade1 < idade2) = nome1
    |otherwise = nome2 

-- 2 o)
quadrado_point :: (Int,Int) -> Int -> (Int,Int)
quadrado_point (x,y) lado = (x-lado,y-lado)

-- 2 p)
quadrados_point :: ((Int,Int), Int) -> ((Int,Int), Int) -> Int
quadrados_point ((x1,y1), l1) ((x2,y2), l2) 
    |(y1 > y2) = l1*l1
    |(y2 > y1) = l2*l2
    |otherwise = if l1>l2 then l2*l2 else l1*l1
    
    