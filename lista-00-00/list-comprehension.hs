module ListCompression where

--  Exercício 2.1 
--  Gere as listas [1,11,121,1331,14641,161051,1771561] e 
--  [1,2,3,5,6,7,9,10,11,13,14,15,
--  17,18,19,21,22,23,25,26,27,29,30,31,33,34,35,37,38,39] usando list comprehension.

    resultado01 = [ 11^x  | x <- [0..7]]
    
--  Obs: Em todas as linguagens o mod opera apenas numeros inteiros, seu filho da puta.
    resultado02 = [x | x <- [0..40], (mod x 4) /= 0]
    
--  Exercício 2.2 Gere as listas
--  1. ["AaBB", "AbBB", "AcBB", "AdBB", "AeBB", "AfBB", "AgBB"]
    resultado03 = ["A" ++ [x] ++ "BB"| x <- ['a'..'g']]
--  2. [5,8,11,17,20,26,29,32,38,41]
    resultado04 = [ x + 2 | x <- [0..40], (mod x 3) == 0, (mod x 4) /= 0]
--  3. [1.0,0.5,0.25,0.125,0.0625,0.03125] 3
--  1,2,4,8,16,32
    --[1,2,4,8,16,32]
    resultado05 = [ 1 / x | x <- [1,2,4,8,16,32]]
    resultado06 = [ 2^(x) | x <- [1..5]]
    resultado07 = [ 1 / (2^x) | x <- [1..5]]
    
    