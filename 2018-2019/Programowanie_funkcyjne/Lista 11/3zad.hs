{-# LANGUAGE Rank2Types #-}

newtype Church = Church (forall a. (a -> a) -> (a -> a))
church :: Integer -> Church
church 0 = Church (\f -> \x -> x)
church n = Church (\f -> \x -> f (case church (n-1) of Church n -> n f x))

unchurch :: Church -> Integer
unchurch (Church cn) = cn (+ 1) 0

isZero :: Church -> Bool 
isZero (Church n) = n (\x -> False) True 

aux_succ n f x = f (n f x)
succ' (Church n) = Church (aux_succ n)

plus' m n f x = m f (n f x)
multiply' m n f x = m (n f) x
exp' m n f x = (n m) f x

-- https://karczmarczuk.users.greyc.fr/Essays/church.html
dec (Church n) = 
    Church (\s z -> fst (n (\(_,x)->(x,s x)) (undefined,z)))

dec' (Church n) = fst (n (\(_,x)->(x,succ' x)) (undefined, (church 0)))

sub n (Church m) = m dec n
sub' n (Church m) = m dec' n

instance Eq Church where
    Church n == Church m = isZero (sub (Church n) (Church m)) && isZero (sub (Church m) (Church n))

instance Ord Church where
    compare (Church n) (Church m) = if (Church n) == (Church m) 
        then EQ 
        else if isZero ((Church n) - (Church m))
            then LT
            else GT

instance Show Church where
    show n = show (unchurch n)

instance Num Church where
    Church n + Church m = Church (plus' n m)
    Church n - Church m = sub (Church n) (Church m)
    Church n * Church m = Church (multiply' n m)
    fromInteger n = church n 



