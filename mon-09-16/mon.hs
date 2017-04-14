module Monitoria2 where

import Data.Monoid

data TipoProduto = Informatica | Livro | Total deriving Show
data Produto = Produto{valor::Double, tp::TipoProduto} | ProdutoVazio deriving Show

prod1 = [(Produto 100.00 Informatica)]
prod2 = prod1 ++ [(Produto 80.00 Livro)]

instance Monoid Produto where
    mempty  = ProdutoVazio
    mappend a ProdutoVazio = a
    mappend ProdutoVazio a = a
    mappend ProdutoVazio ProdutoVazio = ProdutoVazio
    mappend (Produto vl _) (Produto vl2 _) = (Produto (vl + vl2) Total