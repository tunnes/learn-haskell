module Lista where

--  Exercício D
--  Filtre os números primos de uma lista (Fazer uma funcao de checar primos):

--  Números primos são os números naturais que têm apenas dois divisores diferentes 01 e ele mesmo.
--  A função divisoresPossiveis retorna o numero de divisores possiveis tendo como restante 0 
--  sakem abaixo:
    divisoresPossiveis :: Int -> [Int]
    divisoresPossiveis n = [x | x <- [1..n], mod n x == 0]

--  Uma função para verificar se o numero é primo ou não:
    ehPrimo :: Int -> Bool
    ehPrimo x = length(divisoresPossiveis x) == 2
    
--  Para apresentação mais didática...    
--  mostraOsPrimos :: [Int] -> [Int]
--  mostraOsPrimos xs = filter ehPrimo xs
    
--  Uma função usando Labda e os caralhos a quatro:

--  mostraOsPrimos :: [Int] -> [Int]
--  mostraOsPrimos xs = filter (\x -> ( (==) 2 $ length $ divisoresPossiveis x)) xs
    
    mostraOsPrimos :: [Int] -> [Int]
    mostraOsPrimos xs = filter (\x -> (length $ divisoresPossiveis x) == 2) xs

--  Exercício D
--  Faça uma função que receba uma lista de inteiros e retorne
--  o dobro de todos eliminando os múltplos de 4:
    eliminaMultiplos :: [Int] -> [Int]
    eliminaMultiplos xs = filter (\x -> ( mod x 4 /= 0 )) xs

--  Exercício E    
--  Faça uma função que receba uma função (String -> String) e uma String e 
--  retorne o reverso da String que consiste na aplicação da função recebida 
--  no outro parâmetro.
    funcaoParam :: String -> String
    funcaoParam x = reverse x
    
    qualquerNome :: (String -> String) -> String -> String
    qualquerNome funsom estring = funsom estring
    
    vejamos :: (String -> String) -> String -> String
    vejamos funsom estring = reverse $ funsom estring
    
--  Obs: Acho que é isso mano não entendi direito o enunciado..  --'

--  Exercício 5.2 
--  Faça uma função que retorne o desvio padrãor de um [Double]
--  usando foldl. O desvio padrão de um vetor é dado por σ =
--  é a média deste vetor.

--  Passo 01: mediaAritimetrica soma do array divido pelo tamanho do mesmo.
    somarLista :: [Double] -> Double
    somarLista [] = 0
    somarLista (x:xs) = x + (somarLista xs)
    
    mediaAri :: [Double] -> Double
    mediaAri xs = (somarLista xs) / (fromIntegral . length $ xs)
    
--  Passo 02: variancia das amostras:
    variancia :: [Double] -> Double
    variancia xs = (foldl (\cont item -> cont + ((item - (mediaAri xs))^2) ) 0 xs) / (fromIntegral . length $ xs)
    
        
--  Passo 03: Desvio  só mandar a raiz de four nessa porra chata pra caralho
    desvioPadrao :: [Double] -> Double
    desvioPadrao xs = sqrt (variancia xs) 
    
--  Obs¹: Para testes e tals: http://mundoeducacao.bol.uol.com.br/matematica/variancia-desvio-padrao.htm
--  Obs²: [15,12,16,10,11]

--  Obs³: https://prezi.com/lmkdsp4f9ekr/hasktris/