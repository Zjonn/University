append([], X, X).
append([H|T], X, [H|Y]) :-
append(T, X, Y).

czyParzysta([]).
czyParzysta([_,_|X]) :- czyParzysta(X).
palindrom(X) :- Y = X, reverse(X,Y).
singleton([_]).
head(H,[L|_]) :- H = L.
last(L,[L|[]]).
last(L,[_|H]) :-  last(L,H).
tail(T,[_|L]) :- T = L.
init([],[_|[]]).
init([X|L],[X|T]) :- init(L,T).
prefix([],_).
prefix([X|P],[X|L]) :- prefix(P,L).
suffix(L,S) :- append(_,S,L).

sublist(_,[]).

sublist([X|Y], [X|Z]):-
    sublist(Y,Z).

sublist([_|X],Y):-
    sublist(X,Y).

perm([],[]).
perm(L, [X|Y]):-
    select(X,L,Z),
    perm(Z, Y).