-- Wymagamy, by moduł zawierał tylko bezpieczne funkcje
{-# LANGUAGE Safe #-}
-- Definiujemy moduł zawierający testy.
-- Należy zmienić nazwę modułu na {Imie}{Nazwisko}Tests gdzie za {Imie}
-- i {Nazwisko} należy podstawić odpowiednio swoje imię i nazwisko
-- zaczynające się wielką literą oraz bez znaków diakrytycznych.
module DanielDubielTests(tests) where

-- Importujemy moduł zawierający typy danych potrzebne w zadaniu
import DataTypes

-- Lista testów do zadania
-- Należy uzupełnić jej definicję swoimi testami
tests :: [Test]
tests =
  [ Test "val4_in"
    (SrcString "input y in y")
    (Eval [5] (Value 5))

  , Test "val4_in1"
    (SrcString "input x in x + 1")
    (Eval [42] (Value 43))

  , Test "val4_unarny"
    (SrcString "input x in - x")
    (Eval [5] (Value (-5)))

  , Test "val4_letOp5P"
    (SrcString "let x = 5 in x + 6 - x + x")
    (Eval [] (Value 11))

  , Test "val4_letOp6P"
    (SrcString "let x = 5 in let y = 6 in x + y * x * x div y")
    (Eval [] (Value 30))

  , Test "val4_if"
    (SrcString "input x in if x>5 then 3 else 6")
    (Eval [10] (Value 3))

  , Test "val4_if2"
    (SrcString "input x y in if x>y or x<y then 1 else 0")
    (Eval [5,5] (Value 0))

  , Test "val4_if3"
    (SrcString "input x y z in if x>y or x<y and z = 5 then 1 else 0")
    (Eval [4,6,5] (Value 1))

  , Test "val4_ifNeg"
    (SrcString "input a b in if not a = b then 1 else 0")
    (Eval [4,6] (Value 1))

  , Test "val4_let"
    (SrcString ("input x in let x = x + 5 in "
      ++ "let x = x * x in let x = x+1 in x"))
    (Eval [5] (Value 101))

  , Test "val4_contr"
    (SrcString "let x = - - 5 in x")
    (Eval [] (Value 5))

  , Test "val4_combined"
    (SrcString "input x in let x = 5 in if x = 6 and x <=6  then 10 else 0")
    (Eval [10] (Value 0))

  , Test "val5_fun_silnia"
    (SrcFile "silnia.pp5")
    (Eval [8] (Value 40320))

  , Test "val5_fun_fib"
    (SrcFile "fib.pp5")
    (Eval [8] (Value 21))

  , Test "val5_fun_BigFib"
    (SrcFile "fibM.pp5")
    (Eval [50] (Value 12586269025))

  , Test "val5_fun_ack"
    (SrcFile "ack.pp5")
    (Eval [3,5] (Value 253))

  , Test "val5_fun_toBin"
    (SrcFile "toBin.pp5")
    (Eval [1259] (Value 10011101011))

  , Test "val5_run"
    (SrcString ("input x in let x = 5 in if x = 6 and x <=6 "
      ++ "then 10 else x div 0"))
    (Eval [10] RuntimeError)

  , Test "val5_loop"
    (SrcString ("fun loop(x: unit):bool = loop() input "
      ++ "x in if x div 0 > 0 and loop() then 0 else 1"))
    (Eval [10] RuntimeError)

  , Test "type_return"
    (SrcString "input u in true")
     TypeError

  , Test "type_funRet"
    (SrcString "fun a(n:int):int = true input k in a(k)")
    TypeError

  , Test "type_undefVar"
    (SrcString "input x in y")
    TypeError

  , Test "type_unaryB"
    (SrcString "input x in not x")
     TypeError

  , Test "type_unaryI"
    (SrcString "let x = 6 in neg true")
     TypeError

  , Test "type_bin1"
    (SrcString "if 6 and true then 1 else 0")
    TypeError

  , Test "type_bin2"
    (SrcString "if true > 2 then 3 else 6")
     TypeError

  , Test "type_bin3"
    (SrcString "2 + true")
    TypeError

  , Test "type_if1"
    (SrcString "input x in if x > 0 then 1 else false")
    TypeError

  , Test "type_if2"
    (SrcString "input x in if x +1 then 1 else false")
    TypeError

  , Test "type_app1"
    (SrcString "fun mp(p: int):int = 5 input x in mp(true)")
    TypeError

  , Test "type_app2"
    (SrcString "input x in mp(true)")
    TypeError

  , Test "type_fst"
    (SrcString "input x in fst x")
    TypeError

  , Test "type_snd"
    (SrcString "input x in snd x")
    TypeError

  , Test "type_emptyL"
    (SrcString "input x in match []: int with []->0 | x::xs -> x")
    TypeError

  , Test "type_list1"
    (SrcString "input x in x::false::[] : bool list")
    TypeError

  , Test "type_list2"
    (SrcString "input x in x::2")
    TypeError

  , Test "type_match1"
    (SrcString "input x in dfmatch x with [] -> 0 | x::xs -> 1")
    TypeError

  , Test "type_match2"
    (SrcString "input x in match []:int list with [] -> 0 | x::xs -> true")
    TypeError
  ]
