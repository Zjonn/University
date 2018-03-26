import Data.List
nat::[(Integer,Integer)]
nat =[(x,y-x)|y<-[0..],x<-[0.. y]]

halveH:: [a] -> [a]
halveH [] = []
halveH ([x]) = [x]
halveH (x1:x2:xs) = (x1:halveH (xs))

halve :: [a] -> ([a],[a])
halve (x:xs) = (a,b)
    where 
    a = halveH (x:xs)
    b = halveH xs

merge :: Ord a => ([a], [a]) -> [a]

merge ([],y) = y
merge (x,[]) = x
merge (x:xs,y:ys)
    | x > y = (x:merge(xs,y:ys))
    | x < y = (y:merge(x:xs,ys))
    | x == y = (x:y:merge(xs,ys))
    
msort [] = []
msort [x] = [x]
msort xs =
    merge . cross (msort,msort) . halve $ xs

cross :: (a -> c, b -> d) -> (a,b) -> (c,d)
cross (f,g) = pair (f . fst, g . snd)
pair :: (a -> b, a -> c) -> a -> (b,c)
pair (f,g) x = (f x, g x)


d235::[Integer]
d235 = 1:(merge_unique (merge_unique (map (2*) d235)(map (3*) d235)) (map (5*) d235))

merge_unique :: Ord a => [a] -> [a] -> [a]
merge_unique [] y  = y
merge_unique x [] = x
merge_unique (x:xs) (y:ys)
    | x > y = (y:merge_unique (x:xs) ys)
    | x < y = (x:merge_unique xs (y:ys))
    | x == y =(merge_unique xs (y:ys))
    
