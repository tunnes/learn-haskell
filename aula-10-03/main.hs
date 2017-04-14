module Main where
    import Control.Monad
    
    -- main :: IO ()
    -- main = do 
    --     print "Digite seu nome: "
    --     y <- getLine
    --     print $ "Ola " ++ y

    -- main :: IO ()
    -- main = do 
    --     print "Digite um numero: "
    --     x <- readLn :: IO Int
    --     print "Digite um numero: "
    --     y <- readLn :: IO Int
    --     print $ show  $ x + y
        
    -- main :: IO ()
    -- main = putStrLn "Digite um numero: " >> (readLn :: IO Int) >>= \x -> putStrLn "Digite um numero: " >> (readLn :: IO Int) >>= \y -> print $ show $ x + y 
    
    main :: IO ()
    main = putStrLn "Digite uma palavra: " >> getLine >>= \palavra -> print $ reverse palavra 

    
    -- faca um programa q leia do teclado uma palavra e retorne seu reverso
    -- main :: IO ()
    -- main = putStrLn "Digite um nome: " >> getLine >>= \y ->putStrLn $ "Ola " ++ y