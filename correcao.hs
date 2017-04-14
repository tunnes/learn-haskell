module Correcao where
-- B 1
--  :t (\x -> ["Ola"++x]) []

ex02::Maybe Int-> Maybe Int-> Maybe Int
ex02 x y = fmap min x <*> y

data Tupla a = Tupla a a deriving Show

-- Correcao> :t Tupla "W" "M"
-- Tupla "W" "M" :: Tupla [Char]