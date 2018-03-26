% Definiujemy moduł zawierający rozwiązanie.
% Należy zmienić nazwę modułu na {imie}_{nazwisko} gdzie za
% {imie} i {nazwisko} należy podstawić odpowiednio swoje imię
% i nazwisko bez znaków diakrytycznych
:-module(mariusz_bielecki, [solve/2]).

% definiujemy operatory ~/1 oraz v/2
:- op(200, fx, ~).
:- op(500, xfy, v).

% Główny predykat rozwiązujący zadanie.

solve(Clauses, Solution) :-
  toAllLiteralsList(Clauses, ListedLiterals),
  toListOfListedClauses(Clauses, [], ListedClauses),
  solve(ListedClauses, [], ListedLiterals, FSolution, Remaining),
  buildSolution(Remaining, [], SSolution),
  append(FSolution, SSolution, Solution).



%predykat budujący z pozostałych zmiennych krotki (zmienna, x)
buildSolution([], Acc, Acc).
buildSolution([H|Remaining], Acc, X) :-
  buildSolution(Remaining, [(H, x)|Acc], X).





%p v q v r => v(p, v(q, r))



%predykat wyciągający z formuły wszystkie zmienne zdaniowe (bez powtorzen)
toAllLiteralsList(ListOfClauses, AllLiteralsList) :-
  toAllLiteralsList(ListOfClauses, [], X),
  sort(X, AllLiteralsList).

toAllLiteralsList([], Acc, Acc).

toAllLiteralsList([Literal|RestClauses], Acc, AllLiteralsList) :-
  atom(Literal),!,
  toAllLiteralsList(RestClauses, [Literal|Acc], AllLiteralsList).

toAllLiteralsList([~Literal|RestClauses], Acc, AllLiteralsList) :-
  toAllLiteralsList(RestClauses, [Literal|Acc], AllLiteralsList), !.

toAllLiteralsList([[]|RestClauses], Acc, AllLiteralsList) :-
  toAllLiteralsList(RestClauses, Acc, AllLiteralsList), !.

toAllLiteralsList([Literal v Clause|RestClauses], Acc, AllLiteralsList) :-
  atom(Literal),!,
  toAllLiteralsList([Clause|RestClauses], [Literal|Acc], AllLiteralsList).

toAllLiteralsList([~Literal v Clause|RestClauses], Acc, AllLiteralsList) :-

  toAllLiteralsList([Clause|RestClauses], [Literal|Acc], AllLiteralsList).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%predykat zamieniający klauzule na liste literałow
toListedClause([], Acc, Acc) :-!.
toListedClause(Literal, Acc, [Literal|Acc]) :- atom(Literal), !.
toListedClause(~Literal, Acc, [~Literal|Acc]).

toListedClause(Literal v Rest, Acc, Sorted) :-
  toListedClause(Rest, [Literal|Acc], ListedClause),
  sort(ListedClause, Sorted).

%predykat zamieniajacy liste klauzul na liste list reprezentujacych klauzule.
toListOfListedClauses([], Acc, Acc).

toListOfListedClauses([Clause|RestClauses], Acc, ListOfListedClauses)  :-
  toListedClause(Clause, [], ListedClause),
  toListOfListedClauses(RestClauses, [ListedClause|Acc], ListOfListedClauses).



%member(Elem, [Elem|_]) :-!.
%member(Elem, [_|Tail]) :-
%  member(Elem, Tail), !.

%predykat szukający wartościowań
solve([], AccSolution, Remaining, AccSolution, Remaining) :- !.



solve(ListedClauses, AccSolution, [Literal|RestListedLiterals], Solution, Remaining) :-
  member(X, [t, f]),
  removeClausesWithLit(X, ListedClauses, Literal, [], RemovedListedClauses),
  solve(RemovedListedClauses, [(Literal, X)|AccSolution], RestListedLiterals, Solution, Remaining).

%Predykat usuwa klauzule zawierające zmienną zdaniową (gdy pierwszy argument unifikuje się z t)
%lub klauzule zawierające negacje zmiennej zdaniowej (gdy pierwszy argument unifikuje się z f)
%dodatkowo, predykat stara się pozbywać się nieznaczących literałów, które już na pewno są fałszywe
%gdyby po usunięciu literału z klauzuli okazało się, ze jest pusta, to predykat zawiedzie.
removeClausesWithLit(_, [], _, Acc, Acc):-!.

% zmienna
removeClausesWithLit(t, [ListedClause|RestOfListedClauses], Literal, Acc, RemovedListedClauses) :-
  member(Literal, ListedClause), !,
  removeClausesWithLit(t, RestOfListedClauses, Literal, Acc, RemovedListedClauses).

removeClausesWithLit(t,[ListedClause|RestOfListedClauses], Literal, Acc, RemovedListedClauses) :-
  member(~Literal, ListedClause),!,
  select(~Literal,ListedClause, RemovedList),
  \+ RemovedList = [],
  removeClausesWithLit(t, RestOfListedClauses, Literal, [RemovedList|Acc], RemovedListedClauses).

removeClausesWithLit(t,[ListedClause|RestOfListedClauses], Literal, Acc, RemovedListedClauses) :-!,
  removeClausesWithLit(t ,RestOfListedClauses, Literal, [ListedClause|Acc], RemovedListedClauses).

%~ ~zmienna
removeClausesWithLit(f, [ListedClause|RestOfListedClauses], Literal, Acc, RemovedListedClauses) :-
  member(~Literal, ListedClause), !,
  removeClausesWithLit(f, RestOfListedClauses, Literal, Acc, RemovedListedClauses).

removeClausesWithLit(f, [ListedClause|RestOfListedClauses], Literal, Acc, RemovedListedClauses) :-
  member(Literal, ListedClause),!,
  select(Literal,ListedClause, RemovedList),
  \+ RemovedList = [], 
  removeClausesWithLit(f, RestOfListedClauses, Literal, [RemovedList|Acc], RemovedListedClauses).

removeClausesWithLit(f, [ListedClause|RestOfListedClauses], Literal, Acc, RemovedListedClauses) :-!,
  removeClausesWithLit(f, RestOfListedClauses, Literal, [ListedClause|Acc], RemovedListedClauses).




remove(_ ,_, [], Acc, Acc).
remove(t, Literal, [Clause|ClausesList], Acc, Removed) :-
  member(Literal, Clause),!,
  remove(t, Literal, ClausesList, Acc, Removed).
remove(t, Literal, [Clause|ClausesList], Acc, Removed) :-
  remove(t, Literal, ClausesList, [Clause|Acc], Removed).

remove(f, Literal, [Clause|ClausesList], Acc, Removed) :-
  member(~Literal, Clause),!,
  remove(f, Literal, ClausesList, Acc, Removed).
remove(f, Literal, [Clause|ClausesList], Acc, Removed) :-
  remove(f, Literal, ClausesList, [Clause|Acc], Removed).
