{-# LANGUAGE KindSignatures, MultiParamTypeClasses, FlexibleInstances #-}

import Data.List (unfoldr)
import Data.Bool (bool)

main :: IO ()
main = return ()

(><) :: (a -> b) -> (a -> c) -> a -> (b,c)
(f >< g) x = (f x, g x)

warbler :: (a -> a -> b) -> a -> b
warbler f x = f x x

class Ord a => Prioq (t :: * -> *) (a :: *) where
    empty :: t a
    isEmpty :: t a -> Bool
    single :: a -> t a
    insert :: a -> t a -> t a
    merge :: t a -> t a -> t a
    extractMin :: t a -> (a, t a)
    findMin :: t a -> a
    deleteMin :: t a -> t a
    fromList :: [a] -> t a
    toList :: t a -> [a]
    insert = merge . single
    single = flip insert empty
    extractMin = findMin >< deleteMin
    findMin = fst . extractMin
    deleteMin = snd . extractMin
    fromList = foldr insert empty
    toList = unfoldr . warbler $ bool (Just . extractMin) (const Nothing) . isEmpty

newtype ListPrioq a = LP { unLP :: [a] }
instance Ord a => Prioq  ListPrioq a where
    empty                   = LP {unLP = []}
    isEmpty LP {unLP = a}   = a == []
    single a                = LP {unLP = [a]}
    
    insert a LP{unLP = p}   = LP{unLP = ins p}
        where 
            ins [] = [a]
            ins (h:t) = if a > h then a:h:t else h:(ins t)

    merge LP {unLP = q1} LP {unLP = q2} = LP {unLP = _merge q1 q2}
            where
                _merge [] b = b
                _merge a [] = a
                _merge a b  = if head a > head b then (head a):(_merge (tail a) b) else (head b):(_merge a (tail b))

    findMin LP {unLP = q}       = _min q (head q)
                where
                    _min [] acc     = acc
                    _min [a] acc    = if a < acc then a else acc
                    _min ls acc     = if head ls < acc then _min (tail ls ) (head ls) else _min (tail ls) acc

    extractMin LP {unLP = q}    = 
        let m = findMin LP {unLP = q}
         in (m, LP {unLP =_extMin q m})
                where 
                    _extMin [] _   = []
                    _extMin (hd:tl) m = if hd == m then tl else hd:(_extMin tl m)

    deleteMin q = let (_, n_q)  = extractMin q in n_q

    fromList    = _fromList
                where 
                    _fromList []        = LP {unLP = []}
                    _fromList (hd:tl)   = insert hd (_fromList tl)
    toList LP{unLP = q} = q
                   
                    