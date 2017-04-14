module Aula5 where

--  MAP ------------------------------------------------------------------------
--  O map pega uma função e um array sendo que ele ira executar  
--  essa função para todos os elementos do array recebido em 
--  poucas palavras ele substitui o for.
--      map dobro [1,2,3] = [dobro 1, dobro 2, dobro 3]

--  List Comprehension é a mesma coisa que um map porem o map 
--  é muito mais legivel como no exemplo abaixo.
--      [dobro x | x <- [1,2,3]]

--  FILTER ---------------------------------------------------------------------
--  O filter recebe uma condição e executa a ação somente esta condicao
--  for verdadeira, em termos tecnicos ela verifica o predicado veja o 
--  retornando 'true' ou 'false' exemplo abaixo:
--  filter even [1..10] = [2,4,6,8,10]

--  Funcoes feitas aqui possuem um corpo, ou seja possuem uma definição.
    dobro :: Int -> Int
    dobro x = x*2

--  LAMBDA ---------------------------------------------------------------------   
--  Função sem corpo que representa um valor, do tipo função.    
--  No Haskell é possivel criar funções anonimas ou seja funções sem corpo
--  são chamadas em Haskell de lambida syntaxe = \x
    exemploLabda = map (\x -> 3*x) [1,2,3]

--  CURRYING ------------------------------------------------------------------- 
--  É o ato de chamar a função com menos parametros que o definido
--  o resultado disso é uma função com os parametros restantes
    somarTres :: Int -> Int -> Int -> Int
    somarTres a b c = a + b + c
    
--  Exemplos:
--  Aula5> let somar45 = somarTres 4 5
--  Aula5>  somar45 1 = 10
--  Aula5> let somar9 = somarTres 9
--  Aula5> somar9 1 1 = 11
--  Aula5> let f = map (*2)
--  Aula5> f [1..10] = [2,4,6,8,10,12,14,16,18,20]
 
--  HIGH-ORDER-FUNCTIONS -------------------------------------------------------
--  Em Haskell as funções são tratadas como valoores comuns ou 
--  seja, são passadas como parametros ou retornadas como. 
--  O map e o filer são high-order functions.

--  COMPOSIÇÃO DE FUNÇÕES ------------------------------------------------------
--  Bom¹.. Aula5> dobro . (\x -> x+1) $ 3 = 8
--  Bom².. Aula5> dobro . (\x -> x+1) . (\x -> 10+x) $ 3 = 28
--  O operador (.) recebe duas funções e retorna apenas uma.
--  (.) :: (b -> c) -> (a -> b) -> a -> c
--  head::[Int] -> Int
--  reverse::[Int] -> [Int]

--  FOLDL -----------------------------------------------------------------------
--  O fold do Haskell é equivalente ao reduce do JavaScript functiona como um for 
--  concatenador, spara entender melhor vejamos:
--  Aula5> :t foldl = foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b
--  Aula5> foldl (\soma vi -> soma + vi) 1 [1,2,3] = 7
--  Aula5> foldl (\multi vi -> multi*vi) 1 [1..5] = 120
--  Aula5> foldl (\cont _ -> cont+1) 0 "HASKELL" = 7

--  C*, D, E, 5.2

    func :: String-> Int -> String
    func x y = x ++ show y
    
    ehImpar :: Int -> Int -> Int
    ehImpar cont x
        | odd x = cont + 1
        | otherwise = cont
    
    contarVogais :: Int -> Char -> Int
    contarVogais cont x
        | elem x "AEIOUaeiou" = cont + 1
        | otherwise = cont


    