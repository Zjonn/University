%STOS
put(E,S,[E|S]).

get([H|T],H,T).
empty([]).
addAll(E,B,S,C):-
	findall(E,B,N),
	append(N,S,C).

%KOLEJKA


putK(E,S-B,S-B2):-
	B = [E|B2].
getK([H|T]-B,H,T-B).
emptyK(X-X).

addAllK(E,G,X-Y,X-Z):-
    findall(E,G,Y,Z).
	
itr(X,X).
itr(X,Y):-	
	X<3,
	Z is X + 1,
	itr(Z,Y).