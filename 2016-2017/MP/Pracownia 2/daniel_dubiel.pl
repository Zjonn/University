% Definiujemy modu³ zawieraj¹cy rozwi¹zanie.
% Nale¿y zmieniæ nazwê modu³u na {imie}_{nazwisko} gdzie za
% {imie} i {nazwisko} nale¿y podstawiæ odpowiednio swoje imiê
% i nazwisko bez wielkich liter oraz znaków diakrytycznych
%:- module(daniel_dubiel, [resolve/4, prove/2]).

% definiujemy operatory ~/1 oraz v/2
:- op(200, fx, ~).
:- op(500, xfy, v).

% Szukanie rezolwenty.
% UWAGA: to jest rozwi¹zanie; nie nale¿y zmieniaæ jego
% definicji.
%resolve(q, p v q, ~q v r, r v p).
resolve(L,C1,C2,R):-
	clause_to_list_with_remove(L,C1,X-X,End),
	negate(L,NL),
	clause_to_list_with_remove(NL,C2,X-End,[]),
	merge_sort(X,SR),
	list_to_clause(SR,R).

clause_to_list_with_remove(_,[],_-End,End):-!.
clause_to_list_with_remove(Lit,A v B, List-End,Tail):-Lit \= A,!,
	End = [A|End2],
	clause_to_list_with_remove(Lit,B,List-End2,Tail).
clause_to_list_with_remove(Lit,_ v B, List,Tail):-!,
	clause_to_list_with_remove(Lit,B,List,Tail).
	
clause_to_list_with_remove(Lit,~A,_-End,Tail):-Lit \= ~A,!,
	End = [~A|Tail].
clause_to_list_with_remove(Lit,A,_-End,Tail):-Lit \= A,!,
	End = [A|Tail].
clause_to_list_with_remove(_,_,_-End,End).


% G³ówny predykat rozwi¹zuj¹cy zadanie.
% UWAGA: to jest rozwi¹zanie; nie nale¿y zmieniaæ jego
% definicji.
prove(Clauses, UnreadyProve2) :-
	clauses_to_list(Clauses,ListClauses,[],LitList),
	merge_sort_with_filtr(LitList,ClearLit),
	merge_sort_for_list(ListClauses,SortedList,ClearLit,[]),
	SortedList \= [],
	try(SortedList,SortedList,UnreadyProve2).


try([([H|X],Y)|T],ReadyProve,Acc):-
	try_prove(H,[([H|X],Y)|T],ReadyProveList-ReadyProveList,[]),
	not(hasEmpty(ReadyProveList)),!,
	negate(H,NH),
	merge_sort_for_list([([H|X],Y)|T],NewList,[H,NH],NewEnd),	
	NewEnd = ReadyProveList,
	appendMe(ReadyProve,ReadyProveList,[],AEnd),
	%nie mo¿e byœ to samo 2 razy
	try(NewList,AEnd,Acc).
	
try([([H|X],Y)|T],ReadyProve,Acc):-
		try_prove(H,[([H|X],Y)|T],ReadyProveList-ReadyProveList,[]),
		appendMe(ReadyProve,ReadyProveList,[],Acc).
	
try_prove(_,[],_-Acc,Acc):-!.
try_prove(Lit,[(H,_)|T],ResolveList-End,Acc):-
	equals(Lit,H),!,
	res(Lit,H,T,ResolveList-End,End2),
	try_prove(Lit,T,ResolveList-End2,Acc).
try_prove(Lit,[_|T],List,Acc):-
	try_prove(Lit,T,List,Acc).

res(_,_,[],_-X,X):-!.
res(~Lit,H,[(X,Pair)|Y],List-End,EndA):-
	memberPair(Lit,(X,Pair)),!,
	resolve2(Lit,X,H,R),
	End = [(R,(Lit,X,H))|End2],
	res(~Lit,H,Y,List-End2,EndA).
res(Lit,H,[(X,Pair)|Y],List-End,EndA):-
	memberPair(~Lit,(X,Pair)),!,
	resolve2(Lit,H,X,R),
	End = [(R,(Lit,X,H))|End2],
	res(Lit,H,Y,List-End2,EndA).
res(Lit,H,[_|Y],List,ListAcc):-
		res(Lit,H,Y,List,ListAcc).
	
	

hasEmpty([([],_)|_]):-!.
hasEmpty([_|T]):-hasEmpty(T).
	
	
	
	
%Predykaty pomocnicze
%equals
equals(~X,Y):-
	member(~X,Y),!.
equals(X,Y):-
	member(X,Y),!.
%member dla par
memberPair(Lit,([Lit|_],_)):-!.
memberPair(Lit,([_|T],X)):-
	memberPair(Lit,(T,X)).

%Neguje zmnienna
negate(~X,X):-!.
negate(X,~X).

%Usuwa pierwszy
removeFirst([_|T],T).

%append z odciêciami 
appendMe([],[],X,X):-!.
appendMe([],[X|Y],B,Acc):-!,
	appendMe([],Y,[X|B],Acc).
appendMe([X|Y],L,B,Acc):-
	appendMe(Y,L,[X|B],Acc).
	

%Resolve na gotowych listach

resolve2(L,C1,C2,R):-
	find_resolve(L,C1,[List]-List,End),
	negate(L,NL),
	find_resolve(NL,C2,List-End,[]),
	merge_sort(List,R).

find_resolve(_,[],_-X,X):-!.
find_resolve(L,[L|T],List,AccEnd):-!,
	find_resolve(L,T,List,AccEnd).
find_resolve(L,[H|T],List-End,AccEnd):-
	End = [H|End2],
	find_resolve(L,T,List-End2,AccEnd).
	
/* Dzia³ mergesortów */
	
%merge_sort: usuwa powtórzenia, stawia zmienn¹ i zanegowan¹ zmienn¹ obok siebie (przydaje siê przy szukaniu tautologi)

halve([],[],[]).
halve(X,L,R):-
    halve(X,L,R,X,[]).
halve([A|R],L,[A|R],[],L):-!.
halve(X,L,X,[_],L):-!.
halve([A|B],L,R,[_,_|Z],X):-
    halve(B,L,R,Z,[A|X]).
 	
mergee(X,Y,Z):-
	merge(X,Y,[Z]-Z).
merge(A,[],_-A):-!.
merge([],B,_-B):-!.
%~A-~A
merge([~A|B],[~C|D],X-Acc):-
    A@>C,!,Acc =[~C|Z],
    merge([~A|B],D,X-Z).
	
merge([~A|B],[~C|D],X-Acc):-
	A@<C,!,Acc =[~A|Z],
    merge(B,[~C|D],X-Z).
%A-~A
merge([A|B],[~C|D],X-Acc):-
    A@>=C,!,Acc =[~C|Z],
    merge([A|B],D,X-Z).
	
merge([A|B],[~C|D],X-Acc):-
	A@<C,!,Acc =[A|Z],
    merge(B,[~C|D],X-Z).
%~A-A
merge([~A|B],[C|D],X-Acc):-
    A@>=C,!,Acc =[C|Z],
    merge([~A|B],D,X-Z).
	
merge([~A|B],[C|D],X-Acc):-
	A@<C,!,Acc =[~A|Z],
    merge(B,[C|D],X-Z).
%A-A	
merge([A|B],[C|D],X-Acc):-
    A@>C,!,Acc =[C|Z],
    merge([A|B],D,X-Z).
	
merge([A|B],[C|D],X-Acc):-
	A@<C,!,Acc =[A|Z],
    merge(B,[C|D],X-Z).

merge(A,[_|D],X):-
    merge(A,D,X).

merge_sort_with_filtr(X,Y):-
	merge_sort(X,DY),
		filtr(DY,Y).
	
merge_sort([],[]):-!.
merge_sort([X],[X]):-!.
merge_sort(X,Y):-
	halve(X,L1,L2),
	merge_sort(L1,N1),
	merge_sort(L2,N2),
	mergee(N1,N2,Y).
	
%is_tautology: sprawdza czy klauzula jest tautologi¹

is_tautology([A,~A|_]):-!.
is_tautology([~A,A|_]):-!.
is_tautology([_|T]):-
	is_tautology(T).

%to_remove: sprawdza czy klauzula zawiera jeden z literalow do usuniecia
to_remove([A|_],[A|_]):-!.
to_remove([~A|B],[Lit|Lits]):-
	A@<Lit,!,to_remove(B,[Lit|Lits]).
to_remove([A|B],[Lit|Lits]):-
	A@>Lit,!,to_remove([A|B],Lits).
to_remove([_|B],Lits):-
	to_remove(B,Lits).
	
%merge_sort_for_list: merge sort dla list, dodatkowo usuwa niepotrzebne klauzule oraz klauzule zawieraj¹ce tautologie

mergee_for_list(X,Y,Z,LitList,AccEnd):-
	merge_for_list(X,Y,[Z]-Z,LitList,AccEnd).
	
merge_for_list([],[],_-AccEnd,_,AccEnd):-!.

merge_for_list([(A,_)|B],[],List,LitList,AccEnd):-to_remove(A,LitList),!,merge_for_list(B,[],List,LitList,AccEnd).
merge_for_list([],[(C,_)|D],List,LitList,AccEnd):-to_remove(C,LitList),!,merge_for_list([],D,List,LitList,AccEnd).

merge_for_list([(A,_)|B],[],List,LitList,AccEnd):-is_tautology(A),!,merge_for_list(B,[],List,LitList,AccEnd).
merge_for_list([],[(C,_)|D],List,LitList,AccEnd):-is_tautology(C),!,merge_for_list([],D,List,LitList,AccEnd).

merge_for_list([A|B],[],List-End,LitList,AccEnd):-!,End = [A|End2],merge_for_list(B,[],List-End2,LitList,AccEnd).
merge_for_list([],[C|D],List-End,LitList,AccEnd):-!,End = [C|End2],merge_for_list([],D,List-End2,LitList,AccEnd).

merge_for_list([(A,_)|B],D,List,LitList,AccEnd):-
	to_remove(A,LitList),!,merge_for_list(B,D,List,LitList,AccEnd).
	
merge_for_list(A,[(C,_)|D],List,LitList,AccEnd):-
	to_remove(C,LitList),!,merge_for_list(A,D,List,LitList,AccEnd).
	
merge_for_list([(A,_)|B],D,List,LitList,AccEnd):-
	is_tautology(A),!,merge_for_list(B,D,List,LitList,AccEnd).
	
merge_for_list(A,[(C,_)|D],List,LitList,AccEnd):-
	is_tautology(C),!,merge_for_list(A,D,List,LitList,AccEnd).
	
merge_for_list([A|B],[C|D],X-End,LitList,AccEnd):-
    A@>C,!,End =[C|Z],
    merge_for_list([A|B],D,X-Z,LitList,AccEnd).
	
merge_for_list([A|B],[C|D],X-End,LitList,AccEnd):-
	A@<C,!,End =[A|Z],
    merge_for_list(B,[C|D],X-Z,LitList,AccEnd).

merge_for_list(A,[_|D],X,LitList,AccEnd):-
    merge_for_list(A,D,X,LitList,AccEnd).
	
merge_sort_for_list([],X,_,X):-!.
merge_sort_for_list([(X,A)],[(X,A)|Y],Lit,Y):-not(to_remove(X,Lit)),not(is_tautology(X)),!.
merge_sort_for_list([(_,_)],Y,_,Y):-!.
merge_sort_for_list(X,Y,LitList,AccEnd):-
	halve(X,L1,L2),
	merge_sort_for_list(L1,N1,LitList,_),
	merge_sort_for_list(L2,N2,LitList,_),
	mergee_for_list(N1,N2,Y,LitList,AccEnd).
	
%filtr - usuwa z listy litera³ow zmienn¹ zdaniow¹ oraz jej negacje jeœli wystêpuj¹
filtr(X,Y):-
	filtrr(X,[Y]-Y).
filtrr([],_-[]):-!.
filtrr([A,~A|H],List):-!,
	filtrr(H,List).
filtrr([~A,A|H],List):-!,
	filtrr(H,List).
filtrr([A|H],List-End):-
	End = [A|End2],
	filtrr(H,List-End2).
	
%Predykaty w³aœciwe

%BEGIN

%Wywoluje funkcje zamiany
clauses_to_list(Clauses,List,End,Literals):-
	formula(Clauses, [List]-List,End,[Literals]-Literals).
%Zamienia liste klauzul na liste list, dodatkowo zwraca liste wystêpujacych literalow
formula([],_-RetEnd,RetEnd,_-[]).
formula([H|T],List-End,RetEnd,Literals-EndLit):-
	clause_to_list(H,[ClauseAsList]-ClauseAsList,Literals-EndLit,EndOfList),
	merge_sort(ClauseAsList,SortedClauseAsList),
	End = [(SortedClauseAsList,axiom)|End2],	 
	formula(T,List-End2,RetEnd,Literals-EndOfList).
%Zamienia klauzule na liste
clause_to_list([],_-[],_-X,X):-!.
clause_to_list(A v B, List-End,LitList-EndLit,AccEnd):-!,
	End = [A|End2],
	EndLit = [A|EndLit2],
	clause_to_list(B,List-End2,LitList-EndLit2,AccEnd).
clause_to_list(~A,_-End,_-EndLit,AccEnd):-!,
	End = [~A|[]],
	EndLit = [~A|AccEnd].
clause_to_list(A,_-End,_-EndLit,AccEnd):-
	End = [A|[]],
	EndLit = [A|AccEnd].
%Zamienia listê na klauzule
list_to_clause([],[]):-!.
list_to_clause([X],X):-!.
list_to_clause([H|T],H v Y):-
	list_to_clause(T,Y).

	

	