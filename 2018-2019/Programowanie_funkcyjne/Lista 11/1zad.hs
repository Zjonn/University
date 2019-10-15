import           Data.Maybe

main :: IO ()
main = return ()

ana :: (b -> Maybe (a, b)) -> b -> [a]
ana f st = case f st of
    Nothing       -> []
    Just (v, st') -> v : ana f st'

iter_a :: (a -> a) -> a -> [a]
iter_a f st = ana (\(a, b) -> Just (b, (a, a b))) (f, st)

zip_a :: [a] -> [b] -> [(a, b)]
zip_a l1 l2 = ana fn (l1, l2)
  where
    fn (a, b) = case (a, b) of
        ([], _ ) -> Nothing
        (_ , []) -> Nothing
        (a , b ) -> Just ((head a, head b), (tail a, tail b))

map_a :: (a -> b) -> [a] -> [b]
map_a f = ana fn
  where
    fn [] = Nothing
    fn a  = Just (f (head a), tail a)

cata :: (a -> b -> b) -> b -> [a] -> b
cata f v []       = v
cata f v (x : xs) = f x (cata f v xs)

length_c :: [a] -> Int
length_c = cata fn 0 where fn _ v = v + 1

filter_c :: (a -> Bool) -> [a] -> [a]
filter_c f = cata fn [] where fn a b = if f a then a : b else b

map_c :: (a -> b) -> [a] -> [b]
map_c f = cata fn [] where fn a b = (f a) : b

data Expr a b =
    Number b
    | Var a
    | Plus (Expr a b) (Expr a b)

data T b a c = N b | V a | P (c, c)

anaE :: (seed -> T b a seed) -> seed -> Expr a b
anaE f st = case f st of
    N b      -> Number b
    V a      -> Var a
    P (x, y) -> Plus (anaE f x) (anaE f y)

cataE :: (T b a seed -> seed) -> Expr a b -> seed
cataE f expr = case expr of
    Number b -> f (N b)
    Var    a -> f (V a)
    Plus x y -> f (P (cataE f x, cataE f y))

eval :: (Eq a, Num b) => [(a, b)] -> Expr a b -> b
eval env e = cataE f e
  where
    f x = case x of
        N b      -> b
        V a      -> fromJust $ lookup a env
        P (x, y) -> x + y

