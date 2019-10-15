{-# LANGUAGE FunctionalDependencies , FlexibleContexts , FlexibleInstances #-}
import           Data.Char
import           System.IO                      ( )
import           Control.Monad

main :: IO ()
main = return ()

class Monad m => StreamTrans m i o | m -> i o where
    readS :: m ( Maybe i )
    emitS :: o -> m ()

instance StreamTrans IO Char Char where
    readS = do
        c <- getChar
        if c /= '\n' then return (Just c) else return Nothing
    emitS = putChar



toLowerS :: StreamTrans m Char Char => m Integer
toLowerS = do
    a <- readS
    case a of
        Nothing -> return 0
        Just c ->
            let lc = toLower c
            in  (emitS lc >> toLowerS >>= (\a -> return (a + changed lc)))
            where changed nc = if c /= nc then 1 else 0

newtype ListTrans i o a = LT_ { unLT :: [ i ] -> ([ i ] , [ o ] , a ) }

instance Functor ( ListTrans i o) where
    fmap fn LT_ { unLT = lt } =
        LT_ { unLT = (\l -> let (i, o, a) = lt l in (i, o, fn a)) }

instance Applicative ( ListTrans i o) where
    pure a = LT_ { unLT = \l -> (l, [], a) }

    LT_ { unLT = lt1 } <*> LT_ { unLT = lt2 } = LT_
        { unLT =
            (\l ->
                let (i, o, fn) = lt1 l
                in  let (i2, o2, a) = lt2 i in (i2, o ++ o2, fn a)
            )
        }

instance Monad ( ListTrans i o) where
    return a = LT_ { unLT = \l -> (l, [], a) }
    LT_ { unLT = lt1 } >>= fn = LT_
        { unLT = \l ->
                     let (i, o, a) = lt1 l
                     in  let (i2, o2, a2) = unLT (fn a) i in (i2, o ++ o2, a2)
        }

instance StreamTrans ( ListTrans i o ) i o where
    readS = LT_ readS_
      where
        readS_ []      = ([], [], Nothing)
        readS_ (h : t) = (t, [], Just h)
    emitS o = LT_ $ \l -> (l, [o], ())

transform :: ListTrans i o a -> [i] -> ([o], a)
transform m i = let (_, o, a) = unLT m i in (o, a)


data Token = Number Integer | Var String| Plus | Min | Mul | Div | LP | RP | Err | Skip deriving (Show)
-- newtype Token = Token {tokens :: [Token]} deriving (Show)

lexer :: StreamTrans m Char Token => m ()
lexer = do
    mc <- readS
    case mc of
        Nothing -> return ()
        Just c  -> if c == ' '
            then lexer
            else if isAlphaNum c
                then if isNumber c
                    then do
                        (num, is_num) <- eatNum
                        let num_ = read (c : num) :: Integer
                        emitS (Number num_)
                        when is_num lexer
                    else do
                        (var, is_var) <- eatAlpha
                        emitS (Var (c : var))
                        when is_var lexer
                else
                    let tok = case c of
                            '(' -> LP
                            ')' -> RP
                            '+' -> Plus
                            '-' -> Min
                            '*' -> Mul
                            '/' -> Div
                            _   -> Err
                    in  case tok of
                            Err -> fail ("Incorrect symbol: " ++ [c])
                            _   -> do
                                emitS tok
                                lexer
          where
            eatNum :: StreamTrans m Char Token => m ([Char], Bool)
            eatNum = do
                mc1 <- readS
                case mc1 of
                    Nothing -> return ([], True)
                    Just c1 -> if isDigit c1
                        then do
                            (l, b) <- eatNum
                            return (c1 : l, b)
                        else if c1 == ' '
                            then return ([], True)
                            else return ([], False)

            eatAlpha :: StreamTrans m Char Token => m ([Char], Bool)
            eatAlpha = do
                mc1 <- readS
                case mc1 of
                    Nothing -> return ([], True)
                    Just c1 -> if isAlphaNum c1
                        then do
                            (l, b) <- eatAlpha
                            return (c1 : l, b)
                        else if c1 == ' '
                            then return ([], True)
                            else return ([], False)


lexer2 :: StreamTrans m Char Token => m ()
lexer2 = do
    mc <- readS
    case mc of
        Nothing -> return ()
        Just c  -> if isAlphaNum c
            then if isNumber c
                then do
                    (num, is_num) <- eatNum
                    let num_ = read (c : num) :: Integer
                    emitS (Number num_)
                    when is_num lexer2
                else do
                    (var, is_var) <- eatAlpha
                    emitS (Var (c : var))
                    when is_var lexer2
            else
                let tok = case c of
                        ' ' -> Skip
                        '(' -> LP
                        ')' -> RP
                        '+' -> Plus
                        '-' -> Min
                        '*' -> Mul
                        '/' -> Div
                        _   -> Err
                in  case tok of
                        Err  -> fail ("Incorrect symbol: " ++ [c])
                        Skip -> lexer2
                        _    -> do
                            emitS tok
                            lexer2
          where
            eatNum :: StreamTrans m Char Token => m ([Char], Bool)
            eatNum = do
                mc1 <- readS
                case mc1 of
                    Nothing -> return ([], True)
                    Just c1 -> if isDigit c1
                        then do
                            (l, b) <- eatNum
                            return (c1 : l, b)
                        else if c1 == ' '
                            then return ([], True)
                            else return ([], False)

            eatAlpha :: StreamTrans m Char Token => m ([Char], Bool)
            eatAlpha = do
                mc1 <- readS
                case mc1 of
                    Nothing -> return ([], True)
                    Just c1 -> if isAlphaNum c1
                        then do
                            (l, b) <- eatAlpha
                            return (c1 : l, b)
                        else if c1 == ' '
                            then return ([], True)
                            else return ([], False)


------------------------ 4 ------------------------------
class Monad m => Random m where
    random :: m Int

newtype RS t = RS { unRS :: Int -> (Int, t) }

instance Functor RS
instance Applicative RS

instance Monad RS where
    return a = RS (\seed -> (seed, a))
    RS rs1 >>= fn = 
        RS (\seed -> let (s, t) = rs1 seed in 
            let (s2, t2) = unRS (fn t) s in (s2, t2))

withSeed :: RS a -> Int -> a
withSeed (RS rs1) seed = snd (rs1 seed)

instance Random RS where
    random = RS (\seed -> 
        let b = 16807 * (mod seed  127773) - 2836 * (div seed 127773) in
        let a = if b > 0 then b else b + 2147483647
        in (a, b))
                            

------------------------5 i 6--------------------------------
class Monad m => Nondet m where
    amb :: m a -> m a -> m a
    fail_ :: m a

data RegExpr = Empty | Literal Char | Or RegExpr RegExpr | Sum RegExpr RegExpr | Star RegExpr deriving (Eq)

match :: Nondet m => RegExpr -> String -> m ()
match reg str = do
    m <- match_ reg str
    case m of
        Just [] -> return ()
        _       -> fail_


match_ :: Nondet m => RegExpr -> String -> m (Maybe String)
match_ reg str = case reg of
    Empty     -> if str == [] then return (Just []) else return Nothing
    Literal c -> if c == head str then return (Just str) else return Nothing
    Or  r1 r2 -> amb (match_ r1 str) (match_ r2 str)
    Sum r1 r2 -> do
        o_1 <- match_ r1 str
        case o_1 of
            Nothing    -> return Nothing
            Just str_2 -> match_ r2 str_2
    Star r -> match_no_star r str

match_no_star reg str = case reg of
    Empty     -> if str == [] then return (Just []) else return Nothing
    Literal c -> if c == head str then return (Just str) else return Nothing
    Or  r1 r2 -> amb (match_ r1 str) (match_ r2 str)
    Sum r1 r2 -> do
        o_1 <- match_ r1 str
        case o_1 of
            Nothing    -> return Nothing
            Just str_2 -> match_ r2 str_2
    Star _ -> return Nothing


--Moje niederministyczne instancje wydają się być odrobinę determistyczne 
instance Nondet Maybe where
    amb n1 _ = n1
    fail_ = Nothing

instance Nondet [] where
    amb _ n2 = n2
    fail_ = []