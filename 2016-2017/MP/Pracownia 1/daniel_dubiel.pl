% Definiujemy moduł zawierający rozwiązanie.
% Należy zmienić nazwę modułu na {imie}_{nazwisko} gdzie za
% {imie} i {nazwisko} należy podstawić odpowiednio swoje imię
% i nazwisko bez znaków diakrytycznych
:-module(daniel_dubiel, [solve/2]).

% definiujemy operatory ~/1 oraz v/2
:- op(200, fx, ~).
:- op(500, xfy, v).

% Główny predykat rozwiązujący zadanie.
% UWAGA: to jest rozwiązanie; nie należy zmieniać jego
% definicji.
solve(Clauses, Solution) :-
	clauses_to_list(Clauses, ClausulesAsLists),	
	merge_list_sort(ClausulesAsLists,SortedByLength),!,
	list_of_literals(SortedByLength, ListOfLiterals),
	solveAll(SortedByLength,ListOfLiterals),
	subset_unknown(ListOfLiterals,Solution).
	
%Begin

% Zamienia klauzule na listy.
clauses_to_list(X,Y):-
	clauses_to_listH(X,[],Y).
	
clauses_to_listH([],X,X).
	
clauses_to_listH([A|B],X,Acc):-
	clause_to_list(A,List),
	sort(List,List2),
	clauses_to_listH(B,[List2|X],Acc).
	
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

%Sortuj wzgledem długosci list
merge_list_sort([],[]).    
merge_list_sort([X],[X]).  
merge_list_sort(List,Sorted):-
    List=[_,_|_],even_odd(List,L1,L2),     
	merge_list_sort(L1,Sorted1),merge_list_sort(L2,Sorted2),  
	merge(Sorted1,Sorted2,Sorted),!.                 
merge([],L,L).
merge(L,[],L):-L\=[].
merge([X|L1],[Y|L2],[X|L]):-
	length(X,N),
	length(Y,M),
	N=<M,!,
	merge(L1,[Y|L2],L).
merge([X|L1],[Y|L2],[Y|L]):-
	merge([X|L1],L2,L).

even_odd(L,E,O):-odd(L,E,O).
   
odd([],[],[]).
odd([A|B],X,[A|O]):-even(B,X,O).
   
even([],[],[]).
even([A|B],[A|X],O):-odd(B,X,O).
	
%Tworzy liste literalow
list_of_literals([],[]):-!.
list_of_literals(ListOfClausules,ListOfLiteralss):-
	flatten(ListOfClausules,X),
	remove_negation(X,[],Y),
	sort(Y,ListOfLiterals),
	rebuild(ListOfLiterals,ListOfLiteralss).
	
%Usuwa negacje z listy literalow
remove_negation([],X,X).
remove_negation([~A|B],C,X):-!,
	remove_negation(B,[A|C],X).
remove_negation([A|B],C,X):-
	remove_negation(B,[A|C],X).
	
%Zamienie elmenty list na postac [atom,_]
rebuild([],[]).
rebuild([A|B],[[A,_]|Y]):-
	rebuild(B,Y).


%Middle
member2([A|_],A):-!.
member2([_|B],A):-member2(B,A),!.

%Help
%Usuwa klauzule zawierające spelniony literal
remove_clausules_with_literal([],_,[]).
remove_clausules_with_literal([A|B],Val,X):-
	member2(A,Val),!,
	remove_clausules_with_literal(B,Val,X).	
remove_clausules_with_literal([A|B],Val,[X|Y]):-
	X = A,
	remove_clausules_with_literal(B,Val,Y).
	
remove_clausules_with_literals(X,[],X):-!.
remove_clausules_with_literals(List,[X|Y],Acc):-
	remove_clausules_with_literal(List,X,NewList),
	remove_clausules_with_literals(NewList,Y,Acc).
%Neguje literal
negate(~P,X):-!,
	X = P.
negate(P,X):-
	X = ~P.

%Usuwa z klauzul literaly ktorych nie jestesmy w stanie spelnic
remove_literals_from_clausules(X,_,X):-!.
remove_literals_from_clausules(List,[X|Y],A):-
	negate(X,NX),
	remove_literal_from_clausules(List,NX,NewList),
	NewList \= [],
	remove_literals_from_clausules(NewList,Y,A).
	
remove_literal_from_clausules([],_,[]).
remove_literal_from_clausules([A|B],Literal,[X|Y]):-
	select(Literal,A,X),!,
	remove_literal_from_clausules(B,Literal,Y).
remove_literal_from_clausules([A|B],Literal,[X|Y]):-
	X = A,
	remove_literal_from_clausules(B,Literal,Y).
	
	
%Core
solveAll([],_).
solveAll([A|B],ListOfLiterals):-
	try_atomize(A,LitList,ListOfLiterals),
	remove_clausules_with_literals(B,LitList,NewList),
	remove_literals_from_clausules(NewList,LitList,NewNList),
	solveAll(NewNList,ListOfLiterals).
	

try_atomize([A|_],[Lit|[]],ListOfLiterals):-
	Lit = A,
	evaluate(ListOfLiterals,A).
try_atomize([A|B],[Lit|X],ListOfLiterals):-
	negate(A,C),
	Lit = C,	
	evaluate(ListOfLiterals,C),
	try_atomize(B,X,ListOfLiterals).
	
evaluate([[A,X]|_],~Lit):-
	A = Lit,
	X = f,!,true.
evaluate([[A,X]|_],Lit):-
	A = Lit,
	X = t,!,true.
evaluate([[A,_]|B],Lit):-
	A \= Lit,
	evaluate(B,Lit).
		
%End
%Nieukonkretnionym literalom przypisuje "x".
subset_unknown([],[]).
subset_unknown([[Literal,Y]|Z],[(Literal,B)|C]):-
	atom(Y),!,
	B = Y,
	subset_unknown(Z,C).
subset_unknown([[Literal,_]|Z],[(Literal,B)|C]):-
	B = x,
	subset_unknown(Z,C).
