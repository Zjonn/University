-- Wymagamy, by moduł zawierał tylko bezpieczne funkcje
{-# LANGUAGE Safe #-}
-- Definiujemy moduł zawierający rozwiązanie.
-- Należy zmienić nazwę modułu na {Imie}{Nazwisko} gdzie za {Imie}
-- i {Nazwisko} należy podstawić odpowiednio swoje imię i nazwisko
-- zaczynające się wielką literą oraz bez znaków diakrytycznych.
module DanielDubiel (typecheck, eval) where

-- Importujemy moduły z definicją języka oraz typami potrzebnymi w zadaniu
import AST
import DataTypes
import qualified Data.Map as M


-- Funkcja sprawdzająca typy
-- Dla wywołania typecheck vars e zakładamy, że zmienne występujące
-- w vars są już zdefiniowane i mają typ int, i oczekujemy by wyrażenia e
-- miało typ int
-- UWAGA: to jest rozwiązanie; nie należy zmieniać jgo definicji.
typecheck :: [Var] -> Expr p -> TypeCheckResult p
typecheck a b
  | ntyp == Rerror = Error pos str
  | ntyp == Rbool  = Error (getData b) "typeError: Function must return type int"
  | otherwise = Ok
  where
    (ntyp, pos, str) = checkTypes s b
    s                = eatInput a

-- Funkcja pomocnicza zajmująca się typowaniem
checkTypes :: M.Map Var RType -> Expr p -> (RType, p, String)
checkTypes s wyr =
  case wyr of
    EVar    p str      ->
      case M.lookup str s of
        Just a   -> (a , p, "")
        Nothing  -> (Rerror , p, "typeError: Variable \""
          ++ str ++ "\" not in scope")
-------------------------------------------------------------------------------
    ENum    p _        -> (Rint, p, "")
-------------------------------------------------------------------------------
    EBool   p _        -> (Rbool, p, "")
-------------------------------------------------------------------------------
    EUnary  p op a1    ->
      let (typ1, pos1, str1) = checkTypes s a1 in

      case op of
        UNot ->
          case typ1 of
            Rbool   -> (Rbool, p, "")
            Rint    -> (Rerror, p, "typeError: Expected type bool")
            Rerror  -> (Rerror, pos1, str1)
        UNeg ->
          case typ1 of
            Rint    -> (Rint, p, "")
            Rbool   -> (Rerror, p, "typeError: Expected type int")
            Rerror  -> (Rerror, pos1, str1)
-------------------------------------------------------------------------------
    EBinary p op a1 a2 ->
      let
      (typ1, pos1, str1) = checkTypes s a1
      (typ2, pos2, str2) = checkTypes s a2 in

      case (typ1,typ2) of
        (Rerror, _) -> (Rerror, pos1, str1)
        (_, Rerror) -> (Rerror, pos2, str2)
        _           ->
          case op of
            op | op `elem` [BAnd,BOr] ->
              if typ1 == Rbool && typ2 == Rbool
                then (Rbool, p, "")
                else (Rerror, p, "typeError: Expected type bool")
            op | op `elem` [BEq , BNeq , BLt , BGt , BLe , BGe] ->
              if typ1 == Rint && typ2 == Rint
                then (Rbool,p, "")
                else (Rerror, p, "typeError: Expected type int")
            _ ->
              if typ1 == Rint && typ2 == Rint
                then (Rint, p, "")
                else (Rerror, p, "typeError: Expected type int")
-------------------------------------------------------------------------------
    ELet    p var a1 a2 ->
      let
      (typ1, pos1, str1) = checkTypes s a1 in

      if typ1 == Rerror
        then (Rerror, pos1, str1)
        else checkTypes (M.insert var typ1 s) a2
-------------------------------------------------------------------------------
    EIf     p a1 a2 a3  ->
      let
      (typ1, pos1, str1) = checkTypes s a1
      (typ2, pos2, str2) = checkTypes s a2
      (typ3, pos3, str3) = checkTypes s a3 in

      case (typ1, typ2, typ3) of
        (Rerror, _, _)             -> (Rerror, pos1, str1)
        (_, Rerror, _)             -> (Rerror, pos2, str2)
        (_, _, Rerror)             -> (Rerror, pos3, str3)
        (Rbool, t1, t2) | t1 == t2 -> (t1    , p   , "")
        (Rint, _, _)               -> (Rerror,p,
          "typeError: In \"if e1 then e2 else e3\" e1 must be bool")
        (_, _, _)                  -> (Rerror, p   ,
          "typeError: In \"if e1 then e2 else e3\" e2 and "
            ++ "e3 must have that same type")

-- Typ używany w trakcie typowania
data RType =
    Rint
    | Rbool
    | Rerror
    deriving (Show , Eq)

-- Zamienia typ wejściowy na typ wykorzystywany w trakcie typowania
eatInput :: [Var] -> M.Map Var RType
eatInput [] = M.empty
eatInput (x:xs) = M.insert x Rint (eatInput xs)


-- Funkcja obliczająca wyrażenia
-- Dla wywołania eval input e przyjmujemy, że dla każdej pary (x, v)
-- znajdującej się w input, wartość zmiennej x wynosi v.
-- Możemy założyć, że wyrażenie e jest dobrze typowane, tzn.
-- typecheck (map fst input) e = Ok
-- UWAGA: to jest rozwiązanie; nie należy zmieniać jgo definicji.
eval :: [(Var,Integer)] -> Expr p -> EvalResult
eval a b =
  case val of
    V v -> Value v
    _   -> RuntimeError
  where val = evaluate (fixInput a) b

-- Funkcja pomocnicza obliczająca wartość wyrażenia
evaluate :: M.Map Var EvalVal -> Expr p -> EvalVal
evaluate s b =
  case b of
    EVar    p var         -> let Just val = M.lookup var s in val
-------------------------------------------------------------------------------
    ENum    p val         -> V val
-------------------------------------------------------------------------------
    EBool   p val         -> B val
-------------------------------------------------------------------------------
    EUnary  p op val      ->
      let v = evaluate s val in
      if v == Eerror
        then Eerror
        else
          case op of
            UNot -> neg v
            UNeg -> neg v
-------------------------------------------------------------------------------
    EBinary p op val1 val2 ->
      let v1 = evaluate s val1
          v2 = evaluate s val2 in
      if v1 == Eerror || v2 == Eerror
        then Eerror
        else
          case op of
            BAnd  ->
              if v1 == B True && v2 == B True
                then B True
                else B False
            BOr   ->
              if v1 == B True || v2 == B True
                then B True
                else B False
            BEq   ->
              if v1 == v2
                then B True
                else B False
            BNeq  ->
              if v1 == v2
                then B False
                else B True
            BLt   ->
              if v1 < v2
                then B True
                else B False
            BGt   ->
              if v1 > v2
                then B True
                else B False
            BLe   ->
              if v1 <= v2
                then B True
                else B False
            BGe   ->
              if v1 >= v2
                then B True
                else B False
            BAdd  ->
              bin v1 "+" v2
            BSub  ->
              bin v1 "-" v2
            BMul  ->
              bin v1 "*" v2
            BDiv  ->
              if v2 == V 0
                then Eerror
                else bin v1 "div" v2
            BMod  ->
              if v2 == V 0
                then Eerror
                else bin v1 "mod" v2
-------------------------------------------------------------------------------
    ELet   p var a1 a2     ->
      let v1 = evaluate s a1 in
      if v1 == Eerror
        then Eerror
        else
          evaluate (M.insert var v1 s) a2
-------------------------------------------------------------------------------
    EIf    p e1 e2 e3         ->
      case evaluate s e1 of
        Eerror  -> Eerror
        B True  -> evaluate s e2
        B False -> evaluate s e3

-- Typ używany w trakcie obliczania wartości
data EvalVal
  = Eerror
  | V Integer
  | B Bool
  deriving (Show , Eq, Ord)

-- Oblicza wartość wyrażenia binarnego
bin :: EvalVal -> String -> EvalVal -> EvalVal
bin a op b =
  case op of
    "+"   ->  V (v1 + v2)
    "-"   ->  V (v1 - v2)
    "*"   ->  V (v1 * v2)
    "div" ->  V (div v1 v2)
    "mod" ->  V (mod v1 v2)
  where
    V v1 = a
    V v2 = b

-- Neguje typ podany jako argument
neg :: EvalVal -> EvalVal
neg ev =
  case ev of
    V a -> V (-a)
    B b -> B ((not)b)

-- Zamienia typ wejściowy na typ wykorzystywany w trakcie obliczania wartości
fixInput :: [(Var,Integer)]-> M.Map Var EvalVal
fixInput [] = M.empty
fixInput ((a,b):xs) = M.insert a (V b) (fixInput xs)
