% Sprawdzaczka do zadania 3
%
% Sprawdzaczkę należy uruchomić w katalogu w którym znajdują się testy
% i rozwiązania:
%
% $ swipl prac3.pl
%
% Predykat test_all/0 uruchamia rozwiązanie na wszystkich testach
% is wyświetla raport. np.
%
% ?- test_all.
% empty_program                  0.003s ok
% wrong_test                     0.000s wrong answer
% invalid_test                   invalid test
% big_test                       tle
% tricky                         0.243s invalid answer
%
% Za pomocą predykatu run_test/1 można uruchomić pojedynczy test podając
% jego nazwę:
%
% ?- run_test(empty_program).
% empty_program                  0.003s ok
%
% Dla każdego uruchomionego testu sprawdzaczka wyświetla czas działania
% (o ile test się w~pełni wykonał) oraz status wykonania. Możliwe wartości
% to:
%
% ok             - program przeszedł test
% wrong answer   - błędna odpowiedź
% tle            - przekroczony limit czasu (1s dla tego zadania)
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
:- use_module(daniel_dubiel).

test_all :-
  ( test_name_duplicate(Name) ->
      format("Multiple tests with name: ~w~n", [Name])
  ; true),
  ( run_test(_), fail
  ; format("Done!~n", [])).

run_test(Name) :-
  tests(Name, Input, Ans),
  format("~w~t~32+ ", [Name]),
  ( validate_test(Name, Input, Ans) ->
      catch(run_test(Input, Ans, Status),
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

% =============================================================================
% Uruchamianie parsera

run_test(Input, Ans, Status) :-
  read_input(Input, Path, Codes),
  statistics(cputime, T0),
  call_with_time_limit(1, try_parse(Path, Codes, Solution)),
  statistics(cputime, T1),
  Time is T1 - T0,
  ( validate_solution(Solution) ->
    ( check_solution(Solution, Ans) -> Status = ok(Time)
    ; Status = wa(Time)
    )
  ; Status = inv(Time)
  ).

try_parse(Path, Codes, Solution) :-
  ( catch(
      (parse(Path, Codes, Program), Solution=ok(Program)),
      syntax_error(_, _),
      Solution=syntax_error), !
  ; Solution=syntax_error
  ).

read_input(input(S), test, Codes) :- string_codes(S, Codes).
read_input(file(Path), Path, Codes) :-
  read_file_to_codes(Path, Codes, []).

% =============================================================================
% Poprawność danych

test_name_duplicate(Name) :-
  tests(Name, _, _),
  findall(a, tests(Name, _, _), L),
  length(L, N),
  N > 1.

validate_test(Name, Input, Ans) :-
  atom(Name),
  ground(Input), acyclic_term(Input), validate_input(Input),
  ground(Ans),   acyclic_term(Ans),   validate_ans(Ans).

validate_input(input(S)) :- string(S).
validate_input(file(Path)) :- atom(Path),
  exists_file(Path).

validate_ans(yes).
validate_ans(no).
validate_ans(program(P)) :- is_program(P).

validate_solution(ok(Program)) :-
  ground(Program), acyclic_term(Program), is_program(Program).
validate_solution(syntax_error).

is_program(P) :- maplist(is_definition, P).

is_definition(def(Name, P, E)) :-
  atom(Name), is_pattern(P), is_expr(E).

is_pattern(wildcard(Pos)) :- is_position(Pos).
is_pattern(var(Pos, X))   :- is_position(Pos), atom(X).
is_pattern(pair(Pos, P1, P2)) :-
  is_position(Pos), is_pattern(P1), is_pattern(P2).

is_expr(if(Pos, E1, E2, E3)) :-
  is_position(Pos), is_expr(E1), is_expr(E2), is_expr(E3).
is_expr(let(Pos, P, E1, E2)) :-
  is_position(Pos), is_pattern(P), is_expr(E1), is_expr(E2).
is_expr(op(Pos, Op, E)) :-
  is_position(Pos), is_unop(Op), is_expr(E).
is_expr(op(Pos, Op, E1, E2)) :-
  is_position(Pos), is_binop(Op), is_expr(E1), is_expr(E2).
is_expr(pair(Pos, E1, E2)) :-
  is_position(Pos), is_expr(E1), is_expr(E2).
is_expr(bitsel(Pos, E1, E2)) :-
  is_position(Pos), is_expr(E1), is_expr(E2).
is_expr(bitsel(Pos, E1, E2, E3)) :-
  is_position(Pos), is_expr(E1), is_expr(E2), is_expr(E3).
is_expr(call(Pos, Name, E)) :-
  is_position(Pos), atom(Name), is_expr(E).
is_expr(var(Pos, X)) :- is_position(Pos), atom(X).
is_expr(num(Pos, N)) :- is_position(Pos), number(N).
is_expr(empty(Pos)) :- is_position(Pos).
is_expr(bit(Pos, E)) :- is_position(Pos), is_expr(E).

is_position(no).
is_position(file(Path, Line, LinePos, CharNo)) :-
  atom(Path), number(Line), number(LinePos), number(CharNo).
is_position(file(Path, Line, LinePos, CharNo, Length)) :-
  atom(Path), number(Line), number(LinePos), number(CharNo), number(Length).

is_unop(Op)  :- memberchk(Op, ['-', '#', '~']).
is_binop(Op) :- memberchk(Op,
  ['=','<>','<','>','<=','>=','^','|','+','-','&','*','/','%','@']).

% =============================================================================
% Sprawdzanie rozwiązania

check_solution(syntax_error, no).
check_solution(ok(_), yes) :- !.
check_solution(ok(P1), program(P2)) :-
  equal_programs(P1, P2).

equal_programs(P1, P2) :-
  maplist(equal_definitions, P1, P2).

equal_definitions(def(Name, P1, E1), def(Name, P2, E2)) :-
  equal_terms(P1, P2), equal_terms(E1, E2).

equal_terms(X, Y)   :- atom(X), !, X = Y.
equal_terms(X, Y)   :- number(X), !, X = Y.
equal_terms(T1, T2) :-
  T1 =.. [F,Pos1|Args1],
  T2 =.. [F,Pos2|Args2],
  equal_positions(Pos1, Pos2),
  maplist(equal_terms, Args1, Args2).

equal_positions(no, _) :- !.
equal_positions(_, no) :- !.
equal_positions(P1, P2) :-
  P1 =.. [file,Path,Line,LinePos,CharNo|LengthOpt1],
  P2 =.. [file,Path,Line,LinePos,CharNo|LengthOpt2],
  once((LengthOpt1 = LengthOpt2; LengthOpt1 = []; LengthOpt2 = [])).
