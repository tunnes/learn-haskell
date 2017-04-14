module Aula02 where
--   Criado Tipos
--   Obs: :t retorna o tipo do dado.
--   Value constructore são os valores que o tipo pode assumir.
--   O 'deriving Show' serve para que criada uma função você possa retornar seu tipo,
--   em poucas palavras voce consegue mostrar na tela o seu tipo.

data DayWeek = Mon | Tue | Wed | Thu | Fri | Sat | Sun | OtherErro deriving (Show, Enum)

data DiaSemana = Segunda | Terca | Quarta | Quinta | Sexta | Sabado | Domingo | Erro deriving (Show, Enum)

--  Com o 'Pattern matching' Na entrada da função é possivel definir um valor padrão 
--  de entrada que se ajusta ao tipo em questão. Com isso só podemos fazer igual igual,
--  não da para fazer comparações. Como comportamento padrão podemos usar " _ " um wildcard.

agenda :: DiaSemana -> String
agenda Sexta = "Dia de maldade"
agenda Sabado = "Dia de ressaca"
agenda Domingo = "Dia de descanso"
agenda _ = "Dia de faculdade"

--  Para estas situação BOT TOM seria o retorno 'undefined' 
--  ou criar um novo value constructor 'Erro'.

numDia :: Int -> DiaSemana
numDia 1 = Domingo
numDia 2 = Segunda
numDia 3 = Terca
numDia 4 = Quarta
numDia 5 = Quinta
numDia 6 = Sexta
numDia 7 = Sabado
numDia _ = Erro
    
--  Podemos utilizar tambem o Deriving Enum, para que dentro de 
--  certas situações ele se complete sozinho.

--  Só roda com pontos separados.

-- 1 Faça a função traduzir PT que recebe uma DayWeek e retorna DiaSemana.
traduzPT :: DayWeek -> DiaSemana
traduzPT Mon = Domingo
traduzPT Tue = Segunda
traduzPT Wed = Terca
traduzPT Thu = Quarta
traduzPT Fri = Quinta
traduzPT Sat = Sexta
traduzPT Sun = Sabado
traduzPT _ = Erro
    
-- 2 Faça a função traduzir EN que recebe uma DiaSemana e retorna DayWeek.
traduzEN :: DiaSemana -> DayWeek
traduzEN Domingo = Mon 
traduzEN Segunda = Tue
traduzEN Terca = Wed
traduzEN Quarta = Thu
traduzEN Quinta = Fri
traduzEN Sexta = Sat
traduzEN Sabado = Sun
traduzEN _ = OtherErro 

-- Em uma empresa, é necessario calcular o salario a partir do dia de semana trabalhado
-- sabado a remuneração sofre um acrescimo de 50% todo domingo de 100% e no resto não há 
-- alteração. Faça uma função remunerar :: DiaSemana -> Double -> Double que implemente 
-- esta situação

remunerar :: DiaSemana -> Double -> Double
remunerar Sabado x = x+(x/2)
remunerar Domingo x = x*2
remunerar _ x = x

--  Tupula e arrays 
--  Tuplas: agrupamento fuxi de vakires, Estes oiden ser de tipos diferentes en cada cordenada
--  ex: (Bool, Int, Cor)
data Cor = Azul | Vermelho | Verde | Branco | Preto deriving Show

converter :: Cor -> (Int, Int, Int)
converter Azul = (0, 0, 255)
converter Branco = (255, 255, 255)
converter Preto = (0, 0, 0)
converter Verde = (0, 255, 0)
converter Vermelho = (255, 0, 0)

--  ConverterRGB :: (Int, Int, Int) -> Cor
converterRGB :: (Int, Int, Int) -> Cor
converterRGB (255, 255, 255) = Branco
converterRGB (255, 0, 0) = Vermelho 
converterRGB (0, 255, 0) = Verde
converterRGB (0, 0, 255) = Azul 
converterRGB (0, 0, 0) = Preto 

--  Faça uma função que receba uma Tupla da forma (Int, Int, Int, Int)
--  e devolva uma tupla com o dobro na primeira coordenada, o triplo na segunda, o quadruplo na terceira
--  e o quintuplo na última.
--  cap3

euHein :: (Int, Int, Int, Int) ->  (Int, Int, Int, Int);
euHein (num01, num02, num03, num04) = (num01*2, num02*3, num03*4, num04*5) 

--  Obs: Para converter qualquer coisa em String faço o uso do Show
--  Exemplo:

queRaiva :: (String, Bool) -> String
queRaiva (x, y) = x Show 