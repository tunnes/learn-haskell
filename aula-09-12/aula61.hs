module Aula61 where

--  Type class é uma estrutura que define o comportamento deriving de varios tipos.3
--  Exemplos: Show, Ord, Eq..
--  Baseando-se no tipo Dia e usando o deriving o Haskell cria automaticamente a instancia do 
    data Dia = Segunda | Terca | Quarta | Quinta | 
               Sexta | Sabado | Domingo 
    
    data Numero = Zero | Um
--  Apagando o deriving Show, podemos criar uma instância Show Dia
    
    instance Show Dia where
        -- Show :: a -> String
        -- Como aqui dentro é Show dia temos 'show :: Dia -> String'
        show Segunda = "Segunda dia"
        show Terca   = "Segunda dia"
        show Quarta  = "Dia de futebol"
        show Quinta  = "Quase la"
        show Sexta   = "Dia de maldade"
        show Sabado  = "Estudar"
        show Domingo = "Falstao"
        
    instance Show Numero where
        show Zero = "0"
        show Um   = "1"
        
    instance Eq Numero where
        -- Geral (==) :: a -> a -> Bool
        -- Geral (==) :: Numero -> Numero -> Bool
        Zero == Um   = True
        Zero == Zero = True
        Um   == Zero = False
        Um   == Um   = False
    
        
        