w(c,[1,3,5,7,9]).
w(s,[0,2,4,6,8]).

last([X|[]],X):-!.
last([_|Y],A):-
	last(Y,A).

mnoz([A,B|C]):-
	naLiczbe(A,_,N),
	naLiczbe(B,_,M),
	last(C,K),
	naLiczbe(K,_,L),
	L is M * N.


odkonca(X,[H|T],Res):-
	length([H|T],X),!,
	Res = H.
odkonca(X,[_|T],Res):-
	odkonca(X,T,Res).
		
mnoz3(FirstNum,SecNum,TabOfRes,Y):-
	naLiczbe(FirstNum,_,ANum),
	odkonca(Y,TabOfRes,RVal),
	naLiczbe(RVal,_,RNum),
	RNum is ANum * SecNum. 
	
mnoz2(A):-mnoz2Itr(A,2).

mnoz2Itr([_,[]|_],_):-!.
mnoz2Itr([A,[H|T]|Res],Itr):-
	mnoz3(A,H,Res,Itr),
	ItrN is Itr + 1,
	mnoz2Itr([A,T|Res],ItrN).
	


naLiczbe([A|[]],1,A):-!.	
naLiczbe([A|B],X,Y):-
	naLiczbe(B,N,M),
	Y is A * (10 ^ N) + M,
	X is N + 1.

wartosc([],[]):-!.
wartosc([TabOfLit|T1],[TabOfVal|T2]):-
	wartoscB(TabOfLit,TabOfVal,first),
	wartosc(T1,T2).
wartoscB([],[],_):-!.
wartoscB([H|T],[A|B],first):-
	H=s,!,
	w(H,[_|N]),
	member(A,N),
	wartoscB(T,B,no).
wartoscB([H|T],[A|B],_):-
	w(H,Y),
	member(A,Y),
	wartoscB(T,B,no).

	
czyPoprawne(X):-
	wartosc(X,Y),
	mnoz(Y),
	mnoz2(Y).
	
	