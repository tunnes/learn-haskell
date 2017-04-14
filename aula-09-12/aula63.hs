module Aula63 where

import Data.Monoid

--  GHCI> [1,2] <> [3,4] = [1,2,3,4]
--  GHCI> "Olha" <> "Mundo" = "OlhaMundo"
--  GHCI> (Sum 1) <> (Sum 2) = Sum {getSum = 3}
--  GHCI> (Product 1) <> (Product 2) = Product {getProduct = 2}



data Bolsa a = Nada | UmaCoisa a deriving Show

instance (Monoid a) => Monoid (Bolsa a) where
    mempty = Nada
    mappend (UmaCoisa x) (UmaCoisa y) = UmaCoisa (x <> y)
    mappend x Nada = x
    mappend Nada x = x
    
--  GHCI> UmaCoisa (Sum 19) <> UmaCoisa (Sum 20) = UmaCoisa (Sum {getSum = 39})

d0 :: (Monoid a, Ord a) => a -> Bool
d0 x = x<>x > mempty

-- mconcat 