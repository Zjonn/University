{-# LANGUAGE FlexibleInstances #-}

class Monoi a where
    (***) :: a -> a -> a
    e :: a
infixl 6 ***

infixr 7 ^^^
(^^^) :: Monoi a => a -> Integer -> a
a ^^^ 0 = e
a ^^^ n 
    | n < 0 = undefined
    | odd n = a *** k *** k
    | otherwise = k *** k
    where 
    k = a ^^^(div n 2)
    

    
data Mtx2x2 a = Mtx2x2 a a a a deriving Show

instance Monoi (Mtx2x2 Integer) where
    (***) (Mtx2x2 a1 a2 a3 a4) (Mtx2x2 b1 b2 b3 b4) = Mtx2x2(a1*b1+a2*b3) (a1*b2+a2*b4) (a3*b1+a4*b3) (a3*b2+a4*b4)
    e = Mtx2x2 1 0 0 1
    
fib::Integer->Integer   
fib 0 = 0
fib 1 = 1
fib n = x((Mtx2x2 0 1 1 1) ^^^ n)
    where x (Mtx2x2 a1 a2 a3 a4) = a2
 
