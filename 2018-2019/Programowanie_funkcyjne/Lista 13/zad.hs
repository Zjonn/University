import           Prelude                 hiding ( (++)
                                                , head
                                                , tail
                                                , length
                                                , null
                                                , (!!)
                                                )
import qualified Prelude                        ( (++)
                                                , head
                                                , tail
                                                , length
                                                , null
                                                , (!!)
                                                )

main :: IO ()
main = return ()




class List l where
    nil :: l a
    cons :: a -> l a -> l a
    head :: l a -> a
    tail :: l a -> l a
    (++) :: l a -> l a -> l a
    (!!) :: l a -> Int -> a
    toList :: [a] -> l a
    fromList :: l a -> [a]

class List l => SizedList l where
    length :: l a -> Int
    null :: l a -> Bool
    null l = length l == 0

instance List [] where
    nil = []
    cons a b = b ++ [a]
    head (h : t) = h
    tail (h : t) = t
    (++) l1 l2 = l1 ++ l2
    (!!) l1 n = l1 !! n
    toList ls = ls
    fromList la = la

instance SizedList [] where
    length = length
    null [] = True
    null _  = False

data SL l a = SL { len :: Int, list :: l a }

instance List l => List (SL l) where
    nil = SL 0 nil
    cons a ls = SL (len ls + 1) (cons a (list ls))
    head ls = head (list ls)
    tail ls = SL (len ls - 1) (tail (list ls))
    (++) l1 l2 = SL (len l1 + len l2) (list l1 ++ list l2)
    (!!) l1 n = list l1 !! n
    toList l1 = SL (length l1) (toList l1)
    fromList l1 = fromList (list l1)


newtype DiffList a = DL ([a] -> [a])

instance Show a => Show (DiffList a) where
    show (DL fun) = show (fun [])

instance List DiffList where
    nil = DL id
    (++) (DL f1) (DL f2) = DL (\f3 -> f1 (f2 f3))
    head (DL f1) = head (f1 [])
    tail (DL f1) = DL (\f2 -> tail (f1 []) ++ f2)
    (!!) (DL l1) n = l1 [] !! n
    toList l1 = DL (\l2 -> l1 ++ l2)
    fromList (DL l1) = l1 []
    cons a (DL l1) = DL (\l2 -> l1 (a : l2))


instance SizedList DiffList where
    length (DL fun) = length (fun [])



