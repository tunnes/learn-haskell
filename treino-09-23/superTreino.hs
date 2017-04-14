module SuperTreino where

-- Crie um tipo Unidade com um value constructor chamado unidade, sendo instancia de Show, 
-- Crie uma instancia de Monoid para unidade e defina seu mempty e mappend os justificando 
-- Resposta:
-- O tipo unidade só possui um value constructor logo o mesmo é o mappend e o mempty.

-- import Data.Monoid

-- data Unidade = Unidade deriving Show
-- instance Monoid Unidade where 
--     mempty = Unidade
--     mappend Unidade Unidade = Unidade
------------------------------------------------------------------------------------------------------------------------------

-- Considere a função

-- data Tupla a = Tupla a a deriving Show 
-- instance Functor Tupla where
--     fmap f (Tupla x y) = Tupla (id f $ y) (id f $ x)

-- Qual o valor da expressão fmap (\x-> x > 3) $ Tupla 4 2?
-- R: Tupla False True

-- Qual o valor da expressão :t Tupla 'K' 'L'?
-- R: Tupla 'K' 'G' :: Tupla Char 

-- Qual o valor de fmap id $ Tupla 4 7
-- R: Tupla 7 4

-- Faça uma instancia ed Eq para Tupla, onde duas Tuplas são iguais se o primeiro elemento de uma for
-- igual ao segundo elemento da outra
-- R:
--   instance (Eq a) => Eq (Tupla a) where
--      (Tupla a b) == (Tupla c d) = (a == d) 

-- Qual o valor de :t Tupla () ()?
-- R: Tupla () () :: Tupla ()

-- Faca uma instancia de Show para Tupla x y que mostre na tela "fst: x =? and: y":
-- R:
--    instance (Show a) => Show (Tupla a) where
--       show (Tupla x y) = "fst: "++ (show x) ++ " =? and:" ++ (show y)

-- Do jeito que está é possivel calcular a expressão Tupla 1 2 >= Tupla 2 3? Justifique.
-- R: Não pois não foi criada/declarada nenhuma instancia de Ord e Eq (Ordenação de elementos, e equitação seila..), 
--    logo não é possivel comprar maior ou menor.
------------------------------------------------------------------------------------------------------------------------------

-- Crie o tipo Bin que possua os values constructors Zero e Um como instancia de Show
    data Bin = Zero | Um deriving (Show, Eq)
    
-- Cria o tipo Pixel com o value constructor Pixel contendo um campo (Bin,Bin,Bin) e instancia de Show.
    data Pixel = Pixel (Bin, Bin, Bin) deriving (Show, Eq)
    
-- Crie o tipo Color comos value constructors Red, Green, Blue, White, Black.
    data Color = Red | Green | Blue | White | Black deriving (Show, Eq)
    
-- Crie uma função toBin que transforma Int em Bin.
    toBin::Int->Bin
    toBin 0 = Zero
    toBin 1 = Um
    
-- Crie uma função que transforma Bin em Int.
    toInt::Bin->Int
    toInt Zero = 0
    toInt Um = 1
    
-- Crie a função que receba uma Pixel e devolva Maybe Color, (Dica: Red corresponde a (Um, Zero, Zero).
    funPix::Pixel->Maybe Color
    funPix (Pixel (Um, Zero, Zero)) = Just Red
    funPix (Pixel (Zero, Zero, Zero)) = Just Black
    funPix (Pixel (Um, Um, Um)) = Just White
    funPix (Pixel (Zero, Um, Zero)) = Just Green
    funPix (Pixel (Zero, Zero, Um)) = Just Blue
    funPix _ = Nothing
-- Faca uma função filterRed que recebe uma lista de Pixel e retorna uma lista de MaybeColor contendo apenas Just Red.
    filterRed :: [Pixel] -> [Maybe Color]
    filterRed xs = map (\x -> funPix x) $ (filter (\a-> funPix a == Just Red) xs)
--  Obs: Para comparação foi acrescentado aos tipos relacionados a função
--       a instancia de Eq, e utilizado o map para conversão.

-- Monte uma expressão (Usando o GHCI) para o que se pede:
-- Lambda para verificar se uma lista não é nula.
-- (\xs -> xs \= [])

-- Lambda para filtrar palavras de tamanho maior que 30 de um Array de Strings xs.
-- (\xs -> filter (\palavra -> (length palavra) > 30) xs)

-- Lambda para receber uma String s e retorna-la em ordem reversa sendo do tipo Maybe String.
-- (\x -> Just (reverse x) )

-- Lambda para o maior entre os numeros x e 12
-- (\x -> x > 12)

--  De o tipo das seguintes funçõe:
--  (\x -> ["Ola"++ x]) :: []->[String]
--  \x -> ["Ola"++ x]

--  (\x -> Just $ x == "True") :: String -> Maybe Bool
--  (\x -> Just $ x == "True")


--  Faca funcoes (dando o tipo da funcao e da forma mais generica possivel) para o que se pede
--  Uma funcao que receba uma lista e a devolva sem os dois primeiros elementos(Dica: pattern matching)
    fun01::[a]->[a]
    fun01 (a:b:xs) = xs
--  Uma funcao que receba dois Maybe Int e retorne o menor deles (Dica: Just x)
    fun02::Maybe Int -> Maybe Int -> Maybe Int
    fun02 (Just x) (Just y)
               | x > y = Just y
               | otherwise = Just x
    fun02 _ _ = Nothing
        
--  Ou do jeito Luciano do Youtube
--  f x y = min <$> x <*> y
    strokes::Maybe Int -> Maybe Int -> Maybe Int
    strokes x y = fmap min x <*> y

--  Uma função que recebe qualquer valor x e retorne x
    fun03::a->a
    fun03 a = a
--  Uma funcao que receba um vetor de Int (Tamanho qualquer) e retorne a soma dos quadrados dos elementos 
--  Ex: se a entrada for [0,2,1] o retorno é 5;
    fun04::[Int]->Int
    fun04 xs = foldl (\item cont-> cont + item^2) 0 xs
    
---------------------------------------------------------------------------------------------------------------------------------------------------
--  Lista Gigante.
--  A - Filtre os numeros pares de uma lista:
    exA :: [Int] -> [Int]
    exA xs = filter (\x -> ( mod x 2 == 1 )) xs

--  B - Filtre os numeros impares de uma lista:
    exB :: [Int] -> [Int]
    exB xs = filter (\x -> ( mod x 2 == 0 )) xs

--  C - Filtre os números primos de uma lista (Fazer uma funcao de checar primos):
    exC :: [Int] -> [Int]
    exC xs = filter (\x -> ( (==) 2 $ length $ (\var -> [x | x <- [1..var], mod var x == 0]) x)) xs
 
--  D - Faça uma função que receba uma lista de inteiros e retorne o dobro de todos 
--      eliminando os múltplos de 4:
    exD :: [Int] -> [Int]
    exD xs = filter (\x -> ( mod x 4 /= 0 )) xs
    
--  E - Faça uma função que receba uma função (String -> String) e uma String e retorne o reverso da 
--      String que consiste na aplicação da função recebida no outro parâmetro
    exE :: (String -> String) -> String -> String
    exE func palavra = reverse $ func palavra
    
--  F - Monte um currying da função (hip :: Double -> Double -> Double) (hip x y = sqrt (x*x + y*y))
    exF1 :: Double -> Double -> Double
    exF1 x y = sqrt (x*x + y*y)
    
    exF2 :: Double -> Double
    exF2 = exF1 1
    
--  G - Dê um jeito de aplicar a função acima em uma lista de Doubles:
    exG :: [Double] -> [Double]
    exG xs = [ exF2 x | x <- xs] 

--  H - Elimine todas as hipotenusas que não dê 1 de uma lista: (Dê seu jeito!)
--      Formula: a² = b² + c²
    exH :: [(Double, Double)] -> [(Double, Double)]
    exH xs  = filter (\(cat1, cat2) -> ((\x y -> sqrt (x^2 + y^2)) cat1 cat2 == 1)) xs
    
--  I - Faça um tipo Dia contendo os dias da semana. Faca uma função que receba 
--      uma lista de Dias e filtre as Terças.
--      Obs: Usei a instancia de 'Eq' e 'Ord' para poder fazer comparações entre os tipos..
    
    data Dia = Domingo | Segunda | Terca | Quarta | Quinta | Sexta | Sabado deriving (Show, Eq, Enum, Ord)
    
    exI :: [Dia] -> [Dia]
    exI xs = filter (\x -> (x /= Terca)) xs
    
--  J - Faça o tipo Dinheiro que contenha os campos valor e correncia (Real ou Dolar) e uma função que converta
--      todos os dinheiros de uma lista para dolar (e outra para real.):

    data Dinheiro = Real {valor :: Double, correncia :: Double} | Dolar {valor :: Double, correncia :: Double} deriving (Show, Eq, Ord)
    
--  *Lista> exJ4Real (Real 1 2) caralho

    exJ4Dolar :: [Dinheiro] -> [Dinheiro]
    exJ4Dolar xs = map (\ (Real x y) -> (\(Real val cor) -> Dolar 3.20 (cor*val)) (Real x y)) xs
    
    exJ14Real :: [Dinheiro] -> [Dinheiro]
    exJ14Real xs = map (\ (Dolar x y) -> (\(Dolar val cor) -> Real 0.312437 (cor*val)) (Dolar x y)) xs
    
--  K - Filtre todos os Dolares de uma lista de Dinheiro.
    ehDolar :: Dinheiro -> Bool
    ehDolar (Real _ _) = False
    ehDolar (Dolar _ _) = True
    
    exK :: [Dinheiro] -> [Dinheiro]
    exK xs = filter (\x -> (ehDolar x)) xs 
    
--  L - Faça um fold para somar todos os Dolares da lista.
    somarDolar :: Dinheiro -> Dinheiro -> Dinheiro
    somarDolar (Dolar valCont cotCont) (Dolar val cot) =  Dolar (valor(Dolar val cot) + valor(Dolar valCont cotCont)) 3.20

    exL :: [Dinheiro] -> Dinheiro
    exL xs = foldl somarDolar (Dolar 0 0) xs
    
--  M - Faça um fold para contar o número de Dolares da lista.
    contDolar :: Int -> Dinheiro -> Int
    contDolar cont (Dolar _ _) = cont + 1
    contDolar cont (Real _ _) = cont

    exM :: [Dinheiro] -> Int
    exM xs = foldl contDolar 0 xs
    
--  N - Faça um fold para contar negativos
    contarNeg :: Int -> Int -> Int
    contarNeg cont item
        | item < 0 = cont + 1
        | otherwise = cont
        
    exN :: [Int] -> Int    
    exN xs = foldl contarNeg 0 xs
    
--  O - Faça um fold para contar letras 'P'
    contarP :: Int -> Char -> Int
    contarP cont item
        | item == 'P' = cont + 1
        | otherwise = cont
    
    exO :: [Char] -> Int
    exO xs = foldl contarP 0 xs
    
--  P - Faça um fold para contar Sabados em uma lista de [DiaSemana].
    contarSab :: Int -> Dia -> Int
    contarSab cont dia
        | dia == Sabado = cont + 1
        | otherwise = cont
        
    exP :: [Dia] -> Int
    exP xs = foldl contarSab 0 xs
    
--  Q - Faça um fold para contar Trues de uma lista de Bool.
    contarTrues :: Int -> Bool -> Int
    contarTrues cont logic
        | logic == True = cont + 1
        | otherwise = cont
    
    exQ :: [Bool] -> Int
    exQ xs = foldl contarTrues 0 xs
    
--  R - Faça um fold para concatenar o reverso de palavras de uma lista de Strings
--      Haskellwave
    exR :: [String] -> String
    exR xs = foldl (\cont palav -> cont ++ reverse palav) "" xs 
    
--  S - Faça um fold que a partir de uma lista de [DiaSemana] retorne a soma dos dias. Exemplo
--      [Segunda, Segunda, Quarta] deve retornar 5.
--      Mas quem sabe um dia eu não escreva uma cançao p voce!! Não confunda ética com éter!!
    equivaDia :: Int -> Dia -> Int
    equivaDia cont Segunda = cont + 1
    equivaDia cont Terca   = cont + 2
    equivaDia cont Quarta  = cont + 3
    equivaDia cont Quinta  = cont + 4
    equivaDia cont Sexta   = cont + 5
    equivaDia cont Sabado  = cont + 6
    equivaDia cont Domingo = cont + 7
    
    exS :: [Dia] -> Int
    exS xs = foldl equivaDia 0 xs

    
--  Acabei porra.