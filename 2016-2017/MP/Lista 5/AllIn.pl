appnn(X, Y):-
	appn(X,[Y]-Y).
appn([], _-[]).
appn([[H1|H2]|Tail], L-End) :-!,
  End = [H1|End2],
  appn([H2|Tail], L-End2).
appn([[]|Tail], L-End) :-
  appn(Tail, L-End).
  
flattenn(X, Pointer) :-
  flatten(X, [Pointer] - Pointer, []).
flatten([], _ - X, X).
flatten([H|Tail], FlattenedList - Pointer, R) :-
  atomic(H), !,
  Pointer = [H|NewPointer],
  flatten(Tail, FlattenedList - NewPointer, R).
flatten([H|Tail], FlattenedList - Pointer, R) :-
  flatten(H, [X]- X, Z),
  Pointer = X,
  flatten(Tail, FlattenedList - Z, R).
 
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
		
merge([A|B],[C|D],X-Acc):-
    A>=C,!,Acc =[C|Z],
    merge([A|B],D,X-Z).
	
merge([A|B],C,X-Acc):-
    Acc =[A|Z],
    merge(B,C,X-Z).

merge_sort([],[]):-!.
merge_sort([X],[X]):-!.
merge_sort(X,Y):-
	halve(X,L1,L2),
	merge_sort(L1,N1),
	merge_sort(L2,N2),
	mergee(N1,N2,Y).
	
merge_sort2([],_,[]).
merge_sort2([X],_,[X]).
merge_sort2([X],_,[X]).

split(L,V,S,B):-
	split(L,V,[],[],S,B).

split([],_,S,B,S,B).
split([M|N],V,X,Y,S,B):-
	V>M,!,
	split(N,V,[M|X],Y,S,B).
split([M|N],V,X,Y,S,B):-
	split(N,V,X,[M|Y],S,B).	
	
quick_sort([],[]).
quick_sort(A,Y):-
	qsort(A,[],Y).
	
qsort([],X,X):-!.
qsort([A|B],X,Y):-
	split(B,A,R,L),
	qsort(L,X,Z),
	qsort(R,[A|Z],Y).
		
sum(X,Y,Z):-
	nonvar(X),
	nonvar(Y),!,
	Z is X + Y.
sum(X,Y,Z):-
	nonvar(Z),
	nonvar(Y),!,
	X is Z - Y.
sum(X,Y,Z):-
	nonvar(Z),
	nonvar(X),!,
	Y is Z - X.
sum(X,Y,Z):-
	nonvar(X),!,
	itr(0,Y),
	Z is Y + X.
sum(X,Y,Z):-
	nonvar(Y),!,
	itr(0,X),
	Z is Y + X.
sum(X,Y,Z):-
	nonvar(Z),!,
	itrm(0,X),
	Y is Z - X.
sum(X,Y,Z):-
	itr4(0,1,X,Y),
	Z is X + Y.

itr(X,X).
itr(X,Y):-
	Z is X + 1,
	itr(Z,Y).
	
itr4(X,Y,X,Y).
itr4(X,Y,Y,X).
itr4(X,Y,-X,-Y).
itr4(X,Y,-Y,-X).
itr4(X,Y,Z,Q):-
	A is X + 1,
	B is Y + 1,
	itr4(A,B,Z,Q).

	
itrm(X,X).
itrm(X,Y):-X\=0,Y is -X.
itrm(X,Y):-
	Z is X + 1,
	itrm(Z,Y).
	
	
mergeBU(X,Z):-
	dontWorry(X,[Y]-Y),
	beHappy(Y,Z).

beHappy([X],X):-!.
beHappy(X,Y):-
	mergeBUU(X,Z),
	beHappy(Z,Y).
	
mergeBUU([],[]):-!.
mergeBUU([X],[X]):-!.
mergeBUU([A,B|C],[X|Y]):-
	mergee(A,B,N),X=N,
	mergeBUU(C,Y).
	

dontWorry([],_-[]):-!.
dontWorry([X|Y],L-End):-
	End = [[X]|End2],
	dontWorry(Y,L-End2).
	
%---------------------------------------------------------------------------------------
makeList(1,X,X):-!.
makeList(X,Y,Acc):-
	X2 is X - 1,
	makeList(X2,[(X-_)|Y],Acc).
	
makeList2(Y,_-[],X):- X is Y - 1.
makeList2(X,L-Y,Acc):-
	Y = [(X-_)|New],
	NX is X + 1,
	makeList2(NX,L-New,Acc).

prime(X):-integer(X),X = 0,!,false.
prime(X):-integer(X),X = 1,!,false.
	
prime(X):-
	integer(X),!,
	primeV(X).
	
prime(X):-
	primeNV(X).
	
primeNV(X):-
	makeList2(2,[L]-L,Y),
	sitoE(L),
	check(L),X = Y.

primeV(X):-
	makeList(X,[],Y),
	sitoE(Y),
	check(Y).
	
check([(_-A)|[]]):-var(A),!.
check([_|B]):-check(B).
	
attack([],_,_):-!.


attack([(_-X)|B],Ile,It):-
	var(X),It = 0,!,X = a,Itn is Ile - 1,
	attack(B,Ile,Itn).
attack([(_-X)|B],Ile,It):-
	nonvar(X),It = 0,!,Itn is Ile - 1,
	attack(B,Ile,Itn).
attack([_|A],Ile,It):-
	It > 0 , 
	NewIt is It - 1,
	attack(A,Ile,NewIt).

	
sitoE([]):-!.
sitoE([(A-X)|B]):-
	var(X),!,
	It is A - 1,
	attack(B,A,It),
	sitoE(B).
	
sitoE([_|B]):-
	sitoE(B).
	