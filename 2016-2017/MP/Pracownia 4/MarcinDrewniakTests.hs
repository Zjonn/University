{-# LANGUAGE Safe #-}

module MarcinDrewniakTests(tests) where
import DataTypes
tests :: [Test]


tests =
    [ 
      Test "constValue" (SrcString "2") (Eval [] (Value 2)),
      Test "unary" (SrcString "input x y in if not x < y then -x else -y") (Eval [120, 1434] (Value (-1434))),
      Test "decrement" (SrcString "input x in x - 1") (Eval [42] (Value 41)),
      Test "doesntMakeSense" (SrcString "input x in if if x>0 then true else false then x + x else 0") (Eval [10] (Value 20)),
      Test "notAllUsed" (SrcString "input x y z in if x >= y then x else y") (Eval [10, 11, 12] (Value 11)),
      Test "constant" (SrcString "let x = 10 in let y = 100 in x + y") (Eval [] (Value 110)),
      Test "looksBadButItsNot" (SrcString "input x in if x<10 then x + 1 else x div 0") (Eval [9] (Value 10)),
      Test "looksBadAndItsBad" (SrcString "input x in if x<10 then x + 1 else x div 0") (Eval [11] RuntimeError),
      Test "runtimeAnyway" (SrcString "10 div 0") (Eval [] RuntimeError),
      Test "medium" (SrcFile "test1.pp4") (Eval [32, 11] (Value 43)),
      Test "big" (SrcFile "test2.pp4") (Eval [5, 2, 3, 4] (Value (-11))),
      Test "huge" (SrcFile "test3.pp4") (Eval [1, 1, 1, 2, 3, 4] (Value 9)),
    
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
    ]


-- idea jest taka, ze TypeErrory maja byc krotkie, ale konkretne (reagowac na kazdy blad wyprowadzenia z punktu widzenia interpretera). mam nadzieje, ze to dobra droga
-- nie zawarlem w nich sprawdzania instrukcji let bo nie widze sytuacji, w ktorej interpreter moze zawiesc
-- poprawne zdaja mi sie byc prymitywne, bo nie bardzo widze tutaj roznorodnych przypadkow do rozpatrzenia. nie zrobilem tez za duzo dlugich, bo to nie ma sensu - sa powtarzalne, wiec zdaje sie nic z nich nie wynikac
