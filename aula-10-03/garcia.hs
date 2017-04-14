module GarciaAula where

import Control.Monad

imp :: Maybe Int
imp = do
    x <- Just 1  
    y <- Just (x+1) 
    return (x+y)

func :: Maybe Int
func = Just 1 >>= \x -> Just (x+1) >>= \y -> Just(x+y)

main :: IO ()
main = print "Ola mundo!"
