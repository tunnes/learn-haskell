module Aula62 where

data Bolsa a = Vazia | UmaCoisa a |
               DuasCoisas a a deriving Show

instance (Eq a) => Eq (Bolsa a) where
    Vazia == Vazia = True
    (UmaCoisa x) == (UmaCoisa y) = x == y
    (DuasCoisas x y) == (DuasCoisas z w) = (x == z && y == w) || (x == w && y == z)
    _ == _ = False

--  MONOIDES
--  Um conjunto M com uma operação binaria <> :: M -> M -> M (mappend) é chamado de monoide
--  se satisfizer:
--  A - Elemento Neutro (E!eEM)(VmeM) e <> m = m : menpty o nome no haskell
--  B - ASSOCIATIVIDADE
    
--  Esta estrutura é um type class no Haskell.
--  Associativo é tanto faz a ordem.
    
    
    

