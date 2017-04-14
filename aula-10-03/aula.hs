module Aula where
    
    import.Control.Moned
--  toda a moed é um funtor.
--  Isto se chama transformação natural, uma função que mapeia a si mesma.
--  Obs: Não é possivel compor funções com retorno de funtores..
    func:: a -> [a]
    fun x = [x]
    
--  Dps escrever algo sobre.
--  Seta de Kleisli: <=<

--  Monadas(Monads)
--  Uma monad é um monoide na categoria dos (endo)funtores.
--  Este monoide é composto por:
--      -> Um funtor:   M
--      -> Um mappend:  return
--      -> O mempty:    join
--  o retur é o mesmo que um id porem para funtores.

--  Operador bind

--  Exercicios:
--  a) [10] >>= \x -> [9*x] = 90
--  b) Just 0 >>= \x -> Just x Just 0
--  c) Just 7 >>= return Just 7
--  d) Just 10 >>= \x -> Just (5*x) Just 50
--  e) Just "OLA" >>= \x -> Just (x ++ " MUNDO") Just "Ola Mundo"
--  h) Just 4 >>= \x -> Nothing Nothing
--  i) Nothing >>= \x -> Just (5*x) Nothing
--  j) Just 1 >>= \x -> Just (x+1) >>= \y -> Just(x+y) Just 3
