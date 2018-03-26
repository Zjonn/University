% Definiujemy moduł zawierający testy.
% Należy zmienić nazwę modułu na {imie}_{nazwisko}_tests gdzie za
% {imie} i {nazwisko} należy podstawić odpowiednio swoje imię
% i nazwisko bez wielkich liter oraz znaków diakrytycznych
:- module(mariusz_bielecki_tests, [tests/3]).

% Zbiór faktów definiujących testy
% Należy zdefiniować swoje testy
tests(empty_program, input(""), program([])).
tests(invalid, input("def main()"), no).
tests(adder, file('adder.hdml'), yes).
tests(srcpos, input("def main(_) = 1"),
  program([def(main, wildcard(file(test, 1, 10, 9, 1)), num(no, 1))])).

tests(naw_w_naw, input("def ananas(((_))) = [[-[]]]"), yes).


tests(lacznosc_lewo_z_priorytetami, input("

def kondominium(_) =
    2 + x * 7 - (y * 3 + 5)

                    "), program([
                                def(
                                    kondominium,
                                    wildcard(no),
                                    op(no, '-',
		                                  op(no, '+',
			                                   num(no, 2),
			                                   op(no, '*',
				                                     var(no, x),
				                                     num(no, 7))),
		                                  op(no, '+',
			                                    op(no, '*',
				                                      var(no, y),
				                                      num(no,3)),
			                                    num(no,5)))
                                    )
                                ])
                                    ).




tests(lacznosc_lewo, input("

def kondominium(_) =
    Ru + De - Je

                    "), program([
                                def(
                                    kondominium,
                                    wildcard(no),
                                    op(no, '-',
                                      op(no, '+',
                                          var(no, 'Ru'),
                                          var(no, 'De')
                                          ),
                                        var(no, 'Je')

                                        )
                                    )
                                ])
                                    ).




tests(lacznosc_prawo, input("

def kondominium(_) =
    Ru, De, Je

                    "), program([
                                def(
                                    kondominium,
                                    wildcard(no),
                                    pair(no,
                                        var(no, 'Ru'),
                                        pair(no,
                                            var(no, 'De'),
                                            var(no, 'Je')
                                            )
                                        )
                                    )
                                ])
                                    ).





tests(zagniez_if, input("

def bakalie(Zmienna, _, Z) =
    if if 1 then 2 else 3 then 4 else 5

                        "), yes).



tests(zagniez_if_invalid, input("

def bakalie(Zmienna, _, Z) =
      if if 1 then 2 then 4 else 5

                        "), no).


tests(unarne_op, input("

def panstwo_teoretyczne(_) = a, (#b), (~c), (~(~d)), (#e)

                      "), yes).

tests(unarne_op_invalid, input("

def panstwo_teoretyczne(_) =
    -a, #b, ~c, ~(~), ###e

                      "), no).

tests(dwa_def, input("

def pom(s, x) =
  x * s
def pomfact(x, s) =
  if x = 0 then s
  else
    let z = pom(s, x) in
    pomfact(x-1, z)

                      "), yes).



tests(no_def_invalid, input("

pom(s, x) =
    x * s

                        "), no).


tests(binarne_op_invalid, input("

    def czosnek(_) =
      1, 2, 3 = 4 <> 5 < 6 > 7 <= 8 >= 9 ^ 10 | 11 + 12 - 13 & 14 * 15 / 16 % 18 @

                        "), no).

tests(prosty_test2, input("

def _500plus(_) =
    if dzieci > 2 then daj(500), zabierz(700) else zabierz(700)

                          "), yes).

tests(prosty_test2_invalid, input("

def _500plus(_) = if dzieci > (2 then daj(500), zabierz(700) else zabierz(700)

                            "), no).

tests(wymyslne_naw, input("

def yetAnotherUselessFunction(_, (eh)) = let eh = (let _ = [][1[2,3][wyr]] in john(doe)) in [[~bo]]

    "), yes).


tests(wymyslne_naw_invalid, input("

def yetAnotherUselessFunction(, (eh)) =
    let eh = (let _ = [][1[2,3][wyr]] in john(doe)) in [[~bo]]

                          "), no).

tests(invalid5, input("def +(_) = 1"), no).
tests(invalid6, input("def m(_) == 1"), no).
tests(invalid7, input("def f(if 1 then 2 else 3) = 1"), no).
tests(invalid8, input("def f(_) = let X = 1 in"), no).
tests(invalid9, input("def f(_) = [][]"), no).
