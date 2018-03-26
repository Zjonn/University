factorial(0,1).
factorial(1,1):-!.
factorial(M,N):-
    X is M - 1,
    factorial(X,A),
    N is A * M.
 
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
    sort(Q,B).
 
insert([X],X,[X]).
insert([],X,[X]).
 
insert([A|B],N,[X|Y]):-
    integer(N),
    N<A,
    X = N,
    insert([A|B],_,Y).
   
insert([A|B],N,[X|Y]):-
    X=A,
    insert(B,N,Y).
 
ins_sort([X],[X]).
ins_sort([X|Y],A):-
    ins_sort(Y,B),
    insert(B,X,A).
   
 
reversee(X,Y) :-
    reversee(X,[],Y),!.
reversee([],A,A).
    reversee([H|T],A,Y) :-
    reversee(T,[H|A],Y).
 
perm([],[]):-!.
 
perm([H|T], X):-
    perm(T,Y),
    select(H,X,Y).
 
perm(X, [H|T]):-
    var(X),perm([H|T],X).
 
 
perm2([],[]).
 
perm2(L, [X|Y]):-
    \+var(L),
    select(X,L,Z),
    perm2(Z, Y).
 
perm2(L,X):-
    var(L),perm2(X,L).