-- Wymagamy, by moduł zawierał tylko bezpieczne funkcje
{-# LANGUAGE Safe #-}
-- Definiujemy moduł zawierający testy.
-- Należy zmienić nazwę modułu na {Imie}{Nazwisko}Tests gdzie za {Imie}
-- i {Nazwisko} należy podstawić odpowiednio swoje imię i nazwisko
-- zaczynające się wielką literą oraz bez znaków diakrytycznych.
module BigTests(tests) where

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
  , Test "type_mod"             (SrcString "true mod (not false)")                 TypeError
  , Test "type_badReturn"       (SrcString "input x in false")                     TypeError
  , Test "type_undefVar"        (SrcString "x")                                    TypeError
  , Test "type_let"             (SrcString "let x = 6 in true")                    TypeError
  , Test "type_let2"            (SrcString "let x = not 6 in 5")                   TypeError
  , Test "type_if"              (SrcString "if 2 + 2 then 3 else 6")               TypeError
  , Test "type_if2"             (SrcString "if true or 2 + 2 then 3 else 6")       TypeError
  , Test "type_ifNeg"           (SrcString "input x in if not x then 1 else 2")    TypeError
  , Test "type_add"             (SrcString "input x in x + true")                  TypeError
  , Test "inc"      (SrcString "input x in x + 1") (Eval [42] (Value 43))
  , Test "undefVar" (SrcString "x")                TypeError


  , Test "smplLet11" (SrcString "input z y in let x = z + y in x")
                                                   (Eval [2, 3] (Value 5))

  , Test "smplTypeLet11" (SrcString "input z in let x = z + y in x")
                                                   TypeError

  , Test "smplTypeIf12" (SrcString "input x y in if x = y then x else false")
                                                   TypeError

  , Test "smplIf13" (SrcString "input x z y in if x = z + y then x else z")
                                                   (Eval [5, 3, 2] (Value 5))

  , Test "smplIf14" (SrcString "input x z y in if x = z + y then x else z")
                                                   (Eval [6, 3, 2] (Value 3))

  , Test "smplIf15" (SrcString "if true then 42 else 1 div 0")
                                                   (Eval [] (Value 42))


  , Test "override"
             (SrcString "input x in let x = x + 1 in let x = x + 2 in x")
                                                   (Eval [39] (Value 42))






  , Test "simple_eva_1" (SrcString "2") (Eval [] (Value 2))
  , Test "simple_eva_2" (SrcString "-277") (Eval [] (Value (-277)))
  , Test "simple_eva_3" (SrcString "1 + 2") (Eval [] (Value 3))
  , Test "simple_eva_4" (SrcString "let x = 2 in x + 2")(Eval [] (Value 4))
  , Test "simple_eva_5" (SrcString "if 2 < 3 then 5 else 3") (Eval [] (Value 5))
  , Test "simple_ari_mod" (SrcString "3 mod 0") (Eval [] RuntimeError)
  , Test "simple_ari_div" (SrcString "0 div 0") (Eval [] RuntimeError)
  , Test "simple_inc_1" (SrcString "true") TypeError,   Test "simple_inc_2" (SrcString "false") TypeError
  , Test "simple_inc_3" (SrcString "true or false") TypeError
  , Test "simple_inc_4" (SrcString "2 + true") TypeError,   Test "simple_inc_5" (SrcString "not 2") TypeError
  , Test "cmp_eva_1" (SrcString "if not true or false then -5 else 2 + 1") (Eval [] (Value 3))
  , Test "cmp_eva_2" (SrcString "input x y in x - y - 2") (Eval [1, 1] (Value (-2)))
  , Test "cmp_eva_3" (SrcString "2 * 4 mod 3 + 3") (Eval [] (Value 5))
  , Test "cmp_eva_4" (SrcString "if true and not false or false then 1 else 0" ) (Eval [] (Value 1))
  , Test "cmp_eva_5" (SrcString "let x = 2 * 8 in x mod 9") (Eval [] (Value 7))
  , Test "cmp_ari_mod" (SrcString "if 3 mod 0 < 0 then -8 else 4 - 2") (Eval [] RuntimeError)
  , Test "cmp_ari_div" (SrcString "if 0 div 0 = 7 - 2 then -2 + 2 else 2 * 5") (Eval [] RuntimeError)
  , Test "cmp_inc_1" (SrcString "true and not false or false or true or false and not true or false") TypeError
  , Test "cmp_inc_2" (SrcString "true + true or true") TypeError
  , Test "cmp_inc_3" (SrcString "2 or 1 and 5") TypeError
  , Test "cmp_inc_4" (SrcString "true and false + 2") TypeError
  , Test "cmp_inc_5" (SrcString "true div true") TypeError
  , Test "inc"      (SrcString "input x in x + 1") (Eval [42] (Value 43))
  , Test "undefVar" (SrcString "x")                TypeError
  , Test "dzialania1" (SrcString "1 + 2") (Eval [] (Value 3))
  , Test "dzialania2" (SrcString "4 - 1") (Eval [] (Value 3))
  , Test "dzialania3" (SrcString "2 * 5") (Eval [] (Value 10))
  , Test "dzialania4" (SrcString "3 div 2") (Eval [] (Value 1))
  , Test "dzialania5" (SrcString "2 mod 1") (Eval [] (Value 0))
  , Test "dzialania6" (SrcString "-2") (Eval [] (Value (-2)))

  , Test "zmienne1" (SrcString "input x y in x + y + 0") (Eval [1, 2] (Value 3))
  , Test "zmienne2" (SrcString "input x y in 2 + x + y") (Eval [1, 2] (Value 5))
  , Test "zmienne3" (SrcString "input x y in x - y") (Eval [2, 1] (Value 1))
  , Test "zmienne4" (SrcString "input x y in x * y") (Eval [1, 2] (Value 2))
  , Test "zmienne5" (SrcString "input x y in x div y") (Eval [1, 2] (Value 0))
  , Test "zmienne6" (SrcString "input x y in x mod y") (Eval [1, 2] (Value 1))
  , Test "zmienne7" (SrcString "input x y z in x + y * z") (Eval [1, 2, 3] (Value 7))
  , Test "zmienne8" (SrcString "input x y z in x + y div z") (Eval [1, 2, 3] (Value 1))
  , Test "zmienne9" (SrcString "input x y z in x + y mod z") (Eval [1, 2, 3] (Value 3))
  , Test "zmienne10" (SrcString "input x y z in x div y mod z") (Eval [1, 2, 3] (Value 0))
  , Test "zmienne11" (SrcString "input x y z in x div y mod z") (Eval [3, 2, 2] (Value 1))
  , Test "zmienne12" (SrcString "input x y z in x div y * z") (Eval [2, 2, 3] (Value 3))
  , Test "zmienne13" (SrcString "input x y z in x + y - z") (Eval [1, 2, 3] (Value 0))
  , Test "zmienne14" (SrcString "input x y z in x + y - z") (Eval [3, 2, 1] (Value 4))
  , Test "zmienne15" (SrcString "input x in x") (Eval [42] (Value 42))
  , Test "zmienne16" (SrcString "input x y z in x * y * z") (Eval [1, 2, 3] (Value 6))
  , Test "zmienne17" (SrcString "input x in let y = x in 2 * y") (Eval [21] (Value 42))

  , Test "let1" (SrcString "let x = 42 in x") (Eval [] (Value 42))
  , Test "let2" (SrcString "input x in let x = x + 2 in x + x") (Eval [2] (Value 8))
  , Test "let3" (SrcString "input x in let x = x + 1 in let x = x + 1 in x + x") (Eval [2] (Value 8))

  , Test "ify1" (SrcString "input x y in if true then x else y") (Eval [1, 2] (Value 1))
  , Test "ify2" (SrcString "input x y in if not true then x else y") (Eval [1, 2] (Value 2))
  , Test "ify3" (SrcString "input x y in if false then x else y") (Eval [1, 2] (Value 2))
  , Test "ify4" (SrcString "input x y in if not false then x else y") (Eval [1, 2] (Value 1))

  , Test "prostewarunki1" (SrcString "if 1 > 0 then 1 else 0") (Eval [] (Value 1))
  , Test "prostewarunki2" (SrcString "if 1 < 0 then 1 else 0") (Eval [] (Value 0))
  , Test "prostewarunki3" (SrcString "if 1 = 1 then 1 else 0") (Eval [] (Value 1))
  , Test "prostewarunki4" (SrcString "if 1 = 0 then 1 else 0") (Eval [] (Value 0))
  , Test "prostewarunki5" (SrcString "if 1 <> -1 then 1 else 0") (Eval [] (Value 1))
  , Test "prostewarunki6" (SrcString "if 1 <> 1 then 1 else 0") (Eval [] (Value 0))
  , Test "prostewarunki7" (SrcString "if 1 >= 1 then 1 else 0") (Eval [] (Value 1))
  , Test "prostewarunki8" (SrcString "if 0 >= 1 then 1 else 0") (Eval [] (Value 0))
  , Test "prostewarunki9" (SrcString "if 1 <= 1 then 1 else 0") (Eval [] (Value 1))
  , Test "prostewarunki10" (SrcString "if 1 <= 0 then 1 else 0") (Eval [] (Value 0))

  , Test "dzialaniawarunki1" (SrcString "if 1 = 0 + 1 then 1 else 0") (Eval [] (Value 1))
  , Test "dzialaniawarunki2" (SrcString "if 2 = 1 * 2 then 1 else 0") (Eval [] (Value 1))
  , Test "dzialaniawarunki3" (SrcString "if 4 div 2 = 1 then 1 else 0") (Eval [] (Value 0))
  , Test "dzialaniawarunki4" (SrcString "if 2 * 3 mod 4 = 6 mod 4 then 1 else 0") (Eval [] (Value 1))
  , Test "dzialaniawarunki5" (SrcString "if 2 > 1 or 3 < 2 then 1 else 0") (Eval [] (Value 1))
  , Test "dzialaniawarunki6" (SrcString "if 1 > 2 or 0 < -2 then 1 else 0") (Eval [] (Value 0))
  , Test "dzialaniawarunki7" (SrcString "if 1 = 1 and 3 >= 3 then 1 else 0") (Eval [] (Value 1))
  , Test "dzialaniawarunki8" (SrcString "if 0 <> 2 and 0 <> 0 then 1 else 0") (Eval [] (Value 0))
  , Test "dzialaniawarunki9" (SrcString "if 1 = 1 and not 2 = 5 then 1 else 0") (Eval [] (Value 1))

  , Test "boolwarunki1" (SrcString "if true or false then 1 else 0") (Eval [] (Value 1))
  , Test "boolwarunki2" (SrcString "if false or false then 1 else 0") (Eval [] (Value 0))
  , Test "boolwarunki3" (SrcString "if true and true then 1 else 0") (Eval [] (Value 1))
  , Test "boolwarunki4" (SrcString "if true and false then 1 else 0") (Eval [] (Value 0))
  , Test "boolwarunki5" (SrcString "if true and not false then 1 else 0") (Eval [] (Value 1))
  , Test "boolwarunki6" (SrcString "if not true or false then 1 else 0") (Eval [] (Value 0))
  , Test "boolwarunki7" (SrcString "if not true or not false then 1 else 0") (Eval [] (Value 1))

  , Test "prostezagniezdzone1" (SrcString "let x = if true then 1 else 0 in x") (Eval [] (Value 1))
  , Test "prostezagniezdzone2" (SrcString "if 1 = 0 + 1 then 1 else 0") (Eval [] (Value 1))
  , Test "prostezagniezdzone3" (SrcString "input x in let y = true in if y then x else 0") (Eval [1] (Value 1))

  , Test "warunkizagniezdzone1" (SrcString "if (if 1 = 1 then false else true) then 1 else 0") (Eval [] (Value 0))
  , Test "warunkizagniezdzone2" (SrcString "if (if 1 = 1 then false else true) and (if 1 = 1 then false else true) then 1 else 0") (Eval [] (Value 0))
  , Test "warunkizagniezdzone3" (SrcString "if (if 1 = 1 then 1 else 0) = (if false then 1 else 0) then 1 else 0") (Eval [] (Value 0))

  , Test "nietypowy1" (SrcString "input x in if true then x + 42 else x div 0") (Eval [1] (Value 43))
  , Test "RuntimeError1" (SrcString "input x in if false then x + 42 else x div 0")  (Eval [1] RuntimeError)
  , Test "RuntimeError2" (SrcString "1 mod 0")  (Eval [] RuntimeError)

  , Test "TypeError1" (SrcString "let x = true in x") TypeError
  , Test "TypeError2" (SrcString "x ") TypeError
  , Test "TypeError3" (SrcString "if false or 0 then 1 else 0") TypeError
  , Test "TypeError4" (SrcString "1 + true") TypeError
  , Test "TypeError5" (SrcString "4 or 1") TypeError
  , Test "TypeError6" (SrcString "2 and 5") TypeError
  , Test "TypeError7" (SrcString "if 1 = 1 then false else 0") TypeError
  , Test "TypeError8" (SrcString "if 1 = 1 then false else true") TypeError
  , Test "TypeError9" (SrcString "if 1 then 1 else 0") TypeError
  , Test "TypeError10" (SrcString "if 1 = false then 1 else 0") TypeError
  , Test "TypeError11" (SrcString "if if 1 = 1 then 1 else 2 then 1 else 0") TypeError
  , Test "TypeError12" (SrcString "if true = true then 1 else 0") TypeError
  ]
