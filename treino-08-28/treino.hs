module Treino where

--  Criando e tipando funções:
    funcaoQualquer :: Double -> Double -> Double
    funcaoQualquer umNumero outroNumero = umNumero + outroNumero
    
--  Criando compreenções de listas:
    criarCompreencao :: Int -> [Int] 
    criarCompreencao limite = [ x | x <- [0..limite]]
    
--  Criando tipos de enumeracao e seus 'Value Constructors'  
    data Semestres = Primeiro | Segundo | Terceiro | Quarto | Quinto | Sexto deriving Show
    
--  Criando 'Pattern Matching'
    ehManeiro ::  Semestres -> String
    ehManeiro Primeiro = "Bosta"
    ehManeiro Segundo = "Legalzinho"
    ehManeiro Terceiro = "Maneiro"
    ehManeiro Quarto = "Maneiro pra caralho"
    ehManeiro _ = "Seila"
    
--  Trabalhando com 'Tuplas'
    dobraTupla :: (Int, Int, Int, Int) -> (Int, Int, Int, Int)
    dobraTupla (num1,num2,num3,num4) = (num1*2, num2*2, num3*2, num4*2)

    verificaTupla :: (Int, Int, Int, Int) -> String
    verificaTupla (1,2,3,4) = "Ta em certo"
    verificaTupla _ = "ta errado"
    
--  Criando e trabalhando com tipos 'algebricos':
    data Ponto  = Ponto Double Duble  deriving Show
  
  
--  Criando tipos algebricos com 'record syntax':
    data Cordenada = Cordenada {valorX :: Double, valorY :: Double} deriving Show

--  Trabalhando com tipos algebricos de 'record syntax':
    somaCordenada :: Cordenada -> Cordenada -> Cordenada
    somaCordenada (Cordenada x1 y1) (Cordenada x2 y2)  = Cordenada (x1+x2) (y1+y2)

     data DiaMes = Dia (limiteDaRazao Int) deriving Show
    
     limiteDaRazao :: Int -> DiaMes
     limiteDaRazao n | n < 4 || n > 8 = error "Invalid number of resistor bands" 
                     | otherwise      = Dia n

    