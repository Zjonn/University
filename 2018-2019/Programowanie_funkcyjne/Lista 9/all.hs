f :: [Integer] -> [Integer]
f (hd:tl) = filter (\x -> x `rem` hd /= 0) tl
