% Definiujemy moduł zawierający testy.
% Należy zmienić nazwę modułu na {imie}_{nazwisko}_tests gdzie za
% {imie} i {nazwisko} należy podstawić odpowiednio swoje imię
% i nazwisko bez wielkich liter oraz znaków diakrytycznych
:- module(daniel_dubiel_tests, [tests/3]).

% Zbiór faktów definiujących testy
% Należy zdefiniować swoje testy
tests(empty_program, input(""), program([])).

tests(easyInvalid1, input("def main()"), no).
tests(easyInvalid2, input("
def main(A) =  
	if A = 0 
	then ((1)
"), no).

tests(mediumInvalid1, file('prog2.hdml'), no).

tests(easy1, input("
def main(A) = 
	A"), yes).
tests(easy2, input("def main(A) = A*A"), yes).
tests(easy3, input("def main(A) = A,A&A"), yes).
tests(easy4, input("
def main(A,B) = 
	if A*B>B 
	then A,A&A
	else B|A,B
"), yes).

tests(med2, input("
def _minor((A,B),_) =
 if 
	if 
		if []
        then ~69 
        else ~~~~42
    then A & 19 > yenefer #[]
    else let [] = [][[]] in 84[[] .. Jaskier]
 then A=B
 else A[B]
"), yes).

tests(medium1, file('prog1.hdml'), yes).
tests(medium2, file('prog3.hdml'), yes).
tests(medium3, file('prog4.hdml'), no).


tests(skos1, input("def main(_) = 1"),
	program([def(main, wildcard(file(test, 1, 10, 9, 1)), num(no, 1))])).
tests(skos2, file('skos.hdml'), yes).

