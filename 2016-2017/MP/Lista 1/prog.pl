male(adam).
male(john).
male(mark).
male(david).
male(joshua).
female(helen).
female(ivonne).
female(anna).
female(eve).
parent(adam,helen).
parent(adam,ivonne).
parent(adam,anna).

parent(eve,helen).
parent(eve,ivonne).
parent(eve,anna).

parent(helen,joshua).
parent(john,joshua).

parent(ivonne,david).
parent(mark,david).

grandson/2.
sibling/2.
sister/2.
cousin/2.
descendant/2.
is_mother/1.
is_father/1.

grandson(X , Y) :- parent(X,Z),parent(Z,Y),male(Y).
sibling(X, Y):- parent(Z,X),parent(Z,Y).
sister(X , Y) :- female(X),female(Y),parent(Z,Y),parent(Z,X).
cousin(X,Y):- parent(A,X),parent(B,Y),A\=B,sibling(A,B).
descendant(X, Y) :- parent(A,X),descendant(A, Y);parent(Y,X).
is_mother(X) :- female(X),parent(X,A).
is_father(X) :- father(X),parent(X,A).

