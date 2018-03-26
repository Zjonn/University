% Sprawdzaczka do zadania 1
%
% Sprawdzaczkę należy uruchomić w katalogu w którym znajdują się testy
% i rozwiązania:
%
% $ swipl prac1.pl
%
% Predykat test_all/0 uruchamia rozwiązanie na wszystkich testach
% is wyświetla raport. np.
%
% ?- test_all.
% excluded_middle                0.003s ok
% wrong_test                     0.000s wrong answer
% invalid_test                   invalid test
% big_test                       tle
% tricky                         3.243s invalid answer
%
% Za pomocą predykatu run_test/1 można uruchomić pojedynczy test podając
% jego nazwę:
%
% ?- run_test(excluded_middle).
% excluded_middle                0.003s ok
%
% Dla każdego uruchomionego testu sprawdzaczka wyświetla czas działania
% (o ile test się w~pełni wykonał) oraz status wykonania. Możliwe wartości
% to:
%
% ok             - program przeszedł test
% wrong answer   - błędna odpowiedź
% tle            - przekroczony limit czasu
% invalid test   - niepoprawny format testu
% invalid answer - niepoprawna format rozwiązania
%
% UWAGA: niniejsza sprawdzaczka nie sprawdza wszystkich warunków nałożonych
% na format testów i wyników działania programu. Zachęcamy jednak do
% modyfikowania i ulepszania jej kodu.
% 
% Do poprawnego działania sprawdzaczki należy jeszcze zmodyfikować
% poniższe dwa wiersze:
:- use_module(daniel_dubiel_tests).
:- use_module(mariusz_bielecki).

:- op(200, fx, ~).
:- op(500, xfy, v).

test_all :-
  run_test(_), fail;
  format("Done!~n", []).

run_test(Name) :-
  tests(Name, Type, Input, Timeout, Ans),
  format("~w~t~32+ ", [Name]),
  ( validate_test(Name, Type, Input, Timeout, Ans) ->
      catch(run_test(Input, Timeout, Ans, Status),
        time_limit_exceeded,
        (Status = tle)),
      print_status(Status)
  ; format("invalid test~n")
  ).

% =============================================================================
% Predykaty pomocnicze

print_status(tle)       :- format("tle~n").
print_status(ok(Time))  :- format("~3fs ok~n", [Time]).
print_status(wa(Time))  :- format("~3fs wrong answer~n", [Time]).
print_status(inv(Time)) :- format("~3fs invalid answer~n", [Time]).

run_test(Input, Timeout, Ans, Status) :-
  statistics(cputime, T0),
  TimeLimit is Timeout / 1000,
  call_with_time_limit(TimeLimit,
    findall(X, solve(Input, X), Solutions)),
  statistics(cputime, T1),
  Time is T1 - T0,
  ( maplist(validate_solution, Solutions) ->
      check_solutions(Ans, Solutions, Time, Status)
  ; Status = inv(Time)
  ).

check_solutions(solution(Sol), Solutions, Time, Status) :-
  ((member(GSol, Solutions), instance_of(Sol, GSol)) ->
    Status = ok(Time)
  ; Status = wa(Time)
  ).
check_solutions(count(N), Solutions, Time, Status) :-
  ( check_count_solution(Solutions, N) ->
    Status = ok(Time)
  ; Status = wa(Time)
  ).

check_count_solution([], 0).
check_count_solution([Sol|Solutions], N) :-
  include(is_any, Sol, Sol2),
  length(Sol2, M),
  N2 is N - (2 ** M),
  N2 >= 0,
  check_count_solution(Solutions, N2).

is_any((_, x)).

instance_of(Sol, GSol) :-
  sort(Sol,  SSol),
  sort(GSol, SGSol),
  maplist(variable_match, SSol, SGSol).

variable_match((X, _), (X, x)) :- !.
variable_match((X, V), (X, V)).

validate_test(Name, Type, Input, Timeout, Ans) :-
  atom(Name),
  ground(Type), member(Type, [validity, performance]),
  acyclic_term(Input), ground(Input), validate_input(Input),
  number(Timeout), Timeout >= 500, Timeout =< 10000,
  acyclic_term(Ans), ground(Ans), validate_ans(Ans).

validate_input(Input) :-
  maplist(is_clause, Input).

validate_ans(solution(Sol)) :-
  maplist(is_valuation, Sol).
validate_ans(count(N)) :-
  number(N), N >= 0.

validate_solution(Solution) :-
  acyclic_term(Solution), ground(Solution),
  maplist(is_gvaluation, Solution).

is_valuation((X, V)) :-
  is_variable(X), member(V, [t, f]).

is_gvaluation((X, V)) :-
  is_variable(X), member(V, [t, f, x]).

is_clause([]) :- !.
is_clause(C) :- is_non_empty_clause(C).

is_non_empty_clause(L) :- is_literal(L), !.
is_non_empty_clause(L v C) :-
  is_literal(L), is_non_empty_clause(C).

is_literal(X) :- is_variable(X), !.
is_literal(~X) :- is_variable(X).

is_variable([]) :- !, fail.
is_variable(X) :- atom(X).