module Aula3 where

--  Tipos algebricos de dados:

--  O tipo pessoa possui dois value contructors - Fisica e Juridica onde o primeiro
--  possui tres campos e o segundo possui dois campos..

--  Obs: Até os tipos value constructor são funções no Haskell.

-- Tipos de enumeração seriam os tipos com value contructors que não carregam campos.

data Ponto = Ponto Double Double deriving Show

-- Tipo Enumeração
data Sexo = M | F deriving Show

--  Tipo Algebrico
--  Record sintax é um 'Get' vulgo função de projeção para a extração do valor inserido no campo nomeado, 
--  tambem serve para dar nome ao campo do valor.

data Dinheiro = Real {valorDinheiro :: Double} | Dolar {valorDinheiro :: Double} | Euro {valorDinheiro :: Double} deriving Show

--  Tipo Algebrico
--  data Pessoa = Fisica String Sexo Dinheiro | Juridica String deriving Show
--  Record Syntax é a maneira de escrever um novo tipo, nomeando seus campos.

data Pessoa = Pessoa {nomePessoa :: String, sexoPessoa :: Sexo, salarioPessoa :: Dinheiro} deriving Show    
--  Quantos value constructor há em dinheiro?
--  Resposta: Três 03
--  Quantos campos há em cada value constructor? 
--  Resposta: Um 01    
--  Qual o tipo de dolar?
--  Resposta: Doble -> Dinheiro

--  Quando questionado o tipo ':t' ele retorna o valor não informado e o ultimo o tipo
--  Exemplo: Dolar :: Double -> Dinheiro

--  ==========================================================================================
--  Exemplo: Em uma empresa, as mulheres ganham 500 reais de bonus e 
--  mérito e os homens 300.
--  Tem como substituir o parenteses por sifrões

--  Na filial Americana homens e mulheres recebem 180 Dolares a mais.

bonus :: Pessoa -> Pessoa
bonus (Pessoa nome M (Real salario)) = Pessoa nome M (Real $ salario + 300)
bonus (Pessoa nome F (Real salario)) = Pessoa nome F (Real $ salario + 500)
bonus (Pessoa nome sexo (Dolar salario)) = Pessoa nome sexo $ Dolar $ salario + 180
bonus pessoa = pessoa

--  Obs¹: Para retornar o mesmo valor basta deixar em caixa baixa mano.
--  Obs²: Variavel = Minusculo || Fixo == Maiusculo
--  Obs³: Errei pois não estava utilizando parenteses.. "/


--  Exemplo:
--  A - Funcao somar dinheiro
--  B - Funcao casamento, a resposta desta funcao deve conter a concatenação do nome do casal

conversaoDolar :: Dinheiro -> Dinheiro
conversaoDolar (Real valor) = Dolar (0.312437*valor)
conversaoDolar (Euro valor) = Dolar (1.13*valor)
conversaoDolar x = x

conversaoEuro :: Dinheiro -> Dinheiro
conversaoEuro (Real valor) = Euro (0.275992226*valor)
conversaoEuro (Dolar valor) = Euro (0.88*valor)
conversaoEuro x = x

conversaoReal :: Dinheiro -> Dinheiro
conversaoReal (Dolar valor) = Real (3.20*valor)
conversaoReal (Euro valor) = Real (3.62*valor)
conversaoReal x = x

somarGrana :: Dinheiro -> Dinheiro -> Dinheiro
somarGrana (Real valor) dinheiro = Real (valor + (valorDinheiro(conversaoReal dinheiro)))
somarGrana (Dolar valor) dinheiro = Dolar (valor + (valorDinheiro(conversaoDolar dinheiro)))
somarGrana (Euro valor) dinheiro = Euro (valor + (valorDinheiro(conversaoEuro dinheiro)))

-- Função casamento.
--casamento :: Pessoa -> Pessoa -> Pessoa
--casamento pessoa pessoa = pessoa (pessoa nomePessoa) + (pessoa nomePessoa)

-- teste

casamento :: Pessoa -> Pessoa -> String
casamento (Pessoa n1 sexo1 (Real s1)) (Pessoa n2 sexo2 (Real s2)) = n1 ++ n2

-- na tela do ghci: casamento (Pessoa "Tarcisio" M (Real 1.1)) (Pessoa "Lily" F (Real 1.1))
