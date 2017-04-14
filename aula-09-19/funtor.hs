module Funtor where

-- data Maybe a = Nothing | Just a

{-- 
data Henrique = Henrique deriving Show

data Bruna = Bruna deriving Show

data Vampiro a = Vampiro a deriving Show

instance Functor Vampiro where
    fmap f (Vampiro pess) = Vampiro (f pess)
    
amar :: Henrique -> Bruna
amar Henrique = Bruna
--}


safeDiv :: Double -> Double -> Maybe Double
safeDiv x 0 = Nothing
safeDiv x y = Just (x / y)

validar :: String -> Maybe String
validar "" = Nothing
validar x  = Just x

