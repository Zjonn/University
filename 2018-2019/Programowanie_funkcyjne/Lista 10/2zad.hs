main :: IO ()


data BTree a = Leaf | Node ( BTree a ) a ( BTree a )
data Array a = Data (BTree a) Integer

aempty :: Array a
aempty = Data Leaf 0

asub :: Array a -> Integer -> a
asub arr i = aux tree i
 where
  (Data tree _) = arr
  aux (Node t1 v t2) id | id == 0         = v
                        | id `mod` 2 == 0 = aux t1 (id `div` 2)
                        | otherwise       = aux t2 (id `div` 2)

aupdate :: Array a -> Integer -> a -> Array a
aupdate arr i val = (Data (aux tree i) mdata)
 where
  (Data tree mdata) = arr
  aux (Node t1 v t2) id | id == 0         = Node t1 val t2
                        | id `mod` 2 == 0 = Node (aux t1 (id `div` 2)) v t2
                        | otherwise       = Node t1 v (aux t2 (id `div` 2))

ahiext :: Array a -> a -> Array a
ahiext arr val = (Data (aux tree size) (size + 1))
 where
  (Data tree size) = arr
  aux Leaf _ = Node Leaf val Leaf
  aux (Node t1 v t2) i | i == 0         = Node t1 val t2
                       | i `mod` 2 == 0 = Node (aux t1 (i `div` 2)) v t2
                       | otherwise      = Node t1 v (aux t2 (i `div` 2))

ahirem :: Array a -> Array a
ahirem arr = (Data (aux tree size) (size - 1))
 where
  (Data tree size) = arr
  aux (Node t1 v t2) i | i == 0         = Leaf
                       | i `mod` 2 == 0 = Node (aux t1 (i `div` 2)) v t2
                       | otherwise      = Node t1 v (aux t2 (i `div` 2))

main = print (show (asub (ahiext aempty 5) 0))


