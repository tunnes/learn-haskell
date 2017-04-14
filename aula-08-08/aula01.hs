module Aula1 where

-- :! Para usar comando linux.
-- Na aula passada definimos a seguinte função:
-- :l Para compilar, ou seja load
-- :r Para recompilar, ou seja reaload

--  Tipando funções:
--  nomeDaFuncao :: parametros -> parametros -> ...
--  -> O "::" Significa as type. 
    somar :: Int -> Int -> Int
    somar x y = x+y
    
    quaseDobro :: Double -> Double
    quaseDobro x = 2.1*x
    
-- -> O ":t nomeDaFuncao" Retorna qual o tipo da função.
    f :: Int -> Bool
    f a = a >= 3
    
    str :: String
    str = " Quase ola mundo"
    
    str2 :: String -> String 
    str2 hhh = "Ola" ++ hhh

--  Obs: Função nativa do haskell revese recebe um array 
--  de string e reverte.
    rev2 :: String -> String -> String
    rev2 n s = reverse n ++" "++ (reverse s)
    
    algo :: String -> String
    algo y = reverse(reverse y)
    
--  Trabalhando com Listas ---------------------------------------------------------------------
--  Exemplo:
    umalista :: [Int]
    umalista = [0 .. 250]
        
--  f2 x = (reverse x) + [1,2,3]
    auto :: [Int]
    auto = [2*x | x <- [0 .. 200], x >= 5, x <= 190]
    
--  Ex01 Gere a lista [5,7,9,11,13,17,19,21]
    result01 :: [Int] 
    result01 = [2*x+1 | x <- [2..10], x /= 7]
--  ou    
    result011 = [x+2 | x <- [2..20], mod x 2 == 1, x /= 13]
    
--  Ex02 Faça uma função que recebe via parâmetro uma lista de inteiros e retorne uma outra
--  lista com seus número diminuidos em 2.
    result02 :: [Int] -> [Int]
    result02 lista = [x-2 | x <- lista]

--  Ex03 Faça uma função que recebe via parâmetro uma lista de inteiros e retorne uma outra 
--  lista com seus número diminuidos em 7 e em sua ordem reversa.
    result03 :: [Int] -> [Int]
    result03 lista = reverse[x-7 | x <- lista]
    
    outraLista :: String
    outraLista = ['A'..'z']

    ultimaLista :: [String]
    ultimaLista = [x ++ "AA" | x <- ["Ola","Mundo"]]
    
--  Composição de Funçoes -----------------------------------------------------------------------
--  Exemplo:
    primeiraFuncao :: String -> Int
    primeiraFuncao x = 1+length x
    
    segundaFuncao :: Int -> Bool
    segundaFuncao x = x >= 19 
    
--  Obs: Duplas chamada oral lista no moodle.. Henrique Somos o 4º time semana 4 