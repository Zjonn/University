-- Wymagamy, by moduł zawierał tylko bezpieczne funkcje
{-# LANGUAGE Safe #-}
-- Definiujemy moduł zawierający testy.
-- Należy zmienić nazwę modułu na {Imie}{Nazwisko}Tests gdzie za {Imie}
-- i {Nazwisko} należy podstawić odpowiednio swoje imię i nazwisko
-- zaczynające się wielką literą oraz bez znaków diakrytycznych.
module MixedTests(tests) where

-- Importujemy moduł zawierający typy danych potrzebne w zadaniu
import DataTypes

-- Lista testów do zadania
-- Należy uzupełnić jej definicję swoimi testami
tests :: [Test]
tests =
  [ Test "inc"      (SrcString "input x in x + 1") (Eval [42] (Value 43))
  , Test "undefVar" (SrcString "x")                TypeError
  , Test "lazyIf_with_vars"   (SrcString "input x in if true then x + 5 else 5 div 0") (Eval [5] (Value 10))
  , Test "lazyIf"   (SrcString "if true then 1 else 1 div 0") (Eval [] (Value 1))
  , Test "lazyIf_with_false" (SrcString "if false then 5 div 0 else 1") (Eval [] (Value 1))
  , Test "let_test" (SrcString "input x in let t = 5 in t*t + x") (Eval [17] (Value 42))
  , Test "tricky_arithmetic" (SrcString "10 + -7") (Eval [] (Value 3))
  , Test "lots_of_minuses" (SrcString "10 - - - - 7") (Eval [] (Value 17))
  , Test "proper_or" (SrcString "input a in if a > 0 or a < 0 then 14*3 else 42 div 7") (Eval [-10] (Value 42))
  , Test "proper_and" (SrcString "input a b in if a < 0 and b >= 0 then 2*2 else 5 + 5") (Eval [1, 1] (Value 10))
  , Test "minus_bool" (SrcString "input a in if - true then 1 else 0") TypeError
  , Test "plus_associativity" (SrcString "input a b in 5 + b + a + 2 + 1") (Eval [3,4] (Value 15))
  , Test "or_associativity" (SrcString "if false or false or false or true then 1 else 0") (Eval [] (Value 1))
  , Test "variable_used_more_than_once" (SrcString "input a b in if a > 0 then a*b + a*5 + a else b*a + b*5 + b") (Eval [1,1000] (Value 1006))
  , Test "unused_variable" (SrcString "input a b in a*2") (Eval [5,2031] (Value 10)) 
  , Test "basic_arithmetic" (SrcString "100*2 + 10*5 + 6") (Eval [] (Value 256))
  , Test "arithmetic_with_bool_unary" (SrcString "not 100*2 + 3") TypeError
  , Test "arithmetic_with_bool_binary" (SrcString "(200*3 or 3) and 5") TypeError
  , Test "more_variables" (SrcString "input x y z in x + y + z") (Eval [1,2,3] (Value 6))
  , Test "variables_with_undefined" (SrcString "input x y in x*y + z") TypeError
  , Test "proper_order_of_let" (SrcString "let x = 5 in let x = x + 10 in x") (Eval [] (Value 15))
  , Test "is_number_true" (SrcString "if 5 then 5 else 5") TypeError
  , Test "normal_if" (SrcString "input var in if var > 1 then 10 else 5 + var") (Eval [0] (Value 5))
  , Test "trivial_associativity" (SrcString "input x in x + x * x") (Eval [2] (Value 6))
  , Test "number_as_bool" (SrcString "input a in if a or true then a else a + 1") TypeError
  , Test "negation" (SrcString "input x in if not false then 5 + x else 5 - x") (Eval [1] (Value 6))
  , Test "double_negation" (SrcString "input x in if not not false then 5 + x else 5 - x") (Eval [1] (Value 4))
  , Test "simple_arithmetic_with_parentheses" (SrcString "(2 + 3 + 4)*5 + 1") (Eval [] (Value 46))
  , Test "equality_operators_with_bool" (SrcString "if true <> false then 1 else 0") TypeError
  , Test "other_let" (SrcString "input x in let x = 2*x in 6 + x") (Eval [4] (Value 14))
  , Test "nested_let" (SrcString "let x = 2 in let x = 2*x in let x = x + 5 in let x = 3*x in x + 1") (Eval [] (Value 28))
  , Test "prac1" (SrcString "let x = 3 div 0 in 3") (Eval [] RuntimeError)
  , Test "lazyIf_dependent_from_var" (SrcString "input x in if x >= 0 then x else x div 0") (Eval [42] (Value 42))
  , Test "bool_variable" (SrcString "let y = false in if y then 2 else 3") (Eval [] (Value 3))
  , Test "changing_type" (SrcString "let x = true in let x = 3 in x") (Eval [] (Value 3))
  , Test "changing_type2" (SrcString "let x = 3 in let x = false in let x = true in if x then 1 else 1 div 0") (Eval [] (Value 1))
  ,
  Test "singleVar" (SrcString "input x in x") (Eval [69] (Value 69)),
  Test "not" (SrcString "if not true then 2 else 1") (Eval [] (Value 1)),
  Test "not2" (SrcString "if not false then 2 else 1") (Eval [] (Value 2)),
  Test "neg" (SrcString "-3") (Eval [] (Value (-3))),
  Test "and" (SrcString "if true and true then 3 else 7") (Eval [] (Value 3)),
  Test "and2" (SrcString "if true and false then 3 else 7") (Eval [] (Value 7)),
  Test "and3" (SrcString "if false and true then 3 else 7") (Eval [] (Value 7)),
  Test "and4" (SrcString "if false and false then 3 else 7") (Eval [] (Value 7)),
  Test "or" (SrcString "if true or true then 3 else 7") (Eval [] (Value 3)),
  Test "or2" (SrcString "if true or false then 3 else 7") (Eval [] (Value 3)),
  Test "or3" (SrcString "if false or true then 3 else 7") (Eval [] (Value 3)),
  Test "or4" (SrcString "if false or false then 3 else 7") (Eval [] (Value 7)),
  Test "eq" (SrcString "if 1 = 1 then 1 else 4") (Eval [] (Value 1)),
  Test "eq2" (SrcString "if 1 = 4 then 1 else 4") (Eval [] (Value 4)),
  Test "nEq" (SrcString "if 1 <> 1 then 1 else 4") (Eval [] (Value 4)),
  Test "nEq2" (SrcString "if 1 <> 4 then 1 else 4") (Eval [] (Value 1)),
  Test "LT" (SrcString "if 1 < 4 then 1 else 4") (Eval [] (Value 1)),
  Test "LT2" (SrcString "if 1 < 1 then 1 else 4") (Eval [] (Value 4)),
  Test "GT" (SrcString "if 1 > 4 then 1 else 4") (Eval [] (Value 4)),
  Test "GT2" (SrcString "if 1 > 1 then 1 else 4") (Eval [] (Value 4)),
  Test "LE" (SrcString "if 1 <= 4 then 1 else 4") (Eval [] (Value 1)),
  Test "LE2" (SrcString "if 1 <= 1 then 1 else 4") (Eval [] (Value 1)),
  Test "LE3" (SrcString "if 1 <= -1 then 1 else 4") (Eval [] (Value 4)),
  Test "GE" (SrcString "if 1 >= 4 then 1 else 4") (Eval [] (Value 4)),
  Test "GE2" (SrcString "if 1 >= 1 then 1 else 4") (Eval [] (Value 1)),
  Test "GE3" (SrcString "if 1 >= -1 then 1 else 4") (Eval [] (Value 1)),
  Test "add" (SrcString "8 + 8") (Eval [] (Value 16)),
  Test "sub" (SrcString "8 - 8") (Eval [] (Value 0)),
  Test "mul" (SrcString "8 * 8") (Eval [] (Value 64)),
  Test "div" (SrcString "8 div 8") (Eval [] (Value 1)),
  Test "mod" (SrcString "37 mod 21") (Eval [] (Value 16)),
  Test "let" (SrcString "let x = 21 in x + 14") (Eval [] (Value 35)),
  
  Test "muchInput" (SrcString "input q w e r t y u i o p a s d f g h j k l z x c v b n m in h + a + s + k + e + l + l") (Eval [1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7] (Value 38)),
  
  Test "tricky" (SrcString "if true then 21 else 37 div 0") (Eval [] (Value 21)),
  Test "tricky2" (SrcString "69 + -69") (Eval [] (Value 0)),
  Test "tricky3" (SrcString "- -1337") (Eval [] (Value 1337)),
  Test "tricky4" (SrcString "- - -1337") (Eval [] (Value (-1337))),
  Test "bool" (SrcString "if 13 = 37 and true then 13 else 37") (Eval [] (Value 37)),
  Test "bool2" (SrcString "if 13 = 37 or true then 13 else 37") (Eval [] (Value 13)),
  
  Test "numberAsBool" (SrcString "if 14 then 1997 else 88") TypeError,
  Test "wrongLet" (SrcString "let x = 89 in 23") (Eval [] (Value 23)),
  
  Test "numberAsBool2" (SrcString "if 8 and true then 3 else 4") TypeError,
  Test "numberAsBool3" (SrcString "if 7 or false then 3 else 4") TypeError,
  Test "boolAsNumber" (SrcString "true") TypeError
  , Test "op"       (SrcString "input x x1 in x * 5 - x1 div 2") (Eval [9,16] (Value 37))
  , Test "op_Er"     (SrcString "input x in x div 0") (Eval [42] RuntimeError)
  , Test "if"       (SrcString "input x x1 in if x = 3 then 4 else x1") (Eval [3,5] (Value 4))
 
  , Test "if_Er"     (SrcString "input x in if 13 then true else x * 150") TypeError
  , Test "if_Div"    (SrcString "input x x1 in if x + 88 = 42 then 42 div 0 else x1") (Eval [12, 162] (Value 162))
  , Test "let"      (SrcString "input x x1 x2 in let  x = x1 * 3 in x2") (Eval [3,1,5] (Value 5))
  , Test "div"      (SrcString "input x in if x div 2 = 4 then x else 0") (Eval [8] (Value 8))
  , Test "double_If" (SrcString "input x in if if x = 42 then true else false then 42 else x") (Eval [42] (Value 42))
 
  , Test "triple_If" (SrcString "input x in if if x = 42 then true else false then if true then 42 else 42 + x else x") (Eval [42] (Value 42))
  , Test "let_Er"      (SrcString "input x x1 in let x = x1 * 3 in x2") TypeError
  , Test "mult_Add"      (SrcString "input x x1 x2 x3 x4 x5 in x + x1 + x2 + x3 + x4 + x5") (Eval [1,2,3,4,5,6] (Value 21))
  , Test "mult_Sub"      (SrcString "input x x1 x2 x3 x4 x5 in x - x1 - x2 - x3 - x4 - x5") (Eval [42,1,5,4,10,2] (Value 20))
  , Test "Add_Sub_Er"      (SrcString "input x x1 x2 x3 x4 x5 in x - x1 + x2 + x3 - x4 - x5") (Eval [0,0,0,0,0,0] (Value 0))
 
  , Test "bool_Er"      (SrcString "input x in if true then true else x") TypeError
  , Test "bool"      (SrcString "input x in if true then x else false") TypeError
  , Test "mod_Er"      (SrcString "input x in x mod 0") (Eval [1] RuntimeError)
  , Test "no_eval"      (SrcString "42 + 0") (Eval [] (Value 42))

  , Test "simplifyOperators" (SrcString " input x in x + 10 - - -  1") (Eval [1] (Value 10))
  , Test "ifStatement"       (SrcString "input x y in if x >= 1 then 144 else y * 5") (Eval [2, 3] (Value 144))
  , Test "negationSimplifiedToTrue" (SrcString "input x in if not not true then x * 1 else x div 1") (Eval [1] (Value 1))
  , Test "simpleInputIn"       (SrcString "input x y in x * 1 - y div 4") (Eval [4,12] (Value 1))
  , Test "errorWithBoolInIf"     (SrcString "input x in if 11 then x * 22 else x * 33") TypeError
  , Test "evaluateBoolExpression" (SrcString "if true or false or false or true then 1 else 0") (Eval [] (Value 1))
  , Test "checkBoolInIf"      (SrcString "input x in if x div 2 >= 1 then x div 3 else x * 3") (Eval [24] (Value 8))
  , Test "undefinedVariables"      (SrcString "input x y in x*y + z") TypeError
  , Test "notValidReturnThen"      (SrcString "input x in if true then true else x * 2") TypeError
  , Test "properIfLazy" (SrcString "input x in if x >= 0 then x else x div 0") (Eval [1] (Value 1))
  , Test "quiteHardIfExpr" (SrcString "input a b c in if a < 0 and b < 0 then c else a + b") (Eval [-1, -1, 1] (Value 1))
  , Test "multipleSums"      (SrcString "input x y z a b in x + y + z + a + b") (Eval [1,11,11,11,11] (Value 45))
  , Test "thereIsUnusedVar" (SrcString "input x y in x*2") (Eval [1,2] (Value 2))
  , Test "scriptInterpretLanguage" (SrcString "1 + 10 + 100") (Eval [] (Value 111))
  , Test "orAppliedToNumberAndBool" (SrcString "input a in if a or true then a else a") TypeError 
  , Test "multipleSubstractions"      (SrcString "input a b c d in a - b - c - d") (Eval [3,1,1,1] (Value 0))
  , Test "errorWithBoolInIf" (SrcString "if 1 then 2 else 3") TypeError
  , Test "priorityOperators"      (SrcString "input a b c in a * b - c") (Eval [2,2,3] (Value 1))
  , Test "binaryWithUnaryOperator" (SrcString "10 + -7") (Eval [] (Value 3))       
  , Test "alwaysReturnInput"      (SrcString "input x in if true then x else x mod 2") (Eval [1] (Value 1))
  , Test "usingUndefinedVariable" (SrcString "input x y in x + y + z") TypeError
  , Test "mixedBoolAndIntegerOperator" (SrcString "input a in if - true then 1 else 0") TypeError
  , Test "meine" (SrcString "let x = true in if not x then 2 else 3") (Eval [] (Value 3))
  , Test "nestedIfElse" (SrcString "input x in if if x >= 1 then true else false then if true then x * 3 else 42 + x else x") (Eval [1] (Value 3))
  , Test "letStatementNested" (SrcString "let x = 1 in let x = 2*x in let x = x + 5 in let x = 3*x in x + -1") (Eval [] (Value 20))
  , Test "negationIf" (SrcString "input x in if not false then x else -x") (Eval [1] (Value 1))
  , Test "cokolwiek" (SrcString "if not (if false then false else true) then 1 else 2") (Eval [] (Value 2))

  , Test "val_inc"              (SrcString "input y in y")                                                  (Eval [5] (Value 5))
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
  , Test "inc"      (SrcString "input x in x + 1") (Eval [42] (Value 43))
  , Test "undefVar" (SrcString "x")                TypeError
  , Test "smplTest1" (SrcString "2")               (Eval [] (Value 2))
  , Test "smplTest2" (SrcString "-2 + 2")          (Eval [] (Value 0))
  , Test "smplTest3" (SrcString "-2 div 0")          (Eval [] RuntimeError)
  , Test "smplTest4" (SrcString "1 - 2 + 3")       (Eval [] (Value 2))
  , Test "smplTest5" (SrcString "1 div 2")         (Eval [] (Value 0))
  , Test "smplTest6" (SrcString "14 mod 10")       (Eval [] (Value 4))
  , Test "smplTest7" (SrcString "11 mod 10 * 10")  (Eval [] (Value 10))
  , Test "smplTypeTest8" (SrcString "2 + true")        TypeError
  , Test "smplTypeTest9" (SrcString "input x in if 5 then false else x")
                                                   TypeError
  , Test "smplTypeTest10" (SrcString "input x in x + y")
                                                   TypeError

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

  , Test "smplTest16" (SrcString "42 mod 0")       (Eval [] RuntimeError)

  , Test "override"
             (SrcString "input x in let x = x + 1 in let x = x + 2 in x")
                                                   (Eval [39] (Value 42))

  , Test "smplTest18" (SrcString
                "if 4 > 2 then if true or false then 2 else 0 else 1")
                                                   (Eval [] (Value 2))

  , Test "smplTest19" (SrcString "if true and false then 0 else 1")
                                                   (Eval [] (Value 1))

  , Test "smplTest20"
                (SrcString "if 2 <> 1 and 3>=3 and 2=2 then 1 else 0")
                                                   (Eval [] (Value 1))

  , Test "prioBool21"
                 (SrcString "if true or false and true then 1 else 0")
                                                   (Eval [] (Value 1))

  , Test "smplTypeTest22" (SrcString "let x = 2 < 1 in x")
                                                   TypeError
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
  , Test "cantReturnBool1" (SrcString "5 <= 0 and 3") TypeError
  , Test "nestedExpError" (SrcString "let x = true in let y = 5 + 2 in if not x then y else x") TypeError
  , Test "cantReturnBool2" (SrcString "10 <> 11 and not true") TypeError
  , Test "num" (SrcString "-4") (Eval [] (Value (-4)))
  , Test "mathExp1" (SrcString "input x in 2 + 3 * 4 div x") (Eval [4] (Value 5))
  , Test "mathExp2" (SrcString "input x in (-x) mod 2 ") (Eval [6] (Value 0)) 
  , Test "mathExp3" (SrcString "input x in 4-(-x)") (Eval [4] (Value 8)) 
  , Test "letExp" (SrcString "input y in let x = 3 in x + y ") (Eval [2] (Value 5))
  , Test "ifExp1" (SrcString "input x y in if x <> y then y else x") (Eval [4,60] (Value 60))
  , Test "ifExp2" (SrcString "input x y in if not 2<1 then x*y else x div y") (Eval [100,10] (Value 1000) ) 
  , Test "ifExp3" (SrcString "input x y in if x*x = x + x and x > y then x+y else y+2") (Eval [2,1] (Value 3)) 
  , Test "nestedExp" (SrcString "let x = 5 in let y = x + 2 in if x = 5 and y > x then x + y else y") (Eval [] (Value 12))
  , Test "trickyExp" (SrcString "let x = 10 in if true then x else x div 0") (Eval [] (Value 10))
  , Test "notTrickyError" (SrcString "let x = 10 in if false then x else x mod 0")  (Eval [] RuntimeError)







    ,Test "inc"               (SrcString "input x in x + 1") (Eval [42] (Value 43))
  , Test "undefVar"          (SrcString "x") TypeError
  , Test "addTrue"           (SrcString "input x in x + true") TypeError
  , Test "addition"          (SrcString "input x y in x + y") (Eval [2,5] (Value 7))
  , Test "substraction"      (SrcString "input x y in x - y") (Eval [2,5] (Value (-3)))
  , Test "addition2"         (SrcString "input x y in y + x") (Eval [10,3] (Value 13))
  , Test "substraction2"     (SrcString "input x y in y - x") (Eval [10,7] (Value (-3)))
  , Test "times"             (SrcString "input x y in x * y") (Eval [3,3] (Value 9))
  , Test "div"               (SrcString "input x y in x div y") (Eval [10,9] (Value 1))
  , Test "addandtimes"       (SrcString "input x y z in x + y * z") (Eval [3,9,12] (Value 111))
  , Test "wrongtimes"        (SrcString "input x y z t in x * y - true") TypeError
  , Test "iftest1"           (SrcString "input x y in if x < y then y else x div 2") (Eval [5,8] (Value 8))
  , Test "iftest2"           (SrcString "input x y in if x < y then y else x div 2") (Eval [8,5] (Value 4))
  , Test "lettest1"          (SrcString "input x y in if x < y then 5 else let y = x in y + y") (Eval [2,5] (Value 5))
  , Test "lettest2"          (SrcString "input x y z in if z > 10 then let x = 3 in z + x + y else 5") (Eval [3,5,2] (Value 5))
  , Test "runtimeerrortest"  (SrcString "input x in if x < 8 then x + 3 else x div 0") (Eval [25] (RuntimeError))
  , Test "runtimeerrortest2" (SrcString "input x in if x < 8 then x + 3 else x mod 0") (Eval [25] (RuntimeError))
  , Test "onlytrue"          (SrcString "true") TypeError
  , Test "parentheses1"      (SrcString "input x y in x + (x - y) - y + (y + (x - y))") (Eval [4,5] (Value 2))
  , Test "parentheses2"      (SrcString "input x y in x div 10 + y mod (20 + y) - 8 - (y div x)") (Eval [20,25] (Value 18))
  , Test "lettest3"          (SrcString "input x y t in if x > 5 then let x = y < 10 in if x then t else y else t") (Eval [5,7,8] (Value 8))
  , Test "lettest4"          (SrcString "input x y t in if x > 5 then let x = y < 10 in if x then t else y else y") (Eval [6,7,8] (Value 8))
  , Test "lettest5"          (SrcString "let x = false in x mod 42") TypeError
  , Test "commentin"         (SrcString "input(* dfgfdsgdsfgfdsgd *) x (* blablablabla *) in x * x (* *)") (Eval [99999] (Value (9999800001)))
  , Test "simpletest"        (SrcString "589 + 789 - 368") (Eval [] (Value 1010))
  , Test "simpletest2"       (SrcString "589 mod 20") (Eval [] (Value 9))
  , Test "simpletest3"       (SrcString "let x = 5892 in x mod 20") (Eval [] (Value 12))
  , Test "simpletest4"       (SrcString "if 486 <> 1684135684 then 42 else 2134326") (Eval [] (Value 42))
  , Test "simpletest5"       (SrcString "input x in -x") (Eval [486] (Value (-486)))
  , Test "simpletest6"       (SrcString "input x in if x <= false then true else 42") TypeError
  , Test "simpletest7"       (SrcString "input x y in if x then y * x else 0") TypeError
  , Test "lootsofvar"        (SrcString "input x y z t v a b c d in if x < d then a * b + y - (c * (v * x)) else a - (d * (t * (v * x) ))")(Eval [10,7,23,12,5,23,12,3,1] (Value (-577)))

---
 ,Test "constValue" (SrcString "2") (Eval [] (Value 2)),
  Test "unary" (SrcString "input x y in if not x < y then -x else -y") (Eval [120, 1434] (Value (-1434))),
  Test "decrement" (SrcString "input x in x - 1") (Eval [42] (Value 41)),
  Test "doesntMakeSense" (SrcString "input x in if if x>0 then true else false then x + x else 0") (Eval [10] (Value 20)),
  Test "notAllUsed" (SrcString "input x y z in if x >= y then x else y") (Eval [10, 11, 12] (Value 11)),
  Test "constant" (SrcString "let x = 10 in let y = 100 in x + y") (Eval [] (Value 110)),
  Test "looksBadButItsNot" (SrcString "input x in if x<10 then x + 1 else x div 0") (Eval [9] (Value 10)),
  Test "looksBadAndItsBad" (SrcString "input x in if x<10 then x + 1 else x div 0") (Eval [11] RuntimeError),
  Test "runtimeAnyway" (SrcString "10 div 0") (Eval [] RuntimeError),
  Test "undefVar" (SrcString "x + 4") TypeError,
  Test "intIf" (SrcString "if 4 then true else false") TypeError,
  Test "wrongUBool" (SrcString "not 4") TypeError,
  Test "wrongUInt" (SrcString "-true") TypeError,
  Test "wrongBInt" (SrcString "4 + true") TypeError,
  Test "wrongBBool" (SrcString "let x = 4 in true and x") TypeError,
  Test "wrongBRel" (SrcString "let x = 21 in let y = 34 in x + y") (Eval [] (Value 55)),
  Test "differentInIf" (SrcString "input x y in if x >= y then true else 10") TypeError,
  Test "inputAlwaysInt" (SrcString "input x y z in if x then if y then y+z else z+y else if z then z+x else x+z") TypeError,
  Test "wrongResult" (SrcString "input x y in if x <> y then true else false") TypeError,
  Test "opticalIllusion" (SrcString "input q w e r t y u i o p a s d f g h j k l z x c b n m in q + w + e - r - t + y + u + i + o + p + a + s + d + f + g + h + j + k + l + z + x + c + v + b + n + m") TypeError
----
  ,Test "inc"                  (SrcString "input x in x + 1")                       (Eval [42] (Value 43))
  , Test "binary_op_add"        (SrcString "42 + 17")                                (Eval [] (Value 59))
  , Test "negative_num"         (SrcString "10 - 100")                               (Eval [] (Value (-90)))
  , Test "binary_op_mod"        (SrcString "42 mod 10")                              (Eval [] (Value 2))
  , Test "binary_op_div"        (SrcString "3 div 2")                                (Eval [] (Value 1))
  , Test "operators_precedence" (SrcString "30 + 3 * 4")                             (Eval [] (Value 42))
  , Test "parentheses1"         (SrcString "(30 + 3) * 4")                           (Eval [] (Value 132))
  , Test "parentheses2"         (SrcString "input x y in (x - 2) * y + x")           (Eval [4,5] (Value 14))
  , Test "should_not_overflow"  (SrcString "input x in x * x")                       (Eval [9999999999] (Value 99999999980000000001))
  , Test "zero_division"        (SrcString "input x in x div 0")                     (Eval [42] RuntimeError )

  , Test "let"                  (SrcString "let x = 12 in x + 30")                   (Eval [] (Value 42))
  , Test "let_override"         (SrcString "input x in let x = 1 in x + 1")          (Eval [42] (Value 2))
  , Test "nested_let"           (SrcString "let x = 1 in let y = 2 in x + y")        (Eval [] (Value 3))
  , Test "let_if_boolean"       (SrcString "let x = if true then true else false in 1") (Eval [] (Value 1))

  , Test "if_true"              (SrcString "if true then 1 else 0")                  (Eval [] (Value 1))
  , Test "if_false"             (SrcString "if false then 1 else 0")                 (Eval [] (Value 0))
  , Test "let_with_if"          (SrcString "let x = if true then 1 else 0 in x + 1") (Eval [] (Value 2))
  , Test "comparison_gt"        (SrcString "if 1 > 2 then 1 else 0")                 (Eval [] (Value 0))
  , Test "comparison_gte"       (SrcString "if 2 >= 2 then 1 else 0")                (Eval [] (Value 1))
  , Test "comparison_neq2"      (SrcString "if 2 <> 2 then 1 else 0")                (Eval [] (Value 0))
  , Test "logical_op"           (SrcString "if true and false then 1 else 0")        (Eval [] (Value 0))
  , Test "logical_op2"          (SrcString "input x in if x <> 2 or x = 0 then 1 else 0") (Eval [2] (Value 0))

  , Test "unary_op"             (SrcString "input x in -x")                          (Eval [42] (Value (-42)))
  , Test "unary_op_not"         (SrcString "if not true then 1 else 0 ")             (Eval [] (Value 0))

  , Test "boolean_var"          (SrcString "let x = true in if x then 1 else 0")     (Eval [] (Value 1))
  , Test "boolean_var2"         (SrcString "let x = 1 <> 2 in if x then 1 else 0")   (Eval [] (Value 1))

  , Test "comment"              (SrcString "input x (* comment *) in x")             (Eval [42] (Value (42)))

  -- Test Type checker
  -- =================

  , Test "undefVar"         (SrcString "x")                                         TypeError
  , Test "minusBool"        (SrcString "if -true then 1 else 0")                    TypeError
  , Test "mod_bool"         (SrcString "let x = true in if x then x mod 2 else 0")  TypeError

  , Test "notInteger"       (SrcString "if not 1 then 1 else 0")                    TypeError
  , Test "orInteger"        (SrcString "if 1 or 2 then 1 else 0")                   TypeError
  , Test "and_op_numbers"   (SrcString "if 1 and 2 then 1 else 0")                  TypeError
  , Test "if_result"        (SrcString "if true then true else false")              TypeError

  , Test "let_bool"         (SrcString "let x = true in x + 1")                     TypeError
  , Test "int_input"        (SrcString "input x in if x then 1 else 0")             TypeError

  , Test "compare_bool_gt"  (SrcString "if true > false then 1 else 0")             TypeError
  , Test "compare_bool_gte" (SrcString "if true >= false then 1 else 0")            TypeError







  , Test "inc"      (SrcString "input x in x + 1") (Eval [42] (Value 43))
  , Test "undefVar" (SrcString "x")                TypeError
  , Test "smplTest1" (SrcString "2")               (Eval [] (Value 2))
  , Test "smplTest2" (SrcString "-2 + 2")          (Eval [] (Value 0))
  , Test "smplTest3" (SrcString "-2 div 0")          (Eval [] RuntimeError)
  , Test "smplTest4" (SrcString "1 - 2 + 3")       (Eval [] (Value 2))
  , Test "smplTest5" (SrcString "1 div 2")         (Eval [] (Value 0))
  , Test "smplTest6" (SrcString "14 mod 10")       (Eval [] (Value 4))
  , Test "smplTest7" (SrcString "11 mod 10 * 10")  (Eval [] (Value 10))
  , Test "smplTypeTest8" (SrcString "2 + true")        TypeError
  , Test "smplTypeTest9" (SrcString "input x in if 5 then false else x")
                                                   TypeError

  , Test "smplTypeTest10" (SrcString "input x in x + y")
                                                   TypeError

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

  , Test "smplTest16" (SrcString "42 mod 0")       (Eval [] RuntimeError)

  , Test "override"
             (SrcString "input x in let x = x + 1 in let x = x + 2 in x")
                                                   (Eval [39] (Value 42))

  , Test "smplTest18" (SrcString
                "if 4 > 2 then if true or false then 2 else 0 else 1")
                                                   (Eval [] (Value 2))

  , Test "smplTest19" (SrcString "if true and false then 0 else 1")
                                                   (Eval [] (Value 1))

  , Test "smplTest20"
                (SrcString "if 2 <> 1 and 3>=3 and 2=2 then 1 else 0")
                                                   (Eval [] (Value 1))

  , Test "prioBool21"
                 (SrcString "if true or false and true then 1 else 0")
                                                   (Eval [] (Value 1))

  , Test "smplTypeTest22" (SrcString "let x = 2 < 1 in x") TypeError



  , Test "inc" (SrcString "input x in x + 1") (Eval [42] (Value 43)),
  Test "undefVar" (SrcString "x") TypeError,
  
  Test "singleVar" (SrcString "input x in x") (Eval [69] (Value 69)),
  Test "not" (SrcString "if not true then 2 else 1") (Eval [] (Value 1)),
  Test "not2" (SrcString "if not false then 2 else 1") (Eval [] (Value 2)),
  Test "neg" (SrcString "-3") (Eval [] (Value (-3))),
  Test "and" (SrcString "if true and true then 3 else 7") (Eval [] (Value 3)),
  Test "and2" (SrcString "if true and false then 3 else 7") (Eval [] (Value 7)),
  Test "and3" (SrcString "if false and true then 3 else 7") (Eval [] (Value 7)),
  Test "and4" (SrcString "if false and false then 3 else 7") (Eval [] (Value 7)),
  Test "or" (SrcString "if true or true then 3 else 7") (Eval [] (Value 3)),
  Test "or2" (SrcString "if true or false then 3 else 7") (Eval [] (Value 3)),
  Test "or3" (SrcString "if false or true then 3 else 7") (Eval [] (Value 3)),
  Test "or4" (SrcString "if false or false then 3 else 7") (Eval [] (Value 7)),
  Test "eq" (SrcString "if 1 = 1 then 1 else 4") (Eval [] (Value 1)),
  Test "eq2" (SrcString "if 1 = 4 then 1 else 4") (Eval [] (Value 4)),
  Test "nEq" (SrcString "if 1 <> 1 then 1 else 4") (Eval [] (Value 4)),
  Test "nEq2" (SrcString "if 1 <> 4 then 1 else 4") (Eval [] (Value 1)),
  Test "LT" (SrcString "if 1 < 4 then 1 else 4") (Eval [] (Value 1)),
  Test "LT2" (SrcString "if 1 < 1 then 1 else 4") (Eval [] (Value 4)),
  Test "LT3" (SrcString "if 1 < -4 then 1 else 4") (Eval [] (Value 4)),
  Test "GT" (SrcString "if 1 > -4 then 1 else 4") (Eval [] (Value 1)),
  Test "GT2" (SrcString "if 1 > 1 then 1 else 4") (Eval [] (Value 4)),
  Test "GT3" (SrcString "if 1 > 4 then 1 else 4") (Eval [] (Value 4)),
  Test "LE" (SrcString "if 1 <= 4 then 1 else 4") (Eval [] (Value 1)),
  Test "LE2" (SrcString "if 1 <= 1 then 1 else 4") (Eval [] (Value 1)),
  Test "LE3" (SrcString "if 1 <= -1 then 1 else 4") (Eval [] (Value 4)),
  Test "GE" (SrcString "if 1 >= 4 then 1 else 4") (Eval [] (Value 4)),
  Test "GE2" (SrcString "if 1 >= 1 then 1 else 4") (Eval [] (Value 1)),
  Test "GE3" (SrcString "if 1 >= -1 then 1 else 4") (Eval [] (Value 1)),
  Test "add" (SrcString "8 + 8") (Eval [] (Value 16)),
  Test "sub" (SrcString "8 - 8") (Eval [] (Value 0)),
  Test "mul" (SrcString "8 * 8") (Eval [] (Value 64)),
  Test "div" (SrcString "8 div 8") (Eval [] (Value 1)),
  Test "mod" (SrcString "37 mod 21") (Eval [] (Value 16)),
  Test "let" (SrcString "let x = 21 in x + 14") (Eval [] (Value 35)),
  
  Test "muchInput" (SrcString "input q w e r t y u i o p a s d f g h j k l z x c v b n m in h + a + s + k + e + l + l") (Eval [1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7] (Value 38)),

  Test "tricky" (SrcString "if true then 21 else 37 div 0") (Eval [] (Value 21)),
  Test "tricky2" (SrcString "69 + -69") (Eval [] (Value 0)),
  Test "tricky3" (SrcString "- -1337") (Eval [] (Value 1337)),
  Test "tricky4" (SrcString "- - -1337") (Eval [] (Value (-1337))),
  Test "bool" (SrcString "if 13 = 37 and true then 13 else 37") (Eval [] (Value 37)),
  Test "bool2" (SrcString "if 13 = 37 or true then 13 else 37") (Eval [] (Value 13)),
  
  Test "const" (SrcString "2137") (Eval [] (Value 2137)),
  Test "nestedIf" (SrcString "if true then if true then 1 else 9 else 7") (Eval [] (Value 1)),
  Test "nestedLet" (SrcString "let x = 7 in let y = 9 in 1") (Eval [] (Value 1)),
  
  Test "numberAsBool" (SrcString "if 14 then 1997 else 88") TypeError,
  
  Test "numberAsBool2" (SrcString "if 8 and true then 3 else 4") TypeError,
  Test "numberAsBool3" (SrcString "if 7 or false then 3 else 4") TypeError,
  Test "boolAsNumber" (SrcString "true") TypeError

  , Test "zero"      (SrcString "0") (Eval [] (Value 0))
  , Test "input"      (SrcString "input x in x") (Eval [42] (Value 42))
  , Test "letTest"      (SrcString "input x in let y = x+5 in y * y") (Eval [10] (Value 225))
  , Test "lazyIf"    (SrcString "if false then 9 div 0 else 3") (Eval [] (Value 3))
  , Test "nestedIfs"    (SrcString "input x in if x<>2 then if x=3 then 3 else 99 else 2") 
        (Eval [5] (Value 99))
  , Test "nestedIfs2"    (SrcString "input x in if x<>2 then if x=3 then 3 else 99 else 2") 
        (Eval [2] (Value 2))
  , Test "nestedIfs3"    (SrcString "input x in if x<>2 then if x=3 then 3 else 99 else 2") 
        (Eval [3] (Value 3))
  , Test "nestedLet"      (SrcString "input x in let a=x in let b=x in x*x") 
        (Eval [10] (Value 100))
  , Test "unaryOp"      (SrcString "input x in -x") 
        (Eval [-99] (Value 99))
  , Test "abs"      (SrcString "input x in if not x<0 then x else -x") 
        (Eval [-10] (Value 10))

  , Test "badTypes1" (SrcString "input x in if 99 then x else 9")                TypeError
  , Test "badTypes2" (SrcString "input a b in 10 + false")                TypeError
  , Test "badTypes3" (SrcString "x")                TypeError

  , Test "RuntimeError1" (SrcString "5 div 0")  (Eval [] RuntimeError)
  , Test "RuntimeError2" (SrcString "input x y in x div y")  (Eval [1,0] RuntimeError)
  , Test "RuntimeError3" (SrcString "input x y in x mod y")  (Eval [1,0] RuntimeError)

  , Test "min2" (SrcString "input a b in if a<b then a else b") (Eval [1, 2] (Value 1))
  , Test "min2" (SrcString "input a b in if a<b then a else b") (Eval [3, 2] (Value 2))
  , Test "min3" (SrcString "input a b c in if a<b and a<c then a else if b<a and b<c then b else c") (Eval [1, 2, 3] (Value 1))
  , Test "min3" (SrcString "input a b c in if a<b and a<c then a else if b<a and b<c then b else c") (Eval [4, 2, 5] (Value 2))
  , Test "min3" (SrcString "input a b c in if a<b and a<c then a else if b<a and b<c then b else c") (Eval [3, 1, 2] (Value 1))

  , Test "1opEq1" (SrcString "if 2=3 then 1 else 0") (Eval [] (Value 0))
  , Test "1opEq2" (SrcString "if 2=2 then 1 else 0") (Eval [] (Value 1))
  , Test "1opInEq1" (SrcString "if 2<>3 then 1 else 0") (Eval [] (Value 1))
  , Test "1opInEq2" (SrcString "if 2<>2 then 1 else 0") (Eval [] (Value 0))
  , Test "1opLe1" (SrcString "if 2<3 then 1 else 0") (Eval [] (Value 1))
  , Test "1opLe2" (SrcString "if 2<2 then 1 else 0") (Eval [] (Value 0))
  , Test "1opGr1" (SrcString "if 2>2 then 1 else 0") (Eval [] (Value 0))
  , Test "1opGr2" (SrcString "if 3>2 then 1 else 0") (Eval [] (Value 1))
  , Test "1opLeEq1" (SrcString "if 2<=2 then 1 else 0") (Eval [] (Value 1))
  , Test "1opLeEq2" (SrcString "if 2<=3 then 1 else 0") (Eval [] (Value 1))
  , Test "1opLeEq3" (SrcString "if 3<=2 then 1 else 0") (Eval [] (Value 0))
  , Test "1opGrEq1" (SrcString "if 2>=2 then 1 else 0") (Eval [] (Value 1))
  , Test "1opGrEq2" (SrcString "if 2>=3 then 1 else 0") (Eval [] (Value 0))
  , Test "1opGrEq3" (SrcString "if 3>=2 then 1 else 0") (Eval [] (Value 1))

  , Test "opAdd" (SrcString "1 + 2") (Eval [] (Value 3))
  , Test "opSub" (SrcString "2 - 1") (Eval [] (Value 1))
  , Test "opMult" (SrcString "1 * 2") (Eval [] (Value 2))
  , Test "opDiv" (SrcString "4 div 2") (Eval [] (Value 2))
  , Test "opMod" (SrcString "4 mod 3") (Eval [] (Value 1))


------------------------  
  , Test "inc"          (SrcString "input x in x + 1") (Eval [42] (Value 43))
  , Test "undefVar"     (SrcString "x") TypeError

  --binary operators (valid)
  , Test "BAddTest"     (SrcString "input x in x + x") (Eval[12] (Value 24))
  , Test "BSubTest"     (SrcString "input x y in x - y") (Eval[2, 3] (Value (-1)))
  , Test "BMulTest"     (SrcString "input x y z in x * y * z") (Eval[2, -1, 3] (Value (-6)))
  , Test "BDivTest"     (SrcString "input x y in x div y") (Eval[5, 2] (Value 2))
  , Test "BDivTestNeg"  (SrcString "input x y in x div y") (Eval[-5, 2] (Value (-3)))
  , Test "BModTest"     (SrcString "input x y in x mod y") (Eval[5, 2] (Value 1))
  , Test "BModTestNeg"  (SrcString "input x y in x mod y") (Eval[-5, 2] (Value (1)))
  , Test "BAndTest1"    (SrcString "if true and true then 1 else 0") (Eval[] (Value 1))
  , Test "BAndTest2"    (SrcString "if true and false then 1 else 0") (Eval[] (Value 0))
  , Test "BOrTest1"     (SrcString "if true or false then 1 else 0") (Eval[] (Value 1))
  , Test "BOrTest2"     (SrcString "if false or false then 1 else 0") (Eval[] (Value 0))
  , Test "BOrAndTest1"  (SrcString "if false or true and true then 1 else 0") (Eval[] (Value 1))
  , Test "BOrAndTest2"  (SrcString "if false and true or true then 1 else 0") (Eval[] (Value 1))
  , Test "BOrAndTest3"  (SrcString "if false and true or false then 1 else 0") (Eval[] (Value 0))
  --binary operators (invalid)
  , Test "BAddIVTest"   (SrcString "input x in x + true") TypeError
  , Test "BDivIVTest"   (SrcString "input x in x div 0") (Eval[2] RuntimeError)
  , Test "BModIVTest"   (SrcString "input x in x mod true") TypeError
  --unary operators (valid)
  , Test "UNegTest"     (SrcString "input x in -x") (Eval[5] (Value (-5)))
  , Test "UNotTest1"    (SrcString "if not false then 1 else 0") (Eval[] (Value 1))
  , Test "UNotTest2"    (SrcString "if not true then 1 else 0") (Eval[] (Value 0))
  , Test "UNotTest3"    (SrcString "if not true or true then 1 else 0") (Eval[] (Value 1))
  --unary operators (invalid)
  , Test "UNegIVTest"   (SrcString "if - false then 1 else 0") TypeError
  , Test "UNotIVTest"   (SrcString "input x in not 5") TypeError
  --nonconnection binary operators (valid)
  , Test "BEqTest1"     (SrcString "input x y in if x = y then 1 else 0") (Eval[2, 2] (Value 1))
  , Test "BEqTest2"     (SrcString "input x y in if x = y then 1 else 0") (Eval[2, 1] (Value 0))
  , Test "BNEqTest1"    (SrcString "input x y in if x <> y then 1 else 0") (Eval[2, 2] (Value 0))
  , Test "BNEqTest2"    (SrcString "input x y in if x <> y then 1 else 0") (Eval[2, 1] (Value 1))
  , Test "BLessTest1"   (SrcString "input x y in if x < y then 1 else 0") (Eval[1, 2] (Value 1))
  , Test "BLessTest2"   (SrcString "input x y in if x < y then 1 else 0") (Eval[2, 1] (Value 0))
  , Test "BGrtTest1"    (SrcString "input x y in if x > y then 1 else 0") (Eval[1, 2] (Value 0))
  , Test "BGrtTest2"    (SrcString "input x y in if x > y then 1 else 0") (Eval[2, 1] (Value 1))
  , Test "BLessEqTest1" (SrcString "input x y in if x <= y then 1 else 0") (Eval[2, 2] (Value 1))
  , Test "BLessEqTest2" (SrcString "input x y in if x <= y then 1 else 0") (Eval[-1, 1] (Value 1))
  , Test "BLessEqTest3" (SrcString "input x y in if x <= y then 1 else 0") (Eval[1, -1] (Value 0))
  , Test "BGrtEqTest1"  (SrcString "input x y in if x >= y then 1 else 0") (Eval[2, 2] (Value 1))
  , Test "BGrtEqTest2"  (SrcString "input x y in if x >= y then 1 else 0") (Eval[-1, 1] (Value 0))
  , Test "BGrtEqTest3"  (SrcString "input x y in if x >= y then 1 else 0") (Eval[1, -1] (Value 1))
  --nonconnection binary operators (invalid)
  , Test "BEqIVTest"    (SrcString "input x in if x = true then 1 else 0") TypeError
  --other tests (valid)
  , Test "LetInTest1"   (SrcString "input x y z in let a = x * y in a * z") (Eval[2, -3, 1] (Value (-6)))
  , Test "LetInTest2"   (SrcString "input w x y z in let a = w * x in let b = a * y in b * z") (Eval[2, -3, 1, -2] (Value 12))
  , Test "IfElseIf1"    (SrcString "input x y z in if x < y then if x < z then x else z else if y < z then y else z") (Eval[1, 3, 2] (Value 1))
  , Test "IfElseIf2"    (SrcString "input x y z in if x < y then if x < z then x else z else if y < z then y else z") (Eval[3, 2, 1] (Value 1))
  --other tests(invalid)
  , Test "someTypeError1"   (SrcString "input x in if 5 then false else x") TypeError
  , Test "someTypeError2"   (SrcString "input x in x + y") TypeError

------------------------  
  , Test "singleVar"    (SrcString "input x in x") (Eval [5] (Value 5))
  , Test "constOnly"    (SrcString "10") (Eval [] (Value 10))
  , Test "constAndVar"  (SrcString "input x in 5") (Eval [0] (Value 5))

  , Test "typeError1"   (SrcString "input x in x + true") TypeError
  , Test "typeError2"   (SrcString "input x in if x then 1 else 0") TypeError
  , Test "typeError3"   (SrcString "if 5 and 6 then 1 else 2") TypeError
  , Test "typeError4"   (SrcString "if 5 or 6 then 1 else 2") TypeError
  , Test "typeError5"   (SrcString "if true + false then 1 else 2") TypeError
  , Test "typeError6"   (SrcString "if not 5 then 1 else 2") TypeError
  , Test "typeError7"   (SrcString "if -true then 1 else 2") TypeError
  , Test "typeError8"   (SrcString "input x in x + y") TypeError
  , Test "typeError9"   (SrcString "true") TypeError
  , Test "typeError10"  (SrcString "input x y in x < y") TypeError

  , Test "boolIfTrue"   (SrcString "if true then 1 else 0") (Eval [] (Value 1))
  , Test "boolIfFalse"  (SrcString "if false then 1 else 0") (Eval [] (Value 0))

  , Test "opNeg1"       (SrcString "input x in -x") (Eval [5] (Value (-5)))
  , Test "opNeg2"       (SrcString "input x in -x") (Eval [-5] (Value 5))

  , Test "opAdd1"       (SrcString "input x y in x + y") (Eval [-5, 5] (Value 0))
  , Test "opAdd2"       (SrcString "input x y in x + y") (Eval [2, 40] (Value 42))
  , Test "opSub1"       (SrcString "input x y in x - y") (Eval [-5, -5] (Value 0))
  , Test "opSub2"       (SrcString "input x y in x - y") (Eval [-1, -2] (Value 1))
  , Test "opMul1"       (SrcString "input x y in x * y") (Eval [0, 42] (Value 0))
  , Test "opMul2"       (SrcString "input x y in x * y") (Eval [123, 987] (Value 121401))
  , Test "opMul3"       (SrcString "input x y in x * y") (Eval [-2, -3] (Value 6))
  , Test "opDiv1"       (SrcString "input x y in x div y") (Eval [36, 9] (Value 4))
  , Test "opDiv2"       (SrcString "input x y in x div y") (Eval [38, 9] (Value 4))
  , Test "opDiv3"       (SrcString "input x y in x div y") (Eval [36, 0] RuntimeError)

  , Test "2opEq1"        (SrcString "if 5 = 5 then 1 else 0") (Eval [] (Value 1))
  , Test "2opEq2"        (SrcString "if 5 = 0 then 1 else 0") (Eval [] (Value 0))
  , Test "2opNeq1"       (SrcString "if 5 <> 5 then 1 else 0") (Eval [] (Value 0))
  , Test "2opNeq2"       (SrcString "if 5 <> 0 then 1 else 0") (Eval [] (Value 1))  
  , Test "2opLE1"        (SrcString "if 5 <= 5 then 1 else 0") (Eval [] (Value 1))
  , Test "2opLE2"        (SrcString "if 5 <= 0 then 1 else 0") (Eval [] (Value 0))
  , Test "2opGE1"        (SrcString "if 5 >= 5 then 1 else 0") (Eval [] (Value 1))
  , Test "2opGE2"        (SrcString "if 5 >= 0 then 1 else 0") (Eval [] (Value 1))
  , Test "2opL1"         (SrcString "if 5 < 5 then 1 else 0") (Eval [] (Value 0))
  , Test "2opL2"         (SrcString "if 5 < 0 then 1 else 0") (Eval [] (Value 0))
  , Test "2opG1"         (SrcString "if 5 > 5 then 1 else 0") (Eval [] (Value 0))
  , Test "2opG2"         (SrcString "if 5 > 0 then 1 else 0") (Eval [] (Value 1))

  , Test "opNot1"       (SrcString "if not true then 1 else 0") (Eval [] (Value 0))
  , Test "opNot2"       (SrcString "if not false then 1 else 0") (Eval [] (Value 1))

  , Test "opAnd1"       (SrcString "if true and true then 1 else 0") (Eval [] (Value 1))
  , Test "opAnd2"       (SrcString "if true and false then 1 else 0") (Eval [] (Value 0))
  , Test "opAnd3"       (SrcString "if false and true then 1 else 0") (Eval [] (Value 0))
  , Test "opAnd4"       (SrcString "if false and false then 1 else 0") (Eval [] (Value 0))

  , Test "opOr1"        (SrcString "if true or true then 1 else 0") (Eval [] (Value 1))
  , Test "opOr2"        (SrcString "if true or false then 1 else 0") (Eval [] (Value 1))
  , Test "opOr2"        (SrcString "if false or true then 1 else 0") (Eval [] (Value 1))
  , Test "opOr2"        (SrcString "if false or false then 1 else 0") (Eval [] (Value 0))

  , Test "opMod1"       (SrcString "input x y in x mod y") (Eval [5, 4] (Value 1))
  , Test "opMod2"       (SrcString "input x y in x mod y") (Eval [5, 1] (Value 0))

  , Test "ifInIf1"      (SrcString "input x in if x > 5 then if x > 10 then x else x + 5 else if x > 0 then x + 10 else x + 15") (Eval [0] (Value 15))
  , Test "ifInIf2"      (SrcString "input x in if x > 5 then if x > 10 then x else x + 5 else if x > 0 then x + 10 else x + 15") (Eval [5] (Value 15))
  , Test "ifInIf3"      (SrcString "input x in if x > 5 then if x > 10 then x else x + 5 else if x > 0 then x + 10 else x + 15") (Eval [10] (Value 15))
  , Test "ifInIf4"      (SrcString "input x in if x > 5 then if x > 10 then x else x + 5 else if x > 0 then x + 10 else x + 15") (Eval [15] (Value 15))
  , Test "ifNotWhoops"  (SrcString "input x in if x > 5 then x else x div 0") (Eval [10] (Value 10))
  , Test "ifWhoops"     (SrcString "input x in if x > 5 then x else x div 0") (Eval [5] RuntimeError)

  , Test "letTest1"     (SrcString "let x = 1 in x + 1") (Eval [] (Value 2))
  , Test "letTest2"     (SrcString "input x in let x = 5 in x + 1") (Eval [1] (Value 6))
  , Test "letTest3"     (SrcString "input x in let y = 1 in x + 2*y") (Eval [1] (Value 3))
  , Test "letTest4"     (SrcString "input x in let x = x in x") (Eval [5] (Value 5))

  , Test "letInLet1"    (SrcString "let x = 1 in let y = 2 in x + y") (Eval [] (Value 3))
  , Test "letInLet2"    (SrcString "let x = 1 in let y = 2 in let z = 3 in x + y + z") (Eval [] (Value 6))
  

------------------------  
  , Test "addBool"    (SrcString "5 + false")        TypeError
  , Test "mulBool"    (SrcString "let x = false in x * 3")  TypeError
  , Test "uMinusBool"    (SrcString "- true")       TypeError
  , Test "eqBool"    (SrcString "false = true")       TypeError
  , Test "eqBool2"    (SrcString "3 = false")           TypeError
  , Test "notInt"    (SrcString "input x in not x") TypeError
  , Test "andInt"    (SrcString "3 and true")       TypeError
  , Test "orInt"    (SrcString "let x = 42 in false or x")    TypeError
  , Test "undefVar2"    (SrcString "let x = 3 in x + y")    TypeError
  , Test "doubleletx"    (SrcString "let x = 1 in let x = 2 in x + x") (Eval [] (Value 4))
  , Test "doubleletx2"    (SrcString "let x = 1 in (let x = 2 in x) + x") (Eval [] (Value 3))
  , Test "badbranch"    (SrcString "if true then false else 42")    TypeError
  , Test "badbranch2"    (SrcString "if true then 42 else false")    TypeError
  , Test "badbranch3"    (SrcString "if 5 < 3 then x else 42")    TypeError
  , Test "div0_1"    (SrcString "5 div 0")           (Eval [] RuntimeError)
  , Test "div0_2"    (SrcString "input x in let y = (true or x = (42 div 0)) in x")    (Eval [42] RuntimeError)
  , Test "div0_3"    (SrcString "input x in 3 div x")    (Eval [0] RuntimeError)
  , Test "div0_4"    (SrcString "let x = 0 in 3 div x")    (Eval [] RuntimeError)
  , Test "div0_5"    (SrcString "if true then 42 else 42 div 0")    (Eval [] (Value 42))
  , Test "mod0_1"    (SrcString "5 mod 0")           (Eval [] RuntimeError)
  , Test "mod0_2"    (SrcString "input x in let y = (true or x = (42 mod 0)) in x")    (Eval [42] RuntimeError)
  , Test "mod0_3"    (SrcString "input x in 3 mod x")    (Eval [0] RuntimeError)
  , Test "mod0_4"    (SrcString "let x = 0 in 3 mod x")    (Eval [] RuntimeError)
  , Test "mod0_5"    (SrcString "if true then 42 else 42 mod 0")    (Eval [] (Value 42))
  , Test "add1"        (SrcString "2 + 2")               (Eval [] (Value 4))
  , Test "add2"        (SrcString "input x in 5 + x") (Eval [37] (Value 42))
  , Test "add3"        (SrcString "let x = 3 in x + 39")    (Eval [] (Value 42))
  , Test "add4"        (SrcString "-323 + 3")           (Eval [] (Value (-320)))
  , Test "sub1"        (SrcString "2 - 2")               (Eval [] (Value 0))
  , Test "sub2"        (SrcString "input x in 5 - x") (Eval [3] (Value 2))
  , Test "sub3"        (SrcString "let x = 3 in x - 39")    (Eval [] (Value (-36)))
  , Test "sub4"        (SrcString "-323 - 3")           (Eval [] (Value (-326)))
  , Test "mul1"        (SrcString "2 * 2")               (Eval [] (Value 4))
  , Test "mul2"        (SrcString "input x in 5 * x") (Eval [37] (Value 185))
  , Test "mul3"        (SrcString "let x = 3 in x * 39")    (Eval [] (Value 117))
  , Test "mul4"        (SrcString "-33 * 3")           (Eval [] (Value (-99)))
  , Test "div1"        (SrcString "2 div 2")           (Eval [] (Value 1))
  , Test "div2"        (SrcString "input x in 5 div x") (Eval [2] (Value 2))
  , Test "div3"        (SrcString "let x = 39 in x div 3")    (Eval [] (Value 13))
  , Test "div4"        (SrcString "-323 div 3")       (Eval [] (Value (-108)))
  , Test "mod1"        (SrcString "2 mod 2")               (Eval [] (Value 0))
  , Test "mod2"        (SrcString "input x in 37 mod x") (Eval [5] (Value 2))
  , Test "mod3"        (SrcString "let x = 3 in x mod 39")    (Eval [] (Value 3))
  , Test "mod4"        (SrcString "-323 mod 3")       (Eval [] (Value 1))
  , Test "prog1_0"    (SrcFile "p1.pp4")               (Eval [3, 3] (Value 0))
  , Test "prog1_1"    (SrcFile "p1.pp4")               (Eval [43, 3] (Value 0))
  , Test "prog1_2"    (SrcFile "p1.pp4")               (Eval [13, 3] RuntimeError)
  , Test "prog2_0"    (SrcFile "p2.pp4")               (Eval [3, 9, 27] RuntimeError)
  , Test "prog2_1"    (SrcFile "p2.pp4")               (Eval [3, 3, 27] (Value 42))
  , Test "prog3_0"    (SrcFile "p3.pp4")               (Eval [] (Value 23))
  , Test "prog4_0"    (SrcFile "p4.pp4")               (Eval [1, 2, 3, 4, 5, 6, 8] (Value 23))
  , Test "prog4_1"    (SrcFile "p4.pp4")               (Eval [1, 3, 2, 42, 15, 36, 8] (Value 152))
  , Test "prog4_2"    (SrcFile "p4.pp4")               (Eval [-1, -2, -3, -4, -5, -6, -8] (Value (-16)))
  , Test "prog4_3"    (SrcFile "p4.pp4")               (Eval [0, 0, 0, 0, 0, 0, 0] RuntimeError)
  , Test "prog4_4"    (SrcFile "p4.pp4")               (Eval [1453, 21234, 323, 4234, 5155, 61341, 8856] (Value 30931384))
  , Test "prog4_5"    (SrcFile "p4.pp4")               (Eval [-1432, -243, -54323, -4324, -553, -536, -708] (Value 339833))
  , Test "prog4_6"    (SrcFile "p4.pp4")               (Eval [1324, 0, -3645, 0, 5234, -634, 0] RuntimeError)
  , Test "prog4_7"    (SrcFile "p4.pp4")               (Eval [0, 245387, 342, -4, 0, 6, -8] RuntimeError)
  , Test "prog4_8"    (SrcFile "p4.pp4")               (Eval [1, 122, 3, 443, 5, 0, 834] RuntimeError)
  , Test "prog4_9"    (SrcFile "p4.pp4")               (Eval [-14, 2, -3, 4, 5342, 6, 0] (Value 10653))
  , Test "prog5_0"    (SrcFile "p5.pp4")               (Eval [12, 2] (Value 42))
  , Test "prog5_1"    (SrcFile "p5.pp4")               (Eval [2, 2] RuntimeError)
  , Test "prog6_0"    (SrcFile "p6.pp4")               (Eval [2] (Value 65536))
  , Test "prog6_1"    (SrcFile "p6.pp4")               (Eval [-10] (Value 10000000000000000))
  , Test "prog7_0"    (SrcFile "p7.pp4")               (Eval [1,2,3,4,5,6,7,8] (Value 8))
  , Test "prog7_1"    (SrcFile "p7.pp4")               (Eval [2,1,643,2,4,6,90,-1] (Value 643))
  , Test "prog7_2"    (SrcFile "p7.pp4")               (Eval [0,0,0,0,0,0,0,1] (Value 1))
  , Test "prog7_3"    (SrcFile "p7.pp4")               (Eval [2,4,2,6,3,1,6,3] (Value 6))
  ,

------------------------  
  Test "I'm Still Standing"     (SrcString "input x in x + (let a = false in a)") TypeError,
  Test "Nikita" (SrcString "x")         TypeError,       
  Test "Your Song"(SrcString "input x y in (x or y) and false")          TypeError,
  Test "Rocket Man" (SrcString "input x in if x > 5 then true else 5")   TypeError,
  Test "Crocodile Rock" (SrcString "input x in if x > a then true else 5")  TypeError,
  Test "Daniel" (SrcString "false") TypeError,
  Test "Goodbye Yellow Brick Road" (SrcString "input a b in if a <> b then let a = 4 + 1  in a + 2 else let b = false in b or (a < 2) " ) TypeError,
  Test "Don't Let The Sun Go Down On Me" (SrcString "let the_sun = 5 in let b = the_sun > 2 in the_sun mod b" ) TypeError,
  Test "Sorry Seems To Be The Hardest Word" (SrcString "let a = 5 in let b = a > 2 in a and b" ) TypeError,
  Test "The Last Song"  (SrcString "if The then Last else Song " ) TypeError,
  Test "Sacrifice"  (SrcString "5 + 5 or 2 > 3 and false " ) TypeError,
  Test "Circle Of Life" (SrcString "5 + 2 * (42 - (12 mod (23 div a)) )" ) TypeError,
  Test "Candle In the Wind" (SrcString "5 + 2 * (42 - (12 mod (23 div false)) )" ) TypeError,
  Test "Can You Feel The Love Tonight?" (SrcString "let e = false in let j = true in e and (j or (a and (e or (false and 1)))) " ) TypeError,
  
  
  
  Test "Tubular Bells" (SrcString "input x in let y = 3 in if x * 2 >= 100 and x * y <= 150 then 4 else 5 * y") (Eval [50] (Value 4)),
  Test "Tubular Bells II" (SrcString "input x in let y = 3 in if x * 2 >= 100 and x * y <= 150 then 4 else 5 * y") (Eval [44] (Value 15)),
  Test "Tubular Bells III" (SrcString "let y = 3 in y * y div y div y") (Eval [] (Value 1)),
  Test "Voyager" (SrcString "input x in x + 1") (Eval [42] (Value 43)),
  Test "QE2" (SrcString "input x in if x >= 0 then x else -x") (Eval [-5] (Value 5)),
  Test "Five Miles Out" (SrcString "input x in if x >= 0 then x else -x") (Eval [42] (Value 42)),
  Test "Crises" (SrcString "input x in if x >= 0 then x else -x") (Eval [0] (Value 0)),
  Test "Ommadawn" (SrcString "input x in if x mod 2 = 0 then  x * x - 3 * x + 7 else x mod 17 + 3") (Eval [1975] (Value 6)),
  Test "Return to Ommadawn" (SrcString "input x in if x mod 2 <> 0 then  x * x - 3 * x + 7 else x mod 17 + 3") (Eval [2017] (Value 4062245)),
  Test "The Songs Of Distant Earth" (SrcString "input x in if x mod 2 = 0 then x mod 50 else x div 0") (Eval [1994] (Value 44)),
  Test "Guitars" (SrcString "input x in if x mod 2 = 0 then x mod 50 else x div 0") (Eval [1999] RuntimeError),
  Test "Man On The Rocks" (SrcString "input x  y z in let a = 2 in let b = 3 in let c = 4 in let p = true in if p then x + y + z - a + b * c else -12") (Eval [2014, 3, 3] (Value 2030)),
  Test "Tubular Bells 2003"  (SrcString "if 2003 > 42 and 2003 < 4540 then 53 else 8 mod 0") (Eval [] (Value 53)),
  Test "Heaven's Open"  (SrcString "input x in let x = 44 in let x = 2 in let x = 32 in x") (Eval [22] (Value 32))
  
  ,Test "cantReturnBool1" (SrcString "5 <= 0 and 3") TypeError
  , Test "cantReturnBool2" (SrcString "10 <> 11 and not true") TypeError
  , Test "mathExp1" (SrcString "input x in 2 + 3 * 4 div x") (Eval [4] (Value 5)) -- zmieniłem z "input 2 + 3 * 4 div x"
  , Test "mathExp2" (SrcString "input x in (-x) mod 2 ") (Eval [6] (Value 0)) -- pododawałem ci "x y" zeby było  "input x y in.." wszędzie "
  , Test "mathExp3" (SrcString "input x in 4-(-x)") (Eval [4] (Value 8)) -- wrong answer
  , Test "ifExp1" (SrcString "input x y in if x <> y then y else x") (Eval [4,60] (Value 60))
  , Test "ifExp2" (SrcString "input x y in if not 2<1 then x*y else x div y") (Eval [100,10] (Value 1000) ) -- tu zapomniałeś nawias. I nie ma operatora /, a jest div
 -- , Test "ifExp3" (SrcString "input x y in if x*x = x + x and x > y then x+y else y^2") (Eval [2,1] (Value 3)) -- nie ma ^
  , Test "nestedExp" (SrcString "let x = 5 in let y = x + 2 in if x = 5 and y > x then x + y else y") (Eval [] (Value 12))
  , Test "nestedExpError" (SrcString "let x = true in let y = 5 + 2 in if not x then y else x") TypeError
  , Test "trickyExp" (SrcString "let x = 10 in if true then x else x div 0") (Eval [] (Value 10))
  , Test "notTrickyError" (SrcString "let x = 10 in if false then x else x div 0") (Eval [] RuntimeError)




  ,Test "inc"      (SrcString "input x in x + 1") (Eval [42] (Value 43))
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



  ,Test "minus one" (SrcString "input x in x - 1") (Eval [0] (Value (-1)))
  ,Test "second one" (SrcString "input x itsover in if -(3 > x) then 7 else itsover") TypeError
  ,Test "no arguments" (SrcString "if false then 1 div 0 else 777") (Eval [] (Value 777))
  ,Test "anything" (SrcString "input x in x * x + x div x - x") (Eval [2] (Value 3))
  ,Test "just numbers" (SrcString "1 + 2 - 3 * 4 div 5") (Eval [] (Value 1))
  ,Test "with undefined variable" (SrcString "input a b in a + b - c") TypeError
  ,Test "not used variables" (SrcString "input a b c d e f g in if if false then true else true then 123 else 321") (Eval [] (Value 123))
  ,Test "let" (SrcString "input c in let v = 3*c in 2+v") (Eval [9] (Value 29))
  ,Test "large sum" (SrcString "input q w e r t y u i o p a s d f g h j k l c n z in q + w + d + h + k + c + n + z") (Eval [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] (Value 8))
  ,Test "zero" (SrcString "input x in 0 * x * x * x + x - x") (Eval [347] (Value 0))
  ,Test "undefined variable" (SrcString "variable") TypeError
  ,Test "a number" (SrcString "3") (Eval [] (Value 3))
    ,Test "Runtime Error" (SrcString "input x y in let n = x*y in (if n > 33 then x-y else x+y) div (let i = 0 in i)") (Eval [9,23] RuntimeError)
  ,Test "let bool" (SrcString "input x y in let x = (y > 2) in if x then y*5 else 0") (Eval [5,3] (Value 15))
  ,Test "minus without ()'s" (SrcString "123 + -42 + -76") (Eval [] (Value 5))
  ,Test "a lot of minuses" (SrcString "- - - - - - - - - - 1234") (Eval [] (Value 1234))
  ,Test "number as condition" (SrcString "if 777 then 0 else 0") TypeError
  ,Test "nots" (SrcString "if not not not not true then 1234 else 4321") (Eval [] (Value 1234))
  ,Test "1 + true" (SrcString "1 + true") TypeError
  ,Test "dividing by zero" (SrcString "6 div 0") (Eval [] RuntimeError)
    ,Test "Poland is the best" (SrcString "input Poland is the best in 42") (Eval [42,42,42,42] (Value 42))
  ,Test "let in let" (SrcString "let x = 10 in let y = 20 in if x > y then x else y") (Eval [] (Value 20))
  ,Test "bool return" (SrcString "2 = 3 and true or false") TypeError
  ,Test "if with different types" (SrcString "if 2<>3 then 42 else true and 4=5") TypeError
  ,Test "nested ifs" (SrcString "if if if if if if if if 7=7 then true else false then true else false then true else false then true else false then true else false then true else false then true else false then 1 else 0") (Eval [] (Value 1))
  ,Test "the last one" (SrcString "input love be with you in let love = 63 in love + be + with + you") (Eval [5,5,5,5] (Value 78))
 


  ,Test "inc"      (SrcString "input x in x + 1") (Eval [42] (Value 43))
  , Test "undefVar" (SrcString "x")                TypeError
  , Test "lazyIf_with_vars"   (SrcString "input x in if true then x + 5 else 5 div 0") (Eval [5] (Value 10))
  , Test "lazyIf"   (SrcString "if true then 1 else 1 div 0") (Eval [] (Value 1))
  , Test "lazyIf_with_false" (SrcString "if false then 5 div 0 else 1") (Eval [] (Value 1))
  , Test "let_test" (SrcString "input x in let t = 5 in t*t + x") (Eval [17] (Value 42))
  , Test "tricky_arithmetic" (SrcString "10 + -7") (Eval [] (Value 3))
  , Test "lots_of_minuses" (SrcString "10 - - - - 7") (Eval [] (Value 17))
  , Test "proper_or" (SrcString "input a in if a > 0 or a < 0 then 14*3 else 42 div 7") (Eval [-10] (Value 42))
  , Test "proper_and" (SrcString "input a b in if a < 0 and b >= 0 then 2*2 else 5 + 5") (Eval [1, 1] (Value 10))
  , Test "minus_bool" (SrcString "input a in if - true then 1 else 0") TypeError
  , Test "plus_associativity" (SrcString "input a b in 5 + b + a + 2 + 1") (Eval [3,4] (Value 15))
  , Test "or_associativity" (SrcString "if false or false or false or true then 1 else 0") (Eval [] (Value 1))
  , Test "variable_used_more_than_once" (SrcString "input a b in if a > 0 then a*b + a*5 + a else b*a + b*5 + b") (Eval [1,1000] (Value 1006))
  , Test "unused_variable" (SrcString "input a b in a*2") (Eval [5,2031] (Value 10)) 
  , Test "basic_arithmetic" (SrcString "100*2 + 10*5 + 6") (Eval [] (Value 256))
  , Test "arithmetic_with_bool_unary" (SrcString "not 100*2 + 3") TypeError
  , Test "arithmetic_with_bool_binary" (SrcString "(200*3 or 3) and 5") TypeError
  , Test "more_variables" (SrcString "input x y z in x + y + z") (Eval [1,2,3] (Value 6))
  , Test "variables_with_undefined" (SrcString "input x y in x*y + z") TypeError
  , Test "proper_order_of_let" (SrcString "let x = 5 in let x = x + 10 in x") (Eval [] (Value 15))
  , Test "is_number_true" (SrcString "if 5 then 5 else 5") TypeError
  , Test "normal_if" (SrcString "input var in if var > 1 then 10 else 5 + var") (Eval [0] (Value 5))
  , Test "trivial_associativity" (SrcString "input x in x + x * x") (Eval [2] (Value 6))
  , Test "number_as_bool" (SrcString "input a in if a or true then a else a + 1") TypeError
  , Test "negation" (SrcString "input x in if not false then 5 + x else 5 - x") (Eval [1] (Value 6))
  , Test "double_negation" (SrcString "input x in if not not false then 5 + x else 5 - x") (Eval [1] (Value 4))
  , Test "simple_arithmetic_with_parentheses" (SrcString "(2 + 3 + 4)*5 + 1") (Eval [] (Value 46))
  , Test "equality_operators_with_bool" (SrcString "if true <> false then 1 else 0") TypeError
  , Test "other_let" (SrcString "input x in let x = 2*x in 6 + x") (Eval [4] (Value 14))
  , Test "nested_let" (SrcString "let x = 2 in let x = 2*x in let x = x + 5 in let x = 3*x in x + 1") (Eval [] (Value 28))
  , Test "prac1" (SrcString "let x = 3 div 0 in 3") (Eval [] RuntimeError)
  , Test "lazyIf_dependent_from_var" (SrcString "input x in if x >= 0 then x else x div 0") (Eval [42] (Value 42))
  , Test "bool_variable" (SrcString "let y = false in if y then 2 else 3") (Eval [] (Value 3))
  , Test "changing_type" (SrcString "let x = true in let x = 3 in x") (Eval [] (Value 3))
  , Test "changing_type2" (SrcString "let x = 3 in let x = false in let x = true in if x then 1 else 1 div 0") (Eval [] (Value 1))
  ,
  Test "singleVar" (SrcString "input x in x") (Eval [69] (Value 69)),
  Test "not" (SrcString "if not true then 2 else 1") (Eval [] (Value 1)),
  Test "not2" (SrcString "if not false then 2 else 1") (Eval [] (Value 2)),
  Test "neg" (SrcString "-3") (Eval [] (Value (-3))),
  Test "and" (SrcString "if true and true then 3 else 7") (Eval [] (Value 3)),
  Test "and2" (SrcString "if true and false then 3 else 7") (Eval [] (Value 7)),
  Test "and3" (SrcString "if false and true then 3 else 7") (Eval [] (Value 7)),
  Test "and4" (SrcString "if false and false then 3 else 7") (Eval [] (Value 7)),
  Test "or" (SrcString "if true or true then 3 else 7") (Eval [] (Value 3)),
  Test "or2" (SrcString "if true or false then 3 else 7") (Eval [] (Value 3)),
  Test "or3" (SrcString "if false or true then 3 else 7") (Eval [] (Value 3)),
  Test "or4" (SrcString "if false or false then 3 else 7") (Eval [] (Value 7)),
  Test "eq" (SrcString "if 1 = 1 then 1 else 4") (Eval [] (Value 1)),
  Test "eq2" (SrcString "if 1 = 4 then 1 else 4") (Eval [] (Value 4)),
  Test "nEq" (SrcString "if 1 <> 1 then 1 else 4") (Eval [] (Value 4)),
  Test "nEq2" (SrcString "if 1 <> 4 then 1 else 4") (Eval [] (Value 1)),
  Test "LT" (SrcString "if 1 < 4 then 1 else 4") (Eval [] (Value 1)),
  Test "LT2" (SrcString "if 1 < 1 then 1 else 4") (Eval [] (Value 4)),
  Test "GT" (SrcString "if 1 > 4 then 1 else 4") (Eval [] (Value 4)),
  Test "GT2" (SrcString "if 1 > 1 then 1 else 4") (Eval [] (Value 4)),
  Test "LE" (SrcString "if 1 <= 4 then 1 else 4") (Eval [] (Value 1)),
  Test "LE2" (SrcString "if 1 <= 1 then 1 else 4") (Eval [] (Value 1)),
  Test "LE3" (SrcString "if 1 <= -1 then 1 else 4") (Eval [] (Value 4)),
  Test "GE" (SrcString "if 1 >= 4 then 1 else 4") (Eval [] (Value 4)),
  Test "GE2" (SrcString "if 1 >= 1 then 1 else 4") (Eval [] (Value 1)),
  Test "GE3" (SrcString "if 1 >= -1 then 1 else 4") (Eval [] (Value 1)),
  Test "add" (SrcString "8 + 8") (Eval [] (Value 16)),
  Test "sub" (SrcString "8 - 8") (Eval [] (Value 0)),
  Test "mul" (SrcString "8 * 8") (Eval [] (Value 64)),
  Test "div" (SrcString "8 div 8") (Eval [] (Value 1)),
  Test "mod" (SrcString "37 mod 21") (Eval [] (Value 16)),
  Test "let" (SrcString "let x = 21 in x + 14") (Eval [] (Value 35)),
  
  Test "muchInput" (SrcString "input q w e r t y u i o p a s d f g h j k l z x c v b n m in h + a + s + k + e + l + l") (Eval [1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7] (Value 38)),
  
  Test "tricky" (SrcString "if true then 21 else 37 div 0") (Eval [] (Value 21)),
  Test "tricky2" (SrcString "69 + -69") (Eval [] (Value 0)),
  Test "tricky3" (SrcString "- -1337") (Eval [] (Value 1337)),
  Test "tricky4" (SrcString "- - -1337") (Eval [] (Value (-1337))),
  Test "bool" (SrcString "if 13 = 37 and true then 13 else 37") (Eval [] (Value 37)),
  Test "bool2" (SrcString "if 13 = 37 or true then 13 else 37") (Eval [] (Value 13)),
  
  Test "numberAsBool" (SrcString "if 14 then 1997 else 88") TypeError,
  Test "wrongLet" (SrcString "let x = 89 in 23") (Eval [] (Value 23)),
  
  Test "numberAsBool2" (SrcString "if 8 and true then 3 else 4") TypeError,
  Test "numberAsBool3" (SrcString "if 7 or false then 3 else 4") TypeError,
  Test "boolAsNumber" (SrcString "true") TypeError
  , Test "op"       (SrcString "input x x1 in x * 5 - x1 div 2") (Eval [9,16] (Value 37))
  , Test "op_Er"     (SrcString "input x in x div 0") (Eval [42] RuntimeError)
  , Test "if"       (SrcString "input x x1 in if x = 3 then 4 else x1") (Eval [3,5] (Value 4))
 
  , Test "if_Er"     (SrcString "input x in if 13 then true else x * 150") TypeError
  , Test "if_Div"    (SrcString "input x x1 in if x + 88 = 42 then 42 div 0 else x1") (Eval [12, 162] (Value 162))
  , Test "let"      (SrcString "input x x1 x2 in let  x = x1 * 3 in x2") (Eval [3,1,5] (Value 5))
  , Test "div"      (SrcString "input x in if x div 2 = 4 then x else 0") (Eval [8] (Value 8))
  , Test "double_If" (SrcString "input x in if if x = 42 then true else false then 42 else x") (Eval [42] (Value 42))
 
  , Test "triple_If" (SrcString "input x in if if x = 42 then true else false then if true then 42 else 42 + x else x") (Eval [42] (Value 42))
  , Test "let_Er"      (SrcString "input x x1 in let x = x1 * 3 in x2") TypeError
  , Test "mult_Add"      (SrcString "input x x1 x2 x3 x4 x5 in x + x1 + x2 + x3 + x4 + x5") (Eval [1,2,3,4,5,6] (Value 21))
  , Test "mult_Sub"      (SrcString "input x x1 x2 x3 x4 x5 in x - x1 - x2 - x3 - x4 - x5") (Eval [42,1,5,4,10,2] (Value 20))
  , Test "Add_Sub_Er"      (SrcString "input x x1 x2 x3 x4 x5 in x - x1 + x2 + x3 - x4 - x5") (Eval [0,0,0,0,0,0] (Value 0))
 
  , Test "bool_Er"      (SrcString "input x in if true then true else x") TypeError
  , Test "bool"      (SrcString "input x in if true then x else false") TypeError
  , Test "mod_Er"      (SrcString "input x in x mod 0") (Eval [1] RuntimeError)
  , Test "no_eval"      (SrcString "42 + 0") (Eval [] (Value 42))

  , Test "simplifyOperators" (SrcString " input x in x + 10 - - -  1") (Eval [1] (Value 10))
  , Test "ifStatement"       (SrcString "input x y in if x >= 1 then 144 else y * 5") (Eval [2, 3] (Value 144))
  , Test "negationSimplifiedToTrue" (SrcString "input x in if not not true then x * 1 else x div 1") (Eval [1] (Value 1))
  , Test "simpleInputIn"       (SrcString "input x y in x * 1 - y div 4") (Eval [4,12] (Value 1))
  , Test "errorWithBoolInIf"     (SrcString "input x in if 11 then x * 22 else x * 33") TypeError
  , Test "evaluateBoolExpression" (SrcString "if true or false or false or true then 1 else 0") (Eval [] (Value 1))
  , Test "checkBoolInIf"      (SrcString "input x in if x div 2 >= 1 then x div 3 else x * 3") (Eval [24] (Value 8))
  , Test "undefinedVariables"      (SrcString "input x y in x*y + z") TypeError
  , Test "notValidReturnThen"      (SrcString "input x in if true then true else x * 2") TypeError
  , Test "properIfLazy" (SrcString "input x in if x >= 0 then x else x div 0") (Eval [1] (Value 1))
  , Test "quiteHardIfExpr" (SrcString "input a b c in if a < 0 and b < 0 then c else a + b") (Eval [-1, -1, 1] (Value 1))
  , Test "multipleSums"      (SrcString "input x y z a b in x + y + z + a + b") (Eval [1,11,11,11,11] (Value 45))
  , Test "thereIsUnusedVar" (SrcString "input x y in x*2") (Eval [1,2] (Value 2))
  , Test "scriptInterpretLanguage" (SrcString "1 + 10 + 100") (Eval [] (Value 111))
  , Test "orAppliedToNumberAndBool" (SrcString "input a in if a or true then a else a") TypeError 
  , Test "multipleSubstractions"      (SrcString "input a b c d in a - b - c - d") (Eval [3,1,1,1] (Value 0))
  , Test "errorWithBoolInIf" (SrcString "if 1 then 2 else 3") TypeError
  , Test "priorityOperators"      (SrcString "input a b c in a * b - c") (Eval [2,2,3] (Value 1))
  , Test "binaryWithUnaryOperator" (SrcString "10 + -7") (Eval [] (Value 3))       
  , Test "alwaysReturnInput"      (SrcString "input x in if true then x else x mod 2") (Eval [1] (Value 1))
  , Test "usingUndefinedVariable" (SrcString "input x y in x + y + z") TypeError
  , Test "mixedBoolAndIntegerOperator" (SrcString "input a in if - true then 1 else 0") TypeError
  , Test "meine" (SrcString "let x = true in if not x then 2 else 3") (Eval [] (Value 3))
  , Test "nestedIfElse" (SrcString "input x in if if x >= 1 then true else false then if true then x * 3 else 42 + x else x") (Eval [1] (Value 3))
  , Test "letStatementNested" (SrcString "let x = 1 in let x = 2*x in let x = x + 5 in let x = 3*x in x + -1") (Eval [] (Value 20))
  , Test "negationIf" (SrcString "input x in if not false then x else -x") (Eval [1] (Value 1))
  , Test "cokolwiek" (SrcString "if not (if false then false else true) then 1 else 2") (Eval [] (Value 2))

  , Test "val_inc"              (SrcString "input y in y")                                                  (Eval [5] (Value 5))
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
  , Test "type_if"              (SrcString "if 2 + 2 then 3 else 6")               TypeError
  , Test "type_if2"             (SrcString "if true or 2 + 2 then 3 else 6")       TypeError
  , Test "type_ifNeg"           (SrcString "input x in if not x then 1 else 2")    TypeError
  , Test "type_add"             (SrcString "input x in x + true")                  TypeError
  , Test "inc"      (SrcString "input x in x + 1") (Eval [42] (Value 43))
  , Test "undefVar" (SrcString "x")                TypeError
  , Test "smplTest1" (SrcString "2")               (Eval [] (Value 2))
  , Test "smplTest2" (SrcString "-2 + 2")          (Eval [] (Value 0))
  , Test "smplTest3" (SrcString "-2 div 0")          (Eval [] RuntimeError)
  , Test "smplTest4" (SrcString "1 - 2 + 3")       (Eval [] (Value 2))
  , Test "smplTest5" (SrcString "1 div 2")         (Eval [] (Value 0))
  , Test "smplTest6" (SrcString "14 mod 10")       (Eval [] (Value 4))
  , Test "smplTest7" (SrcString "11 mod 10 * 10")  (Eval [] (Value 10))
  , Test "smplTypeTest8" (SrcString "2 + true")        TypeError
  , Test "smplTypeTest9" (SrcString "input x in if 5 then false else x")
                                                   TypeError
  , Test "smplTypeTest10" (SrcString "input x in x + y")
                                                   TypeError

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

  , Test "smplTest16" (SrcString "42 mod 0")       (Eval [] RuntimeError)

  , Test "override"
             (SrcString "input x in let x = x + 1 in let x = x + 2 in x")
                                                   (Eval [39] (Value 42))

  , Test "smplTest18" (SrcString
                "if 4 > 2 then if true or false then 2 else 0 else 1")
                                                   (Eval [] (Value 2))

  , Test "smplTest19" (SrcString "if true and false then 0 else 1")
                                                   (Eval [] (Value 1))

  , Test "smplTest20"
                (SrcString "if 2 <> 1 and 3>=3 and 2=2 then 1 else 0")
                                                   (Eval [] (Value 1))

  , Test "prioBool21"
                 (SrcString "if true or false and true then 1 else 0")
                                                   (Eval [] (Value 1))

  , Test "smplTypeTest22" (SrcString "let x = 2 < 1 in x")
                                                   TypeError
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
  , Test "inc"      (SrcString "input x in x + 1") (Eval [42] (Value 43))
  , Test "undefVar" (SrcString "x")                TypeError
  , Test "opbin-"      (SrcString "input x in x - 1") (Eval [-1] (Value (-2)))
  , Test "opbin*"      (SrcString "input x in x * 17") (Eval [3] (Value 51))
  , Test "opbin div"      (SrcString "input x in x div 8") (Eval [7] (Value 0))
  , Test "opbin div wrong"      (SrcString "input x in 5 div x") (Eval [0] RuntimeError)
  , Test "opbin mod"      (SrcString "input x in x mod 8") (Eval [7] (Value 7))
  , Test "opbin mod wrong"      (SrcString "input x in 5 mod x") (Eval [0] RuntimeError)
  , Test "opun -"  (SrcString "input x in -x") (Eval [-7] (Value 7))
  , Test "no input" (SrcString "918 div 3") (Eval [] (Value 306))
  , Test "bad type" (SrcString "2 + false") TypeError
  , Test "bad type2" (SrcString "input x in 2 + 3 >= (not x)") TypeError
  , Test "bad type3" (SrcString "- (not 7)") TypeError
  , Test "bad type4" (SrcString "3 >= (not true)") TypeError
 -- , Test "bad type5" (SrcFile "if.pp4") TypeError
 -- , Test "bad type6" (SrcFile "if2Julka.pp4") TypeError
 -- , Test "good1" (SrcFile "good1.pp4") (Eval [3, 4] (Value 15))
  --, Test "good2" (SrcFile "good1.pp4") (Eval [3, 0] RuntimeError)
 -- , Test "non int var" (SrcFile "nonint.pp4") (Eval [-3] (Value (3)))
  , Test "wrong return" (SrcString "input x in ( x >= 0)") TypeError
  , Test "suma"   (SrcString "input x y z in x + y + z") (Eval[5, 8, -3] (Value 10))
  , Test "mieszanka"  (SrcString "input x y z in x - y + z * x") (Eval[2, 5, 3] (Value 3))
  , Test "priorytety1"  (SrcString "input x y in x div y - y") (Eval[10, 5] (Value (-3)))
  , Test "priorytety2"  (SrcString "input x y in -x * -x") (Eval[-5,  2] (Value 25))
  , Test "maximum"  (SrcFile "maximum.pp4") (Eval [3, 9, -6] (Value 9))
  , Test "bez input" (SrcString "2 + 5 * 8 div 2") (Eval [] (Value 22))
  , Test "ulamki" (SrcFile "ulamki.pp4") (Eval [3, 6, 11, 12] (Value 1))
  , Test "ulamki2" (SrcFile "ulamki.pp4") (Eval [3, 6, 11, 0] RuntimeError)
  , Test "brak zmiennej" (SrcFile "brakzm.pp4") TypeError
  , Test "suma cyfr dz" (SrcFile "sumadz.pp4") (Eval[534, 35435] (Value 6))
  , Test "dama krol" (SrcFile "para.pp4") (Eval[1, 12, 1, 13] (Value 1))
  , Test "dama krol2" (SrcFile "para.pp4") (Eval[1, 12, 1, 12] (Value 0))
  , Test "if1"(SrcFile "if1.pp4") TypeError
  , Test "if2"(SrcFile "if2.pp4") (Eval[8] (Value 2))
  , Test "if22"(SrcFile "if2.pp4") (Eval[-8] (Value (-8)))
  , Test "if3"(SrcFile "if3.pp4") (Eval[6] (Value 2))
  , Test "dzielnik2lub3"(SrcFile "dzielnik2lub3.pp4") (Eval[15] (Value 3))
  , Test "dzielnik2lub3 2"(SrcFile "dzielnik2lub3.pp4") (Eval[18] (Value 6))
  , Test "err"(SrcFile "err.pp4") TypeError
  , Test "0inc"      (SrcString "input x in x + 1") (Eval [42] (Value 43))
  , Test "0undefVar" (SrcString "x")                TypeError
  , Test "easy0div"      (SrcString "input x in 1 div x") (Eval [0] RuntimeError)
  , Test "boolBadType" (SrcString "true")                TypeError
  , Test "answerForEverything" (SrcString "42")          (Eval [] (Value 42))
  , Test "multipleSub" (SrcString "1 - -1")          (Eval [] (Value 2))
  , Test "simpleLet" (SrcString "let x = 2 + 2 in x + x")   (Eval [] (Value 8))
  , Test "twiceLet" (SrcString "let x = 2 * 3 in let y = 2 + x in y * x - y + 2")  (Eval [] (Value 42))
  , Test "saveIf" (SrcString "input x in if x >= 0 then x else 1 div x")   (Eval [0] (Value 0))
  , Test "twiceIf" (SrcString "input x in if x <= 0 then if x <> 0 then 5 div x else x else -x") (Eval [(-5)] (Value (-1)))
  , Test "schoolExample" (SrcString "input x in x + x * x")          (Eval [2] (Value 6)) 
  , Test "hardBoolBadType" (SrcString "true and false or true and false or not false")    TypeError
  , Test "simpleBoolLet" (SrcString "let x = true in if x then 1 else 1 div 0")   (Eval [] (Value 1))
  , Test "5Input"      (SrcString "input x1 x2 x3 x4 x5 in x1 + x2 - x3 * x4 mod x5") (Eval [1,2,3,4,5] (Value 1))
  , Test "twiceLetWithBools"      (SrcString "input x1 x2 in let b1 = x1 < 5 in let b2 = x2 < 5 in if b1 and b2 then x1 + x2 else x1 - x2")  (Eval [4,5] (Value (-1)))
  , Test "twiceLetWithBoolsRuntimeError"      (SrcString "input x1 x2 in let b1 = x1 < 5 in let b2 = x2 < 5 in if b1 and b2 then x1 + x2 else x1 mod x2")  (Eval [5,0] RuntimeError)
  , Test "saveIfDoubleNot" (SrcString "input x in if not not true then x else 1 div x")   (Eval [0] (Value 0))
  , Test "constValue" (SrcString "2") (Eval [] (Value 2)),
      Test "unary" (SrcString "input x y in if not x < y then -x else -y") (Eval [120, 1434] (Value (-1434))),
      Test "decrement" (SrcString "input x in x - 1") (Eval [42] (Value 41)),
      Test "doesntMakeSense" (SrcString "input x in if if x>0 then true else false then x + x else 0") (Eval [10] (Value 20)),
      Test "notAllUsed" (SrcString "input x y z in if x >= y then x else y") (Eval [10, 11, 12] (Value 11)),
      Test "constant" (SrcString "let x = 10 in let y = 100 in x + y") (Eval [] (Value 110)),
      Test "looksBadButItsNot" (SrcString "input x in if x<10 then x + 1 else x div 0") (Eval [9] (Value 10)),
      Test "looksBadAndItsBad" (SrcString "input x in if x<10 then x + 1 else x div 0") (Eval [11] RuntimeError),
      Test "runtimeAnyway" (SrcString "10 div 0") (Eval [] RuntimeError),
   --   Test "medium" (SrcFile "test1.pp4") (Eval [32, 11] (Value 43)),
 --     Test "big" (SrcFile "test2.pp4") (Eval [5, 2, 3, 4] (Value 3)),
  --    Test "huge" (SrcFile "test3.pp4") (Eval [1, 1, 1, 2, 3, 4] (Value 9)),
    
      Test "undefVar" (SrcString "x + 4") TypeError,
      Test "intIf" (SrcString "if 4 then true else false") TypeError,
      Test "wrongUBool" (SrcString "not 4") TypeError,
      Test "wrongUInt" (SrcString "-true") TypeError,
      Test "wrongBInt" (SrcString "4 + true") TypeError,
      Test "wrongBBool" (SrcString "let x = 4 in true and x") TypeError,
      Test "wrongBRel" (SrcString "let x = 21 in let y = true in x < y") TypeError,
      Test "differentInIf" (SrcString "input x y in if x >= y then true else 10") TypeError, 
      Test "inputAlwaysInt" (SrcString "input x y z in if x then if y then y+z else z+y else if z then z+x else x+z") TypeError,
      Test "wrongResult" (SrcString "input x y in if x <> y then true else false") TypeError,
      Test "opticalIllusion" (SrcString "input q w e r t y u i o p a s d f g h j k l z x c b n m in q + w + e - r - t + y + u + i + o + p + a + s + d + f + g + h + j + k + l + z + x + c + v + b + n + m") TypeError
  


  ,Test "inc"      (SrcString "input x in x + 1")        (Eval [42] (Value 43))   
  , Test "undefVar" (SrcString "x")                       TypeError
  , Test "sumaRoznychTypow"  (SrcString "true + 3")         TypeError
  , Test "zwracaBool"     (SrcString "if 7>1 then true else false") TypeError
  , Test "ifInt"   (SrcString "if 2 then false else 1")   TypeError
  , Test "nieznanaZmienna"   (SrcString "input x in y = 2")   TypeError
  , Test "test1"   (SrcString "input x y in if x > y then x else y") ( Eval [2,3] (Value 3))
  , Test "notInt"   (SrcString "not 7")      TypeError
  , Test "test2"   (SrcString "1")         (Eval[] (Value 1))
  , Test "test3"   (SrcString "1 + 2")      (Eval [] (Value 3))
  , Test "sumaBool"   (SrcString "false + false")      TypeError
  , Test "zwracaFalse"   (SrcString "1 > 2")      TypeError
  , Test "porownBool"   (SrcString "false > true")      TypeError
  , Test "test4"   (SrcString "-5+2-7+21")      (Eval [] (Value 11))
  , Test "zwracaTrue"   (SrcString "not false")      TypeError
  , Test "test5"   (SrcString "let x = 2 in 2") (Eval[] (Value 2))
  , Test "nieznaneZmienne"   (SrcString "input a b in if x+y>=2 then x else y") TypeError
  , Test "test6"   (SrcString "input x y in let a = x in if y > a then y else a") (Eval[4,5] (Value 5))
  , Test "test7"   (SrcString "input a b c in 1")   (Eval[1,2,3] (Value 1))
  , Test "test8"      (SrcString "4 div 2 + 3 - 71 mod 3") (Eval[] (Value 3))
  , Test "let_inFalse"  (SrcString "let x = 2 in false") TypeError
  , Test "test9" (SrcString "0 + 1 div 1") (Eval[] (Value 1)) 
  , Test "zwrTrue" (SrcString "input x y z d in if x+y+z>d then true else true") TypeError 
 , Test "test10" (SrcString "input a b c in if let x = -a in if x>0 then true else false then b else c") (Eval[9,8,0] (Value 0)) 
  , Test "zwrBool" (SrcString "input a in not (if a>0 then false else true)") TypeError  
 



 , Test "Val 1" (SrcString "input x in x + 50") (Eval [616] (Value 666)),
        Test "Val 2" (SrcString "input a in a + a * a + a") (Eval [2] (Value 8)),
        Test "Val 3" (SrcString "input q w e in (q + w) * e * (e * w)") (Eval [3, 2, 1] (Value 10)),
        Test "Val 4" (SrcString "input x in (10 * 10 * 6 + (13 div 2) * 10 + 6) * 100 + x * 3") (Eval [14] (Value 66642)),
        Test "Val 5" (SrcString "input q w e in if q * w = w * e + 1 then q * e + w else q + e * w") (Eval [3, 4, 5] (Value 23)),
        Test "Val 6" (SrcString "input q w e in if q * w = w * e + 1 then q * e + w else q + e * w") (Eval [5, 1, 6] (Value 11)),
        Test "Val 7" (SrcString "input q in if q mod 2 = 1 then q else 0") (Eval [3] (Value 3)),
        Test "Val 8" (SrcString "input q in if q mod 2 = 1 then q else 0") (Eval [4] (Value 0)),
        Test "Val 9" (SrcString "input q w in let w=2 in q * w") (Eval [5, 6] (Value 10)),
        Test "Val 10" (SrcString "input q w in if q mod 5 <> w mod 5 then q div w else q mod 5") (Eval [5, 3] (Value 1)),
        Test "Val 11" (SrcString "input q w in if q mod 5 <> w mod 5 then q div w else q mod 5") (Eval [17, 7] (Value 2)),
        Test "Val 12" (SrcString "input q in if not ( q = 42 ) then 1 else 0") (Eval [69] (Value 1)),
        Test "Val 13" (SrcString "input q w in if q mod 2 = w mod 2 and q mod 2 = 1 then 1 else 0") (Eval [3, 5] (Value 1)),
        Test "Val 14" (SrcString "input q w in if q = 42 or w = 666 then 1 else 0") (Eval [666, 666] (Value 1)),
    Test "Val 15" (SrcString "input q w in if not (q <> w) then q else 0") (Eval [1, 2] (Value 0)),
    Test "Val 16" (SrcString "input q w in if not (q <> w) then q else 0") (Eval [1, 1] (Value 1)),
    Test "Val 17" (SrcString "input q w e in if q = w and w = e then 3 else if q = w then 2 else 1") (Eval [1, 1, 1] (Value 3)),
    Test "Val 18" (SrcString "input q w e in if q = w and w = e then 3 else if q = w then 2 else 1") (Eval [1, 1, 3] (Value 2)),
    Test "Val 19" (SrcString "input q w e in if q = w and w = e then 3 else if q = w then 2 else 1") (Eval [1, 2, 3] (Value 1)),
    Test "Val 20" (SrcString "input q w e in if q = w and w = e then 3 else if q = w then 2 else 1") (Eval [1, 2, 1] (Value 1)),
    Test "Val 21" (SrcString "input q w e in if q = w + 1 or w = e + 1 then 2 else if q = e + 1 then 1 else 0") (Eval [1, 2, 3] (Value 0)),
    Test "Val 22" (SrcString "input q w e in if q = w + 1 or w = e + 1 then 2 else if q = e + 1 then 1 else 0") (Eval [3, 1, 4] (Value 0)),
    Test "Val 23" (SrcString "input q w e in if q = w + 1 or w = e + 1 then 2 else if q = w + 1 then 1 else 0") (Eval [3, 2, 1] (Value 2)),
        Test "Type 1" (SrcString "if 42 = true then 1 else 0") TypeError,
        Test "Type 2" (SrcString "input q in if 1 + q then 1 else 0") TypeError,
        Test "Type 3" (SrcString "input q in q = w") TypeError,
        Test "Type 4" (SrcString "if 666 > true then true else false") TypeError,
        Test "Type 5" (SrcString "x") TypeError,
        Test "Type 6" (SrcString "let x = true in x + 1") TypeError,
{-  Test "Type 7" (SrcString "1 + true") TypeError, 
    Test "Type 8" (SrcString "1 - true") TypeError,
    Test "Type 9" (SrcString "1 * true") TypeError,
    Test "Type 10" (SrcString "1 / true") TypeError,
    Test "Type 11" (SrcString "1 div true") TypeError,
    Test "Type 12" (SrcString "1 mod true") TypeError

    Nie parsuje to -}



  Test "inc"      (SrcString "input x in x + 1") (Eval [42] (Value 43))
  , Test "undefVar" (SrcString "x")                TypeError
  , Test "suma"   (SrcString "input x y z in x + y + z") (Eval[5, 8, -3] (Value 10))
  , Test "mieszanka"  (SrcString "input x y z in x - y + z * x") (Eval[2, 5, 3] (Value 3))
  , Test "priorytety1"  (SrcString "input x y in x div y - y") (Eval[10, 5] (Value (-3)))
  , Test "priorytety2"  (SrcString "input x y in -x * -x") (Eval[-5,  2] (Value 25))
  , Test "maximum"  (SrcFile "maximum.pp4") (Eval [3, 9, -6] (Value 9))
  , Test "bez input" (SrcString "2 + 5 * 8 div 2") (Eval [] (Value 22))
  , Test "ulamki" (SrcFile "ulamki.pp4") (Eval [3, 6, 11, 12] (Value 1))
  , Test "ulamki2" (SrcFile "ulamki.pp4") (Eval [3, 6, 11, 0] RuntimeError)
  , Test "brak zmiennej" (SrcFile "brakzm.pp4") TypeError
  , Test "suma cyfr dz" (SrcFile "sumadz.pp4") (Eval[534, 35435] (Value 6))
  , Test "dama krol" (SrcFile "para.pp4") (Eval[1, 12, 1, 13] (Value 1))
  , Test "dama krol2" (SrcFile "para.pp4") (Eval[1, 12, 1, 12] (Value 0))
  , Test "if1"(SrcFile "if1.pp4") TypeError
  , Test "if2"(SrcFile "if2.pp4") (Eval[8] (Value 2))
  , Test "if22"(SrcFile "if2.pp4") (Eval[-8] (Value (-8)))
  , Test "if3"(SrcFile "if3.pp4") (Eval[6] (Value 2))
  , Test "dzielnik2lub3"(SrcFile "dzielnik2lub3.pp4") (Eval[15] (Value 3))
  , Test "dzielnik2lub3 2"(SrcFile "dzielnik2lub3.pp4") (Eval[18] (Value 6))
  , Test "err"(SrcFile "err.pp4") TypeError


  ]

