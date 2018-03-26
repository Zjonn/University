{-# LANGUAGE Safe #-}
-- Definiujemy moduł zawierający rozwiązanie.
-- Należy zmienić nazwę modułu na {Imie}{Nazwisko}Compiler gdzie
-- za {Imie} i {Nazwisko} należy podstawić odpowiednio swoje imię
-- i nazwisko zaczynające się wielką literą oraz bez znaków diakrytycznych.
module DanielDubielCompiler(compile) where

import AST
import MacroAsm
import qualified Data.Map as M

-- Funkcja kompilująca program

-- ----> Dla pracowni 4 <----

-- Dla pracowni nr 4 należy zignorować pierwszy argument
-- UWAGA: to nie jest jeszcze rozwiązanie; należy zmienić jej definicje
compile :: [FunctionDef p] -> [Var] -> Expr p -> [MInstr]
compile _ env expr = instr ++ [MRet]
  where (instr,_) = comReal (buildEnv env 0) ([],[]) 0 expr

--Typ na jakim aktualnie pracujemy
data CType
  = Other
  | Bool
  | And
{-
  env   - środowisko
  iD    - etykieta skoku, pamiętana jako lista 0,1
  andID - etykiety skoków dla and aby iD wolniej rosło
  i     - ilość nowym elementów dodanych na stos
  expr  - Expr p
  -}
-- Własciwa funkcja zajmująca się tworzeniem komend
comReal :: M.Map Var (CType,Int) -> ([Int], [Int]) -> Int -> Expr p
  -> ([MInstr], CType)
comReal env (iD,andID) i expr =
  case expr of
    EVar    _ var       -> let Just (t,val) = M.lookup var env in
      ([MGetLocal (val+i)], t)
-------------------------------------------------------------------------------
    ENum    _ val       -> ([MConst val], Other)
-------------------------------------------------------------------------------
    EBool   _ val       ->
      if val
        then ([MConst 1]   , Bool)
        else ([MConst (-2)], Bool)
-------------------------------------------------------------------------------
    EUnary  _ op e      ->
      case (op, comReal env (0:iD,andID) i e) of
        (UNeg, (x,t)) -> (x ++ [MNeg], t)
        (UNot, (x,t)) ->
          let idn1 = iDtoLabel iD
              idn2 = iDtoLabel $ 0:iD
          in
          case t of
            Other -> (x ++
              [MJump idn1, MLabel idn2, MJump $ idn1-1], Other)
            Bool  -> (x ++ [MNot], t)
            And   -> (x ++
              [MLabel idn2, MJump $ idn1-1, MLabel $ idn2-1, MJump idn1]
              , Other)
-------------------------------------------------------------------------------
    EBinary _ op e1 e2  ->
      let
      idn  = iDtoLabel iD in
      if op == BOr || op == BAnd
      then
        case op of
          BOr  ->
            let
              (v1,t1) = comReal env (iD, 1:andID) i e1
              (v2,t2) = comReal env (iD, 0:andID) i e2
              a = case t1 of
                And   -> v1 ++ [MJump idn]
                Bool  -> v1 ++ [MBranch MC_P idn]
                Other -> v1
              in
              case t2 of
                And   -> (a ++ v2 ++ [MJump idn]       , Other)
                Bool  -> (a ++ v2 ++ [MBranch MC_P idn], Other)
                Other -> (a ++ v2, Other)
          BAnd ->
            let
              idID = iDtoLabel andID
              (v1,t1) = comReal env (1:iD, 1:andID) i e1
              (v2,t2) = comReal env (0:iD, 0:andID) i e2
              a = case t1 of
                Other -> v1 ++ [MBranch MC_1 $ idn-1, MLabel $ iDtoLabel $ 1:iD]
                Bool  -> v1 ++
                 [ MBranch MC_P $ -idn-idID
                 , MJump $ idn-1, MLabel $ -idn-idID]
                And   -> v1
              in
              case t2 of
                Other -> (a ++ v2
                  ++ [MJump $ idn-1, MLabel $ iDtoLabel $ 0:iD], And)
                Bool  -> (a ++ v2 ++
                 [ MBranch MC_P $ -idn-idID-1
                 , MJump $ idn-1, MLabel $ -idn-idID-1]
                 , And)
                And   -> (a ++ v2, And)
      else
      let
        (v1,_) = comReal env (iD, 1:andID) i     e1
        (v2,_) = comReal env (iD, 0:andID) (i+1) e2 in
        case op of
          BEq  -> (v1 ++ [MPush] ++ v2 ++ [MBranch MC_EQ idn], Other)
          BNeq -> (v1 ++ [MPush] ++ v2 ++ [MBranch MC_NE idn], Other)
          BLt  -> (v1 ++ [MPush] ++ v2 ++ [MBranch MC_LT idn], Other)
          BGt  -> (v1 ++ [MPush] ++ v2 ++ [MBranch MC_GT idn], Other)
          BLe  -> (v1 ++ [MPush] ++ v2 ++ [MBranch MC_LE idn], Other)
          BGe  -> (v1 ++ [MPush] ++ v2 ++ [MBranch MC_GE idn], Other)
          BAdd -> (v1 ++ [MPush] ++ v2 ++ [MAdd], Other)
          BSub -> (v1 ++ [MPush] ++ v2 ++ [MSub], Other)
          BMul -> (v1 ++ [MPush] ++ v2 ++ [MMul], Other)
          BDiv -> (v1 ++ [MPush] ++ v2 ++ [MDiv], Other)
          BMod -> (v1 ++ [MPush] ++ v2 ++ [MMod], Other)
-------------------------------------------------------------------------------
    ELet   _ var a1 a2  ->
      let (v1,t1) = comReal env (iD, andID) i a1 in
      let (v2,t2) = comReal (M.insert var (t1, -i - 1) env) (iD,[]) (i+1) a2 in
      (v1 ++ [MPush] ++ v2, t2)
-------------------------------------------------------------------------------
    EIf    _ e1 e2 e3   ->
      let idn = iDtoLabel iD in
      let
        (v1, t1) = comReal env (iD  , andID) i e1
        (v2, t2) = comReal env (1:iD, [])  i e2
        (v3, _ ) = comReal env (0:iD, [])  i e3 in
          case t1 of
            And   ->
              (v1 ++ [MJump idn, MLabel $ idn-1]
                ++ v3 ++ [MRet, MLabel idn] ++ v2, t2)
            Bool  ->
              (v1 ++ [MBranch MC_P idn] ++ v3 ++ [MRet, MLabel idn] ++ v2, t2)
            Other ->
              (v1 ++ [MLabel (idn-1)]   ++ v3 ++ [MRet, MLabel idn] ++ v2, t2)


-- Zapamiętuje pozycje elementów z inputu na stosie
buildEnv :: [Var] -> Int -> M.Map Var (CType, Int)
buildEnv [] _       = M.empty
buildEnv (x:xs) val = M.insert x (Other, val) (buildEnv xs $ val+1)

-- Zamiania tablicę 0,1 na parzystą liczbę dziasiętną (dodaje wiodącą 1)
iDtoLabel :: [Int] -> Int
iDtoLabel [] = -1
iDtoLabel x  = let
  v = labelH $ 1:x
  p = 2^16 in
  if v > p then v `mod` p else v
labelH :: [Int] -> Int
labelH []   = 1
labelH (x:xs) = x + 2 * labelH xs
