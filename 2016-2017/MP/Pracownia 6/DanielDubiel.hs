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
import Data.Maybe
-- Funkcja sprawdzająca typy
-- Dla wywołania typecheck fs vars e zakładamy, że zmienne występujące
-- w vars są już zdefiniowane i mają typ int, i oczekujemy by wyrażenia e
-- miało typ int
-- UWAGA: to nie jest jeszcze rozwiązanie; należy zmienić jej definicję.
typecheck :: [FunctionDef p] -> [Var] -> Expr p -> TypeCheckResult p
typecheck fun s expr =
  case funTypeCheck fun fun (M.union (eatInput s) (eatFunc fun)) expr of
  Rerror pos str -> Error pos str
  Rtype TInt     -> Ok
  _              ->
    Error (getData expr) "typeError: Program must return type int"

data ReturnType p
  = Rerror p String
  | Rtype Type
  deriving (Eq)

funTypeCheck :: [FunctionDef p] -> [FunctionDef p] ->
  M.Map Var (ReturnType p) -> Expr p -> ReturnType p

funTypeCheck constFun [] s wyr = checkTypes constFun s wyr
funTypeCheck constFun (x:xs) s wyr =
  case checkTypes constFun
    (M.insert (funcArg x) (Rtype (funcArgType x)) (eatFunc constFun))
    (funcBody x) of
   Rerror pos str          -> Rerror pos str
   Rtype typ
    | typ == funcResType x -> funTypeCheck constFun xs s wyr
   Rtype typ               -> Rerror (getData (funcBody x))
    ("typeError: Function \"" ++ funcName x ++ "\" returns type " ++ show typ
    ++ ", should return "  ++ show (funcResType x))

checkTypes :: [FunctionDef p] -> M.Map Var (ReturnType p) ->
  Expr p -> ReturnType p
checkTypes fun s wyr =
  case wyr of
    EVar     p str      ->
      fromMaybe
        (Rerror p ("typeError: Variable \""
        ++ str ++ "\" not in scope"))
        (M.lookup str s)
-------------------------------------------------------------------------------
    ENum     _ _        -> Rtype TInt
-------------------------------------------------------------------------------
    EBool    _ _        -> Rtype TBool
-------------------------------------------------------------------------------
    EUnary   p op a1    ->
      case checkTypes fun s a1 of
        Rerror pos str -> Rerror pos str
        Rtype typ1 ->
          case op of
            UNot ->
              case typ1 of
                TBool    -> Rtype TBool
                _        -> Rerror p ("typeError: Expected expression: "
                    ++ show op ++ " <bool>, got "
                    ++ show op ++ " <" ++ show typ1 ++ ">")
            UNeg ->
              case typ1 of
                TInt     -> Rtype TInt
                _        -> Rerror p ("typeError: Expected expression: "
                  ++ show op ++ " <int>, got "
                  ++ show op ++ " <" ++ show typ1 ++ ">")
-------------------------------------------------------------------------------
    EBinary  p op a1 a2 ->
      case (checkTypes fun s a1, checkTypes fun s a2) of
        (Rerror pos1 str1, _)    -> Rerror pos1 str1
        (_, Rerror pos2 str2)    -> Rerror pos2 str2
        (Rtype typ1, Rtype typ2) ->
          case op of
            nOp | nOp `elem` [BAnd,BOr]                           ->
              if typ1 == TBool && typ2 == TBool
                then Rtype TBool
                else Rerror p ("typeError: Expected expression: <bool> '"
                  ++ show op ++"' <bool>, got <" ++ show typ1 ++ "> '"
                  ++ show op ++ "' <"++ show typ2 ++ ">")
            nOp | nOp `elem` [BEq , BNeq , BLt , BGt , BLe , BGe] ->
              if typ1 == TInt && typ2 == TInt
                then Rtype TBool
                else Rerror p ("typeError: Expected expression: <int> '"
                  ++ show op ++"' <int>, got <" ++ show typ1 ++ "> '"
                  ++ show op ++ "' <" ++ show typ2 ++ ">")
            _                                                     ->
              if typ1 == TInt && typ2 == TInt
                then Rtype TInt
                else Rerror p ("typeError: Expected expression: <int> '"
                  ++ show op ++"' <int>, got <" ++ show typ1 ++ "> '"
                  ++ show op ++ "' <" ++ show typ2 ++ ">")
-------------------------------------------------------------------------------
    ELet     _ var a1 a2 ->
      case checkTypes fun s a1 of
        Rerror pos1 str -> Rerror pos1 str
        typ1            -> checkTypes fun (M.insert var typ1 s) a2
-------------------------------------------------------------------------------
    EIf      p a1 a2 a3  ->
      case (checkTypes fun s a1, checkTypes fun s a2, checkTypes fun s a3) of
        (Rerror pos1 str1, _, _)         -> Rerror pos1 str1
        (_, Rerror pos2 str2, _)         -> Rerror pos2 str2
        (_, _, Rerror pos3 str3)         -> Rerror pos3 str3
        (Rtype TBool, Rtype t1, Rtype t2)
         | t1 == t2                      -> Rtype t1
        (Rtype e1, _, _) | e1 /= TBool   -> Rerror p
          ("typeError: In expression \"if e1 then e2 else e3\""
            ++ " e1 must have type <bool>, currently has <" ++ show e1 ++ ">")
        (_, Rtype e1, Rtype e2)          -> Rerror p
          ("typeError: In expression \"if e1 then e2 else e3\""
            ++ " e2 and e3 must have that same type, currently e2 has <"
            ++ show e1 ++ ">, e3 has <" ++ show e2 ++ ">")
-------------------------------------------------------------------------------
    EFn     _ var typ1 e1 ->
      case checkTypes fun (M.insert var (Rtype typ1) s) e1 of
        Rerror pos1 str1 -> Rerror pos1 str1
        Rtype  typ2      -> Rtype (TArrow typ1 typ2)
-------------------------------------------------------------------------------
    EApp    p e1 e2       ->
      case checkTypes fun s e1 of
        Rerror pos1 str1         -> Rerror pos1 str1
        Rtype (TArrow typ1 typ2) ->
          case checkTypes fun s e2 of
            Rerror pos1 str1          -> Rerror pos1 str1
            Rtype typ3 | typ3 == typ1 -> Rtype typ2
            Rtype typ3                -> Rerror p
              ("typeError: Funcion expects type <" ++ show typ1
                ++ ">,got <" ++ show typ3 ++ ">")
        Rtype t                  -> Rerror p
          ("typeError: Expected funcion type, got <" ++  show t ++ ">")
-------------------------------------------------------------------------------
    EUnit   _           -> Rtype TUnit
-------------------------------------------------------------------------------
    EPair   _ a1 a2     ->
      case (checkTypes fun s a1, checkTypes fun s a2) of
        (Rerror pos1 str1,_)  -> Rerror pos1 str1
        (_, Rerror pos2 str2) -> Rerror pos2 str2
        (Rtype t1, Rtype t2)  -> Rtype (TPair t1 t2)
-------------------------------------------------------------------------------
    EFst    p a1        ->
      case checkTypes fun s a1 of
        Rtype (TPair e1 _) -> Rtype e1
        Rerror pos str     -> Rerror pos str
        _                  -> Rerror p "typeError: fst must be applied on pair"
-------------------------------------------------------------------------------
    ESnd    p a1        ->
      case checkTypes fun s a1 of
        Rtype (TPair _ e2) -> Rtype e2
        Rerror pos str     -> Rerror pos str
        _                  -> Rerror p "typeError: snd must be applied on pair"
-------------------------------------------------------------------------------
    ENil    p a1        ->
      case a1 of
        (TList _) -> Rtype a1
        _         -> Rerror p "typeError: Even empty list must be typed"
-------------------------------------------------------------------------------
    ECons   p a1 a2     ->
      case (checkTypes fun s a1, checkTypes fun s a2) of
        (Rerror pos1 str1,_)         -> Rerror pos1 str1
        (_,Rerror pos2 str2)         -> Rerror pos2 str2
        (Rtype t1, Rtype (TList t2))
          | t1 == t2                 -> Rtype (TList t1)
        (Rtype t1, Rtype (TList t2)) -> Rerror p
          ("typeError: List expects type: <"
            ++ show t2 ++ ">, got <" ++ show t1 ++ ">")
        (_, Rtype t2)                -> Rerror p
          ("typeError: List constructor expects type: <_> :: <_ list>,"
            ++ " got <_> :: <" ++ show t2 ++ ">")
-------------------------------------------------------------------------------
    EMatchL p a1 a2 (v1, v2, a3)  ->
      case (checkTypes fun s a1, checkTypes fun s a2) of
        (Rerror pos1 str1,_)          -> Rerror pos1 str1
        (_,Rerror pos2 str2)          -> Rerror pos2 str2
        (Rtype (TList t),Rtype typ2)  ->
          case checkTypes fun (M.insert v2 (Rtype (TList t))
           (M.insert v1 (Rtype t) s)) a3 of
            Rerror pos3 str3  -> Rerror pos3 str3
            Rtype typ3
              | typ2 == typ3  -> Rtype typ2
            _                 -> Rerror p
              ("typeError: In \"match e with [] -> e1 | x1 :: x2 -> e2\""
                ++ " e1 and e2 must have that same type")
        (Rtype t1, _)                  -> Rerror p ("typeError: Match expects"
            ++ " list, got type <" ++ show t1 ++ ">")



-- Zaminia typ wejściowy na typ wykorzystywany w trakcie typowania
eatInput :: [Var] -> M.Map Var (ReturnType p)
eatInput [] = M.empty
eatInput (x:xs) = M.insert x (Rtype TInt) (eatInput xs)

eatFunc :: [FunctionDef p] -> M.Map Var (ReturnType p)
eatFunc [] = M.empty
eatFunc (x:xs) = M.insert (funcName x)
  (Rtype (TArrow (funcArgType x) (funcResType x))) (eatFunc xs)

-- Funkcja obliczająca wyrażenia
-- Dla wywołania eval fs input e przyjmujemy, że dla każdej pary (x, v)
-- znajdującej się w input, wartość zmiennej x wynosi v.
-- Możemy założyć, że definicje funckcji fs oraz wyrażenie e są dobrze
-- typowane, tzn. typecheck fs (map fst input) e = Ok
-- UWAGA: to nie jest jeszcze rozwiązanie; należy zmienić jej definicję.
eval :: [FunctionDef p] -> [(Var,Integer)] -> Expr p -> EvalResult
eval fun s wyr =
  case evaluate fun (M.union (fixInput s) (buildEnv fun)) wyr of
    I val    -> Value val
    _        -> RuntimeError


data EvalVal p
  = I Integer
  | B Bool
  | U
  | P (EvalVal p) (EvalVal p)
  -- L wartość ogon
  | L (EvalVal p) (EvalVal p)
  | Fn (M.Map Var (EvalVal p)) Var (Expr p)
  | Fun Var (Expr p)
  | Empty
  | RunError
  deriving (Eq)

-- Funkcja pomocnicza obliczająca wartość wyrażenia
evaluate :: [FunctionDef p] -> M.Map Var (EvalVal p) -> Expr p -> EvalVal p
evaluate fun s wyr =
  case wyr of
    EVar    _ var         ->
      case M.lookup var s of
        Just (Fun var1 expr) -> Fn (buildEnv fun) var1 expr
        Just val             -> val
-------------------------------------------------------------------------------
    ENum    _ val         -> I val
-------------------------------------------------------------------------------
    EBool   _ val         -> B val
-------------------------------------------------------------------------------
    EUnary  _ op val      ->
      case (evaluate fun s val,op) of
        (B v, UNot)       -> B (not v)
        (I v, UNeg)       -> I (-v)
        _                 -> RunError
-------------------------------------------------------------------------------
    EBinary _ op val1 val2 ->
      case evaluate fun s val1 of
        RunError -> RunError
        v1       ->
          case evaluate fun s val2 of
            RunError -> RunError
            v2       ->
              case (v1,op,v2) of
                (B v1, BAnd, B v2)  ->
                  if v1 && v2
                    then B True
                    else B False
                (B v1, BOr, B v2)   ->
                  if v1 || v2
                    then B True
                    else B False
                (I v1, BEq, I v2)   ->
                  if v1 == v2
                    then B True
                    else B False
                (I v1, BNeq, I v2)  ->
                  if v1 == v2
                    then B False
                    else B True
                (I v1, BLt, I v2)   ->
                  if v1 < v2
                    then B True
                    else B False
                (I v1, BGt, I v2)   ->
                  if v1 > v2
                    then B True
                    else B False
                (I v1, BLe, I v2)   ->
                  if v1 <= v2
                    then B True
                    else B False
                (I v1, BGe, I v2)   ->
                  if v1 >= v2
                    then B True
                    else B False
                (v1, BAdd, v2)      ->
                  bin v1 "+" v2
                (v1, BSub, v2)      ->
                  bin v1 "-" v2
                (v1, BMul, v2)      ->
                  bin v1 "*" v2
                (v1,  BDiv, I v2)     ->
                  if v2 == 0
                    then RunError
                    else bin v1 "div" (I v2)
                (v1,  BMod, I v2)     ->
                  if v2 == 0
                    then RunError
                    else bin v1 "mod" (I v2)
-------------------------------------------------------------------------------
    ELet   _ var a1 a2     ->
      case evaluate fun s a1 of
        RunError -> RunError
        v1 -> evaluate fun (M.insert var v1 s) a2
-------------------------------------------------------------------------------
    EIf    _ e1 e2 e3      ->
      case evaluate fun s e1 of
        B True   -> evaluate fun s e2
        B False  -> evaluate fun s e3
        _        -> RunError
-------------------------------------------------------------------------------
    EFn     _ var _ e1     ->
        Fn s var e1
-------------------------------------------------------------------------------
    EApp _ e1 e2            ->
      case evaluate fun s e2 of
        RunError -> RunError
        val1     ->
          let (Fn env arg expr) = evaluate fun s e1 in
            evaluate fun (M.insert arg val1 env) expr
    EUnit _                -> U
    EPair _ e1 e2          ->
      case evaluate fun s e1 of
        RunError -> RunError
        typ1     ->
          case evaluate fun s e2 of
            RunError -> RunError
            typ2     -> P typ1 typ2
-------------------------------------------------------------------------------
    EFst _ e1              ->
      case evaluate fun s e1 of
        P v1 _ -> v1
        _ -> RunError
-------------------------------------------------------------------------------
    ESnd _ e1              ->
      case evaluate fun s e1 of
        P _ v2 -> v2
        _ -> RunError
-------------------------------------------------------------------------------
    ENil _ _               -> Empty
-------------------------------------------------------------------------------
    ECons _ e1 e2          ->
      case evaluate fun s e1 of
        RunError -> RunError
        typ1     ->
          case evaluate fun s e2 of
            RunError -> RunError
            typ2     -> L typ1 typ2
-------------------------------------------------------------------------------
    EMatchL _ e1 e2 (v1, v2, e3) ->
      case evaluate fun s e1 of
        Empty       -> evaluate fun s e2
        L val1 val2 -> evaluate fun
          (M.insert v2 val2 (M.insert v1 val1 s)) e3
        _           -> RunError

-- Oblicza wartość wyrażenia binarnego
bin :: EvalVal p -> String -> EvalVal p -> EvalVal p
bin a op b =
  case op of
    "+"   ->  I (v1 + v2)
    "-"   ->  I (v1 - v2)
    "*"   ->  I (v1 * v2)
    "div" ->  I (div v1 v2)
    "mod" ->  I (mod v1 v2)
  where
    I v1 = a
    I v2 = b

fixInput :: [(Var,Integer)] -> M.Map Var (EvalVal p)
fixInput [] = M.empty
fixInput ((var,val):xs) = M.insert var (I val) (fixInput xs)

buildEnv :: [FunctionDef p] -> M.Map Var (EvalVal p)
buildEnv [] = M.empty
buildEnv (x:xs) =
  M.insert (funcName x) (Fun (funcArg x) (funcBody x)) (buildEnv xs)
