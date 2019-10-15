main :: IO ()
main = return ()

lit :: (String -> a) -> String -> (String -> a)
lit cont s l = cont (s ++ l)
int :: (String -> a) -> String -> (Integer -> a)
int cont s n = cont (s ++ show n)
flt :: (String -> a) -> String -> (Float -> a)
flt cont s f = cont (s ++ show f)
str :: (String -> a) -> String -> (String -> a)
str cont s w = cont (s ++ w)
eol :: (String -> a) -> String -> a
eol cont s = cont (s ++ "\n")

-- (^^) ::  (String -> a) -> (String -> a) -> String -> b
-- (^^) cont1 cont2 = cont1 (cont2 )

-- -- sprintf :: ((String -> a) -> String -> a) -> String

-- test = eol Main.^^ int