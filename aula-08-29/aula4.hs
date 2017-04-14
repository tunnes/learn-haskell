module Aula04 where

--  Função com listas:
--  A função lista '!!' indice = item do indice.
--  O haskell utiliza letras minusculas para representar coisas de qualquerTipo.
--  A função 'id' recebe tudo e retorna tudo.

--  Tail retorna o ultimo item de uma lista.
--  Take 5 "Santos" = "Santo"
--  Drop 5 "Santos" = "s"
--  Reverse "Santos" = "sotnaS"
    
--  Função 'operador cons' é uma função recursiva, logo 
--  necessita de um parametro para parada. 
--  5 : [1,2,3] = [5,1,2,3]
--  5 : 1 : 2 : 3 : [] = [5,1,2,3]

--  Pattern Maching de listas:
--  O pattern maching de listas é baseado no operador cons
--  No haskell 'xs' significa uma lista:
    exemplo :: [Int] -> Int
    exemplo [] = 0
    exemplo (_:[]) = 1
    exemplo (_:_:[]) = 2
    exemplo (x:y:xs) = x + y + head xs

--  Exercicios:
--  A - Faca uma função que receba uma lista de Strings e devolva:
--      1.0 - Quando tiver nenhuma, uma lista vazia de Strings.
--      1.1 - Quando a lista tiver um elemento, seu reverso.
--      1.2 - Quando tiver dois elementos, o reverso da primeira 
--            palabra concatenada com o reverso da segunda
--      1.3 - Para 3 ou mais elementos, retorne o reverso da lista
    exA :: [String] -> [String] 
    exA [] = [""]
    exA (x:[]) = [reverse x]
    exA (x:y:[]) = [(reverse x)++(reverse y)]
    exA (x:y:xs) = reverse(x:y:xs)

--  B - Crie pattern matching para as situações:
--      1.0 - Com 6 Variaveis, ignorando o quinto elemento e o fim da lista
--      1.1 - Para o quarto elementos, o terceiro deve ser ignorado.
--      1.2 - Para 8 elementos, ignorando 6 deles.

    exB :: [Int] -> [Int]
    exB (a:b:c:d:_:xs) = (a:b:c:d:[])
    exB (a:b:_:d:[]) = (a:b:d:[])
--  exB (_:_:_:_:_:_:a:b:[]) = (a:b:[])

--  C - Dado, [7,4,5,6,8,10] em qual pattern matching esta se encaixa?
--      (x:y:z:w:ws) <--- Ok
--      (x:xs) <--- Ok
--      (y:x:_:zs) <--- Ok
--      (_:[])
--      (_:_:_:_:_:_:[]) <--- Ok
--      (_:_:_:_:_:_:ws)
--      (_:z:_:_:_:_:[]) <--- Ok
--      (_:z:_:_:_:_:_:[]) <--- Ok

--  Recursão no Haskell:

--  Soma recursiva:
    somarListas :: [Int] -> Int
    somarListas [] = 0
    somarListas (x:xs) = x + (somarListas xs)

--  Multiplicação recursiva:
    mult :: [Int] -> Int
    mult [] = 1
    mult (x:xs) = x * (mult xs)
    
--  Guards no Haskell:
--  Uma sintaxe do Haskell para checar condicoes booleanas ordenadamente
--  até encontrar uma expressao de retorno ou a palavra otherwise ou acabar.
    calcularImc :: Double -> Double -> String
    calcularImc peso altura
        | w < 19 = "Abaixo do peso"
        | w <= 25.8 = "Peso normal"
        | otherwise = "Acima do peso"
        where
            w = peso / (altura * altura)
            
--  Exemplo eliminando vogais e tudo que rolou nessa aula.
    eliminVogal :: String -> String
    eliminVogal [] = []
    eliminVogal (x:xs) 
        | elem x "AEIOUaeiou" = eliminVogal xs
        | otherwise = x : eliminVogal xs