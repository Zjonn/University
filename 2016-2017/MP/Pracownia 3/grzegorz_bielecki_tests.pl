% Definiujemy moduł zawierający testy.
% Należy zmienić nazwę modułu na {imie}_{nazwisko}_tests gdzie za
% {imie} i {nazwisko} należy podstawić odpowiednio swoje imię
% i nazwisko bez wielkich liter oraz znaków diakrytycznych
:- module(grzegorz_bielecki_tests, [tests/3]).

% Zbiór faktów definiujących testy
% Należy zdefiniować swoje testy
tests(empty_program, input(""), program([])).
tests(invalid, input("def main()"), no).
tests(adder, file('adder.hdml'), yes).
tests(srcpos, input("def main(_) = 1"),
  program([def(main, wildcard(file(test, 1, 10, 9, 1)), num(no, 1))])).


tests(skomplikowany, input("
def straszny(A,(_)) =
  if let B = Bolek[[]] in 84[32 .. 56]
  then #[] >= (let Tomek=Janek in [24])(*(*let me know*)*)
  else ~straszny(42)
  "), yes).


tests(sredni, input("
def nocka10(A,B) =
	if A * A > B then 1
	else if B % A = 0 then 0
	else nocka(A+1,B)
"), yes).


tests(prosty_if, input("
def ameba(A,B) =
 if A=B then 1
 else 0
"), yes).


tests(prosty_let, input("
def koi(Taiga,Ryuuji) =
 let Minori = 1 in
 Minori = Ryuuji
"), yes).


tests(prosty_odej, input("
def m_e_e_h(_) = 54 - 8
"), program([def(m_e_e_h, wildcard(no), op(no, '-',num(no,54),num(no, 8)))])).


tests(prosty_pot, input("
def andrzej(A,_A) =
 42 ^ 2
"), program([def(andrzej, pair(no ,var(no, 'A'),var(no, '_A')),
  op(no, '^', num(no, 42),num(no, 2)))])).


tests(prosty_kol, input("
def do_kiedy_spac(Godz) =
 Godz + 8, Godz - 8
"), program([ def(do_kiedy_spac, var(no, 'Godz'),
  pair(no, op(no, '+',var(no, 'Godz'),num(no, 8)),
           op(no, '-',var(no, 'Godz'),num(no, 8))))])).


tests(empty_program, input("
def straszny(A,(_)) =
  if let B = Bolek[[]] in 84[32 .. 56]
  then #[] >= (let Tomek=Janek in [24])(*There is it*)*)
  else ~straszny(42)
"), no).


tests(zla_nazwa_def, input("
def _(A,_A) =
 42 ^ 2
"), no).


tests(zla_nazwa_def_1, input("
def def(A,B) =
 42 + 7
"), no).


tests(prosty_if_no, input("
def ameba(A,B) =
 if A==B then 1
 else 0
"), no).


tests(prosty_let_no, input("
def koi(Taiga,Ryuuji,5) =
 let Minori = 1 in
 Minori = Ryuuji
"), no).


tests(inne_operatory_no, input("
def full_metal'(alchemist)
 if Ab > 0 + ##[[]
 then alchemist % 2
 else alchemist / 1
"), no).


tests(prosty_odej_no, input("
def m_e_e_h(_) =
 A - 8,
"), no).


tests(skomplikowany1_no1, input("
def _minor((A,B),_) =
 if if if []
        then ~42
        else ~~~~54
    then A & 65 > janek #[]
    else let [] = [][[]] in 84[[] . Janek]
 then A=B
 else A[B]
"), no).


tests(skomplikowany_no1, input("
def straszny(A,(_)) =
  if let B = Bolek[[]] in 84[32 .. 56]
  then #[] >= (let Tomek=Janek else [24])(*(*let me know*)*)
  else ~straszny(42)
  "), no).


tests(kropka_no, input("
def ripple_carry_adder(A, B, C) =
  let N = #A in
  if N = 0 then C, []
  else
    let C1. S1 = full_adder(A[0], B[0], C) in
    let C2, S2 = ripple_carry_adder(A[N-1..1], B[N-1..1], C1) in
    C2, S2@S1
"), no).


tests(argument_no, input("
def ameba(A>=B) =
 if A=B then 1
 else 0
"), no).


tests(nawias_no, input("
def ameba(COdec,B =
 if 8=Codec then True
 else False
"), no).


tests(else_no, input("
def ameba(A,B) =
 if A=B then 1
 else if A=B then if A=B then 1
                  else 0
"), no).


tests(in_no, input("
def main(A, B, C) =
  let C1, S1 = ripple_carry_adder(A, B, C) in
  C2, S2 = log_depth_adder(A, B, C) in
  ~((C1 ^ C2) | or_of(S1 ^ S2))
"), no).
