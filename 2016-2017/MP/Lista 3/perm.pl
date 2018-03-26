
perm([],[]).
perm([A|B], X):-
	perm(B,Y),
	select(A,X,Y).
	
exp(Base, 1, Base):- !.
exp(Base, Exp, Res):- 
	B is Exp - 1,
	exp(Base,B,A),
	Res is Base * A.
	
filter([], []).
filter([A|B], X):-
	A < 0,
	filter(B,X).
filter([A|B], [X|Y]):-
	X = A,
	filter(B,Y).
	
count(_, [], 0).

count(Elem, [X|Y], Count):-
	Elem = X,
	count(Elem,Y,Z),
	Count is Z + 1.
	
count(Elem, [X|Y], Count):-
	Elem \= X,
	count(Elem,Y,Count).

factorial(1, 1).
factorial(N, M):-
	B is N - 1,
	factorial(B, A),!,
	M is N * A.

	
reversee(X,Y) :-
    reversee(X,[],Y),!.
reversee([],A,A).
    reversee([H|T],A,Y) :-
    reversee(T,[H|A],Y).
	
concat_number([X],X).
concat_number([A|B],X):-
	Y is A * 10,
	concat_number(B,Z),
	X is Y * 10 + Z.

decimal(X, [X]):- X<10,!.
decimal(X,[A|B]):-
	M is X//10,
	decimal(M,B),
	A is X mod 10.
	
	
	
	
select_min([X],X,[]).
select_min([X|Y],Z,[B|C]):-
    select_min(Y,Q,C),
    Q>X,
    Z = X,
    B = Q.
 
select_min([X|Y],Z,[B|C]):-
    select_min(Y,Q,C),
    Q=<X,
    Z = Q,
    B = X.
 
sel_sort([],[]).
sel_sort(X,[A|B]):-
    select_min(X,Z,Q),
    A = Z,
    sel_sort(Q,B).
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	