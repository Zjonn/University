% Definiujemy moduł zawierający rozwiązanie.
% Należy zmienić nazwę modułu na {imie}_{nazwisko} gdzie za
% {imie} i {nazwisko} należy podstawić odpowiednio swoje imię
% i nazwisko bez znaków diakrytycznych
%:-module(daniel_dubiel, [solve/2]).

% definiujemy operatory ~/1 oraz v/2
:- op(200, fx, ~).
:- op(500, xfy, v).

% Główny predykat rozwiązujący zadanie.
% UWAGA: to jest rozwiązanie; nie należy zmieniać jego
% definicji.
%solve(Clauses, Solution) :-
	
	
%Begin
% Zamienia klauzule na listy.
clauses_to_list(X,Y):-
	clauses_to_listH(X,[],Y).
	
clauses_to_listH([],X,X).
	
clauses_to_listH([A|B],X,Acc):-
	clause_to_list(A,List),
	clauses_to_listH(B,[List|X],Acc).

	
clause_to_list(X,Y):-
	clause_to_listH(X,[],Y).
	
clause_to_listH([],X,X).

clause_to_listH(A v B,X,Acc):-
	clause_to_listH(B,[A|X],Acc),!.

clause_to_listH(~A,X,Acc):-
	atom(A),!,
	clause_to_listH([],[~A|X],Acc).
clause_to_listH(A,X,Acc):-
	atom(A),
	clause_to_listH([],[A|X],Acc).
	
list_of_literals([],[]).
list_of_literals(ListOfClausules,ListOfLiterals):-
	flatten(ListOfClausules,X),
	remove_negation(X,[],Y),
	sort(Y,ListOfLiterals).
	
remove_negation([],X,X).
remove_negation([~A|B],C,X):-!,
	remove_negation(B,[A|C],X).
remove_negation([A|B],C,X):-
	remove_negation(B,[A|C],X).



%Middle

		
%End
%Nieukonkretnionym literalom przypisuje "x".
