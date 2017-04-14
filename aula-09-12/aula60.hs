module Aula60 where

--  Type var, type parameter

    data Dia = Segunda | Terca | Quarta | Quinta | 
               Sexta | Sabado | Domingo deriving Show

--  Coisa é um tipo que possui um TYPE VARIABLE 'a'
--  e possui tres values constructors,
--  1 - UmaCoisa possui um campo do tipo a
--  2 - DuasCoisas possui dois campos do tipo 

--  POLIMORFISMO PARAMETRICO: A partir de uma type variable a é possivel 
--  montar estruturas especificas para cadas a fixado.
--  exemplo Coisa String, Coisa Int, ..
--  [String] [Int]..

--  Kind *      = Não tem variaveis. Kind um.
--  Kind * -> * = Não tem variaveis. Kind dois.
--  Obs: Quanto maior o kind mais complexo o tipo.


data Bolsa a = Vazia | UmaCoisa a |
               DuasCoisas a a deriving Show

instance (Eq a) => Eq (Bolsa a) where
    Vazia == Vazia = True
    (UmaCoisa x) == (UmaCoisa y) = x == y
    (DuasCoisas x y) == (DuasCoisas z w) = (x == z && y == w) || (x == w && y == z)
    _ == _ = False