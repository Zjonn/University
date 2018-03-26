lng([],0).
lng([_|X],Y):-
	integer(Y),
	Z is Y - 1,
	lng(X,Z),!.
lng([_|X],Y):-
	\+integer(Y),
	lng(X,Z),
	Y is Z + 1.
	
connection(warszawa, gliwice).
connection(gliwice, warszawa).
connection(gliwice , wroclaw).
connection(wroclaw , warszawa).
connection(wroclaw , warszawa).
connection(warszawa , wroclaw).
connection(wroclaw , lublin).	


trip(X, X, X).
trip(X, Y, B):-
	tripH(X,Y,[X],B).
	
tripH(X,X,_,[X]).
tripH(X,Y,M,[A|B]):-
	connection(X,Z),
	\+byl(Z,M),
	tripH(Z,Y,[Z|M],B),
	A = X.
	
byl(X,[X|_]).
byl(X,[_|B]):-
	byl(X,B).
	
	
mirror(leaf,leaf).
mirror(node(X,Y,Z),A):-
	mirror(X,M),
	mirror(Z,N),
	A = node(N,Y,M).
	
flatten(leaf,[]).
flatten(node(X,Y,Z),WYM):-
	flatten(X,N),
	flatten(Z,M),
	append(N,[Y],Tmp),
	append(Tmp,M,WYM).

rev(X,Y) :- atomic(X),Y=X.
rev(X,Y) :-
    rev(X,[],Y),!.
rev([],A,A).
    rev([H|T],A,Y) :-
    rev(T,[H|A],Y).
	
	
reval(X,Y):-
	revall(X,Z),
	reverse(Z,Y).
revall([],[]).
revall(X,X):- atomic(X).
revall([A|B],X):-
	revall(B,M),
	revall(A,N),
	rev(N,Z),
	X= [Z|M].
	
insert(leaf,X,node(leaf,X,leaf)).
insert(node(X,Val,Y),Z,A):-
	Z>=Val,
	insert(Y,Z,B),
	A = node(X,Val,B).
insert(node(X,Val,Y),Z,A):-
	Z<Val,
	insert(X,Z,B),
	A = node(B,Val,Y).
	
	
tree([],X,X).
tree([X|Y],Z,Aku):-
	insert(Aku,X,Tmp),
	tree(Y,Z,Tmp).

treesort(X,Y):-
	tree(X,Z,leaf),
	flatten(Z,Y).

guard([_]).
guard([_|B]):-
	guard(B).

doB([]).
doB([0|A]):-doB(A).	
doB([1|A]):-doB(A).	

doR([1]).
doR([0|A]):-doB(A).	
doR([1|A]):-doB(A).	

bin([0]).
bin([1]).
bin([1|B]):-
	guard(B),
	doB(B).
	
rbin([0]).
rbin(X):-
	guard(X),
	doR(X).
	