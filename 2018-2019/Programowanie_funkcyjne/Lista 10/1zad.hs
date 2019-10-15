main :: IO ()
main = return ()

data BTree a = Leaf | Node ( BTree a ) a ( BTree a )
data Forest a = FLeaf | FNode [Forest a] a

dfnum :: BTree a -> BTree Integer
dfnum tree = fst (_dfnum tree 0)

_dfnum :: BTree a -> Integer -> (BTree Integer, Integer)
_dfnum tree itr = case tree of
    Leaf         -> (Leaf, itr)
    Node t1 _ t2 -> (Node n1 itr n2, itr2 + 1)
      where
        (n1, itr1) = _dfnum t1 itr
        (n2, itr2) = _dfnum t2 (itr1 + 1)

-- bfnum :: BTree a -> BTree Integer
-- bfnum tree = _bfnum

-- _bfnum :: (Forest a, [Forest a]) -> Integer -> (Forest Integer, Integer)
-- _bfnum (frst, que) itr = case frst of
--     FLeaf      -> _bfnum (return_last que) itr
--     FNode f1 _ -> (FNode f2 itr, itr1)
--         where
--             g1 =  (f2, itr1) = _bfnum (return_last que) (itr + 1)


-- bt_to_forest :: BTree a -> Forest a
-- bt_to_forest tree = case tree of
--     Leaf         -> FLeaf
--     Node t1 v t2 -> FNode [bt_to_forest t1, bt_to_forest t2] v

-- forest_to_bt :: Forest a -> BTree a
-- forest_to_bt forest = case forest of
--     FLeaf                 -> Leaf
--     FNode (f1 : f2 : _) v -> Node (forest_to_bt f1) v (forest_to_bt f2)
--     _                     -> Leaf

-- return_last :: [a] -> (a, [a])
-- return_last lst = case lst of
--     [  x ]  -> (x, [])
--     hd : tl -> (v, hd : l) where (v, l) = return_last tl

