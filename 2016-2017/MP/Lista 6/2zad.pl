%GRAFY
put(E,S,[E|S]).

get([H|T],H,T).
empty([]).
addAll(E,B,S,C):-
	findall(E,B,N),
	append(N,S,C).

%KOLEJKA


putG(E,S-B,S-B2):-
	B = [E|B2].
getG([H|T]-B,H,T-B).
emptyG(X-X).

addAllG(E,G,X-Y,X-Z):-
    findall(E,G,Y,Z).
	
e(v1,v2).
e(v2,v3).
e(v2,v5).
e(v3,v4).
e(v4,v1).
e(v4,v7).
e(v5,v3).
e(v5,v6).
e(v6,v1).
e(v6,v7).

%goHome((Parent,X),From,Path)

goHome((B,_),B,_,Acc,Acc):-!.
goHome((B,_),From,[(A,B)|T],Sth,Res):-!,
	goHome((A,B),From,T,[A|Sth],Res).
goHome(A,From,[_|T],Sth,Res):-
	goHome(A,From,T,Sth,Res).
	
findPath(From,To,Path):-
	/*Trzeci i czwarty argument:
		dla zamknietej listy: [From|[]],[]
		dla otwartej: [],[(_,v1)|X]-X
	*/
	findPath(From,To,[From|[]],[],[(P,C)|NPath]),
	goHome((P,C),From,NPath,[P,C],Path).
	
pairMember([(_,C)|_],C):-!.
pairMember([_|T],C):-pairMember(T,C).
	
findPath(To,To,Path,_,Path):-!.
findPath(From,To,[Path|Tail],Ways,Acc):-
	not(pairMember(Tail,From)),!,
	addAll((From,X),e(From,X),Ways,NewWays),
	get(NewWays,(X,NewFrom),NNewWay),
	findPath(NewFrom,To,[(X,NewFrom),Path|Tail],NNewWay,Acc).
findPath(_,To,X,Y,Acc):-
	get(Y,(A,H),NewWays),
	findPath(H,To,[(A,H)|X],NewWays,Acc).
	