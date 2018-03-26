leaf.
tree(leaf) --> ['*'].
tree(node(L,R)) --> ['('],tree(L),tree(R),[')'].

se(a) --> ['a'],!.
se(b) --> ['b'],!.
se(E) --> ['('],exp(E),[')'].

exp(E * B) --> se(S),['*'],!,expL(E,B*S).
exp(E) --> se(E),!.

expL(E,A)--> se(S),"*",!,expL(E,A*S).
expL(A,A*S)-->se(S).