import Data.Char
import Data.List 

roots (a, b, c ) =
    let d = b*b-4*a*c in
        if d > 0
        then
        [(-b-d)/2*a,(-b+d)/2*a]
        else if d < 0
            then []
            else
            [-b/2*a]
            
data Roots = No
    | One Double
    | Two (Double, Double)
    deriving Show
    
roots2 (a, b, c ) =
    let d = b*b-4*a*c in
        if d > 0
        then
        Two((-b-d)/2*a,(-b+d)/2*a)
        else if d < 0
            then No
            else
            One (-b/2*a)
            
fib 0 = 1
fib 1 = 1
fib n = fin n 2 1 0
fin n v l r
    | n == v = l + r
    | otherwise = let 
        nv = v + 1 
        lv = l + r
        rv = l
    in fin n nv lv rv
    


integerToString :: Integer -> String
integerToString 0 = "0"
integerToString n = 
    let 
        v = (intToDigit . fromEnum)(mod n 10)
        nn = div n 10
    in 
        if nn == 0
        then [v]
        else
        integerToString nn ++ [v]
