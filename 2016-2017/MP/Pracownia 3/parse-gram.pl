


w_bin1(Ast) --> w_bin2(Ast).

w_bin1(op(no,A1,O,A2)) --> w_bin1(A1),op_1(O),w_bin2(A2).


w_bin1(Ast) --> w_bin2(A),w1(A,Ast).

w1(Acc,Acc) --> [].
w1(Ast,Acc) --> op_1(O),w_bin2(A1),
{W = op(no,Ast,O,A1)},w1(W,Acc).

/*/////////////////////////////////////////////////////////////*/
w_bin2(Ast) --> w_bin3(Ast).

w_bin2(op(no,A1,O,A2)) --> w_bin2(A1),op_2(O),w_bin3(A2).


w_bin2(Ast) --> w_bin2(A),w2(A,Ast).

w2(Acc,Acc) --> [].
w2(Ast,Acc) --> op_2(O),w_bin3(A1),
{W = op(no,Ast,O,A1)},w2(W,Acc).

/*/////////////////////////////////////////////////////////////*/
w_bin3(Ast) --> w_bin4(Ast).

w_bin3(op(no,A1,O,A2)) --> w_bin3(A1),op_3(O),w_bin4(A2).


w_bin3(Ast) --> w_bin2(A),w3(A,Ast).

w3(Acc,Acc) --> [].
w3(Ast,Acc) --> op_3(O),w_bin4(A1),
{W = op(no,Ast,O,A1)},w3(W,Acc).

/*/////////////////////////////////////////////////////////////*/
w_bin4(Ast) --> w_bin5(Ast).

w_bin4(op(no,A1,O,A2)) --> w_bin4(A1),op_4(O),w_bin5(A2).


w_bin4(Ast) --> w_bin2(A),w4(A,Ast).

w4(Acc,Acc) --> [].
w4(Ast,Acc) --> op_4(O),w_bin5(A1),
{W = op(no,Ast,O,A1)},w4(W,Acc).

/*/////////////////////////////////////////////////////////////*/
w_bin5(Ast) --> w_bin6(Ast).

w_bin5(pair(no,A1,A2)) --> w_bin5(A1),op_5(_),w_bin6(A2).


w_bin5(Ast) --> w_bin2(A),w5(A,Ast).

w5(Acc,Acc) --> [].
w5(Ast,Acc) --> op_5(O),w_bin6(A1),
{W = op(no,Ast,O,A1)},w5(W,Acc).

/*/////////////////////////////////////////////////////////////*/
w_bin6(Ast) --> wyrazenie_p(Ast).






w_bin1(Ast) --> w_bin2(Ast);
	w_bin1(A1),op_1(O),!,w_bin2(A2),
	{Ast = op(no,A1,O,A2)}
	.


w_bin2(Ast) --> w_bin3(Ast);
	w_bin2(A1),op_2(O),!,w_bin3(A2),
	{Ast = op(no,A1,O,A2)}
	.


w_bin3(Ast) --> w_bin4(Ast);
	w_bin4(A1),op_3(O),!,w_bin3(A2),
	{Ast = op(no,A1,O,A2)}
	.


w_bin4(Ast) --> w_bin5(Ast);
	w_bin5(A1),op_4(O),!,w_bin5(A2),
	{Ast = op(no,A1,O,A2)}
	.

	
w_bin5(Ast) --> w_bin6(Ast);
	w_bin6(A1),op_5(_),!,w_bin5(A2),
	{Ast = pair(no,A1,A2)}
	.

w_bin6(Ast) --> 
	wyrazenie_p(Ast).
	







	
w_bin5(Ast) --> w_bin6(A),w5(A,Ast).	
w5(Acc,Acc) --> [].
w5(Ast,Acc) --> op_5(O),w_bin6(A1),
{W = op(no,Ast,O,A1)},w5(W,Acc).	
	
	
wzorzec(Ast) -->
	(
	[tPod],!,{Ast = wildcard(no)};
	zmienna(Ast),!;
	/*Warning*/
	[tLParen],!,wzorzec(Ast),[tRParen];
	wzorzec(A1),[tCom],wzorzec(A2),{Ast = pair(no,A1,A2)}
	).
	

wzorzec(Ast) --> [tPod],!,{Ast = wildcard(no)}.
wzorzec(Ast) --> zmienna(Ast).
wzorzec(Ast) --> [tLParen],!,wzorzec(Ast),[tRParen].
wzorzec(Ast) -->  wzorzec(A1),[tCom],wzorzec(A2),
	{Ast = pair(no,A1,A2)}.
	

wzorzec(Ast) --> [tPod],!,{Ast = wildcard(no)}.
wzorzec(Ast) --> zmienna(A),wzorzecP(A,Ast).
wzorzec(Ast) --> [tLParen],!,wzorzec(A),[tRParen],wzorzecP(A,Ast).
wzorzecP(Acc,Acc) --> [].
wzorzecP(Ast,Acc) --> 
	[tCom],wzorzec(A),
	{N = pair(no,Ast,A)},wzorzecP(N,Acc).
	
	
	
	
	
	
	
	
	
	
	
	
	
wyrazenie_p(Ast) -->
	[tLParen],!,wyrazenie(Ast),[tRParen];
	wyrazenie_atom(Ast),!;
	wybor_bitu(Ast),!;
	wybor_bitow(Ast).

	
wybor_bitu(Ast) --> 
	wyrazenie_p(A1),
		[tLSquare],
			wyrazenie(A2),
		[tRSquare],
	{Ast = bitsel(no,A1,A2)}.

wybor_bitow(Ast) -->
	wyrazenie_p(A1),
		[tLSquare],
			wyrazenie(A2),[tKropki], wyrazenie(A3),
		[tRSquare],
	{Ast = bitsel(no,A1,A2,A3)}.
	
%/////////////////////////////////////////////////////////////	
	
wybor_bitu(Ast) --> 
	wyrazenie_p(A1),
		[tLSquare],
			wyrazenie(A2),
		[tRSquare],
	{Ast = bitsel(no,A1,A2)}.
	

wybor_bitu(Ast) -->	[tLParen],!,wyrazenie(Ast),[tRParen].
wybor_bitu(Ast) -->	wyrazenie_atom(Ast),!.
wybor_bitu(Ast) -->	wybor_bitow(Ast).
	
%/////////////////////////////////////////////////////////////		
	
wyrazenie_p(Ast) --> wyrazenie(A),wyrazenie_pP(A,Ast).
wyrazenie_p(Ast) --> wyrazenie_atom(A),wyrazenie_pP(A,Ast).


wyrazenie_pP(Ast,Acc) --> [tLSquare],wyrazenie(A1),[tRSquare],!,
	{A = bitsel(no,Ast,A1)},wyrazenie_pP(A,Acc).
wyrazenie_pP(Ast,Acc) --> [tLSquare],!,wyrazenie(A1),[tKropki],wyrazenie(A2),[tRSquare],
	{A = bitsel(no,Ast,A1,A2)},wyrazenie_pP(A,Acc).
wyrazenie_pP(Acc,Acc) --> [].

wybor_bitu(Ast) --> 
	wyrazenie_p(A1),
		[tLSquare],
			wyrazenie(A2),
		[tRSquare],
	{Ast = bitsel(no,A1,A2)}.

wybor_bitow(Ast) -->
	wyrazenie_p(A1),
		[tLSquare],
			wyrazenie(A2),[tKropki], wyrazenie(A3),
		[tRSquare],
	{Ast = bitsel(no,A1,A2,A3)}.
	
	
	
	
wyrazenie_op(Ast) -->
	(
	w_bin1(Ast);
	op_u(O),!,wyrazenie_op(A),
	{Ast = op(no,O,A)};
	/*Warning*/
	wyrazenie_p(Ast)	
	).
	
wyrazenie_op(Ast) --> 
	op_u(O),!,wyrazenie_op(A1),
	{A = op(no,O,A1)},wyrazenie_opP(A,Ast).
wyrazenie_op(Ast) --> 
	wyrazenie_p(A),wyrazenie_opP(A,Ast).





	