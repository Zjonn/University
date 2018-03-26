insert(leaf,X,node(leaf,X,leaf)):-!.
insert(node(X,Val,Y),Z,A):-
	Z\=Val,
	Z>=Val,!,
	insert(Y,Z,B),
	A = node(X,Val,B).
insert(node(X,Val,Y),Z,A):-
	Z\=Val,
	Z<Val,!,
	insert(X,Z,B),
	A = node(B,Val,Y).
insert(node(X,Val,Y),_,node(X,Val,Y)).

find(node(_,Val,_),Val):-!.
find(node(A,_,B),Val):-
	find(A,Val),!;
	find(B,Val).
	
findMax(node(_,V,leaf),V):-!.
findMax(node(_,_,B),V):-
	findMax(B,V).
	
delMax(node(leaf,V,leaf),V,leaf):-!.
delMax(node(X,V,leaf),V,X):-!.
delMax(node(X,Y,B),V,A):-
	delMax(B,V,C),
	A = node(X,Y,C).
	
empty(leaf).

del(leaf,_,leaf):-!.
del(node(X,Val,Y),Z,B):-
	Z>Val,!,
	del(Y,Z,C),
	B = node(X,Val,C).
	
del(node(X,Val,Y),Z,B):-
	Z<Val,!,
	del(X,Z,C),
	B = node(C,Val,Y).

del(node(X,Val,Y),Val,B):-
	insertTree(Y,X,B).
	
insertTree(leaf,X,X):-!.
insertTree(node(leaf,Val,B),X,node(X,Val,B)):-!.
insertTree(node(A,M,R),X,node(Y,M,R)):-
	insertTree(A,X,Y).