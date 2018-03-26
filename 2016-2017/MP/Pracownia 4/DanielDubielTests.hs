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
  [ Test "val_inc"              (SrcString "input y in y")                                                  (Eval [5] (Value 5))
  , Test "val_inc1"             (SrcString "input x in x + 1")                                              (Eval [42] (Value 43))
  , Test "val_unarny"           (SrcString "input x in - x")                                                (Eval [5] (Value (-5)))
  , Test "val_letOP5priority"   (SrcString "let x = 5 in x + 6 - x + x")                                    (Eval [] (Value 11))
  , Test "val_letOP6priority"   (SrcString "let x = 5 in let y = 6 in x + y * x * x div y")                 (Eval [] (Value 30))
  , Test "val_if"               (SrcString "input x in if x>5 then 3 else 6")                               (Eval [10] (Value 3))
  , Test "val_if2"              (SrcString "input x y in if x>y or x<y then 1 else 0")                      (Eval [5,5] (Value 0))
  , Test "val_if3"              (SrcString "input x y z in if x>y or x<y and z = 5 then 1 else 0")          (Eval [4,6,5] (Value 1))
  , Test "val_ifNeg"            (SrcString "input a b in if not a = b then 1 else 0")                       (Eval [4,6] (Value 1))
  , Test "val_let"              (SrcString "input x in let x = x + 5 in let x = x * x in let x = x+1 in x") (Eval [5] (Value 101))
  , Test "val_contr"            (SrcString "let x = - - 5 in x")                                            (Eval [] (Value 5))
  , Test "val_combined"         (SrcString "input x in let x = 5 in if x = 6 and x <=6  then 10 else 0")    (Eval [10] (Value 0))
  , Test "type_TandF"           (SrcString "input u in true")                TypeError
  , Test "type_mod"             (SrcString "true mod (not false)")                   TypeError
  , Test "type_badReturn"       (SrcString "input x in false")                     TypeError
  , Test "type_undefVar"        (SrcString "x")                                    TypeError
  , Test "type_let"             (SrcString "let x = 6 in true")                    TypeError
  , Test "type_let2"            (SrcString "let x = not 6 in 5")                   TypeError
  , Test "type_if"              (SrcString "if 2 + 2 then 3 else 6")               TypeError
  , Test "type_if2"             (SrcString "if true or 2 + 2 then 3 else 6")       TypeError
  , Test "type_ifNeg"           (SrcString "input x in if not x then 1 else 2")    TypeError
  , Test "type_add"             (SrcString "input x in x + true")                  TypeError
  ]
