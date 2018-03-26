% Definiujemy moduł zawierający testy.
% Należy zmienić nazwę modułu na {imie}_{nazwisko}_tests gdzie za
% {imie} i {nazwisko} należy podstawić odpowiednio swoje imię
% i nazwisko bez wielkich liter oraz znaków diakrytycznych
:- module(daniel_dubiel_tests, [resolve_tests/5, prove_tests/4]).

% definiujemy operatory ~/1 oraz v/2
:- op(200, fx, ~).
:- op(500, xfy, v).

% Zbiór faktów definiujących testy dla predykatu resolve
% Należy zdefiniować swoje testy
resolve_tests(simple_test0, q, q, ~q, []).
resolve_tests(simple_test1, q, q, ~q v p, p).
resolve_tests(simple_test2, q, p v q, ~q v r, p v r).
resolve_tests(simple_test3, q, p v p v q, ~q v r, p v p v r).
resolve_tests(simple_test4, q, q, ~q v ~p, ~p).
resolve_tests(simple_test4, p, p v q, ~p v p v r, p v r v q).

resolve_tests(empty_duplicates, p, p v p v p, ~p v ~p v ~p, []).
resolve_tests(right_empty, p, p v a, ~p, a).
resolve_tests(left_empty, p, p, ~p v a, a).
resolve_tests(tautologies1, p, p v ~p, ~p v p, ~p v p).
resolve_tests(tautologies2, p, p, ~p v p, p).
resolve_tests(tautologies3, p, p v ~p, ~p, ~p).

% Zbiór faktów definiujących testy dla predykatu prove
% Należy zdefiniować swoje testy
prove_tests(basic_1, validity, [], sat).
prove_tests(basic_2, validity, [[]], unsat).
prove_tests(basic_3, validity, [p,~p], unsat).

prove_tests(easy_1, validity, [p v ~p], sat).
prove_tests(easy_2, validity, [p, ~p v q], sat).
prove_tests(easy_3, validity, [p, p v q], sat).
prove_tests(easy_4, validity, [q v q, ~q], unsat).
prove_tests(easy_5, validity, [p, q, ~s], sat).

prove_tests(medium_1, validity, [p v ~p, q v ~q, sat).
prove_tests(medium_2, validity, [p , q v ~q , p v ~p , ~p], unsat).
prove_tests(medium_3, validity, [p v q,~p v q,p v ~q, ~p v ~q], unsat).
prove_tests(medium_4, validity, [~q v p v ~r,r,p,q,~q, q v ~p v r], unsat).
prove_tests(medium_5, validity, [q v p, ~p, p], unsat).
prove_tests(medium_6, validity, [a v b, u, i, o, p, k, i , j], sat).
prove_tests(medium_7, validity, [a v b v c v d v e v f], sat).
prove_tests(medium_8, validity, [p, ~p v q ,~q], unsat).
prove_tests(medium_9, validity, [a v b, u, i, o, p, k, i , j], sat).
prove_tests(medium_10, validity, [p, ~p v q ,~q], unsat).

prove_tests(hard_1, performance, [~t v ~f v u v ~p v d, ~j v ~r v b v k v ~s, ~i v j v k, ~d v ~l v g v f, ~c v ~u v ~r v ~n v q, c v ~h v ~j, h v j, o v ~j v r v f v ~p, q v r v ~q v ~s, t v t v ~o v t v ~e], sat).
prove_tests(hard_2, performance, [p v p v p v p v p v p v p v p v p v ~p v p v p v p v ~p v p v p v p v ~p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p v p, ~p v ~p v ~p v ~p v ~p v ~p v ~p v ~p v ~p v ~p v ~p v ~p v p v p], sat).
prove_tests(hard_3, performance, [p v q v r,p v q v r,p v q v r,p v q v r,p v q v r,p v q v r,p v q v r,p v q v r,p v q v r], sat).


