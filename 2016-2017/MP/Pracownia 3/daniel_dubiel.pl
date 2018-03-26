% Definiujemy moduł zawierający rozwiązanie.
% Należy zmienić nazwę modułu na {imie}_{nazwisko} gdzie za
% {imie} i {nazwisko} należy podstawić odpowiednio swoje imię
% i nazwisko bez wielkich liter oraz znaków diakrytycznych
:- module(daniel_dubiel, [parse/3]).

% Główny predykat rozwiązujący zadanie.
% UWAGA: to jest rozwiązanie; nie należy zmieniać jego
% definicji.
/*UWAGA: Program oparty zostal na prostym parserze umieszczonym na skosie*/

parse(_Path, Codes, Program) :-
	phrase(lexer(Tokens),Codes),
	phrase(program(Program),Tokens).

/*Zamienia program na liste tokenow*/  

lexer(Tokens) -->
   white_com,
   (  (  "..",      !, { Token = tKropki }
      ;  ",",       !, { Token = tCom }
      ;  "(",       !, { Token = tLParen }
      ;  ")",       !, { Token = tRParen }
	  ;  "[",       !, { Token = tLSquare }
      ;  "]",       !, { Token = tRSquare }
      ;  "+",       !, { Token = tAdd }
      ;  "-",       !, { Token = tSub }
      ;  "*",       !, { Token = tMult }
	  ;  "/",       !, { Token = tDiv }
	  ;  "^",       !, { Token = tPow }
	  ;  "%",       !, { Token = tMod }
	  ;  "&",       !, { Token = tAnd }
	  ;  "|",       !, { Token = tOr }
	  ;  "~",       !, { Token = tNeg }
	  ;  "@",       !, { Token = tMonk }
	  ;  "#",       !, { Token = tHash }
      ;  "=",       !, { Token = tEq }
      ;  "<>",      !, { Token = tNot }
      ;  "<=",      !, { Token = tMR }
      ;  "<",       !, { Token = tM }
      ;  ">=",      !, { Token = tWR }
      ;  ">",       !, { Token = tW }
      ;  digit(D),  !,
            number(D, N),
            { Token = tokNumber(N) }
      ;  letter(L), !, identifier(L, Id),
            {  member((Id, Token), [ (def, tDef),
                                     (else, tElse),
                                     (if, tIf),
                                     (in, tIn),
                                     (let, tLet),
                                     (then, tThen),
									 ('_', tPod)]),!
            ;  Token = tokVar(Id)
            }
      ;  [_],
            { Token = tokUnknown }
      ),
      !,
         { Tokens = [Token | TokList] },
      lexer(TokList)
   ;  [],
         { Tokens = [] }
   ).
   
%Obsluguje biale znaki i komentarze	

white_com -->
   [Char], { code_type(Char, space) }, !, white_com;
   "(*", !, com, white_com.
white_com -->
   [].
   
com --> "(*",!,com2,com.
com --> "*)",!.
com --> [_], com.

com2 --> "(*",!,com,com2.
com2 --> "*)",!.
com2 --> [_], com2.

digit(D) -->
   [D],
      { code_type(D, digit) }.
digits([D|T]) -->
   digit(D),
   !,
   digits(T).
digits([]) -->
   [].

number(D, N) -->
   digits(Ds),
      { number_chars(N, [D|Ds]) }.

letter(L) -->
   [L], { code_type(L, csymf) }.

alphanum([A|T]) -->
   [A], { code_type(A, csym) }, !, alphanum(T).
alphanum([39|T])-->
	[39],!, alphanum(T).
alphanum([]) -->
   [].

identifier(L, Id) -->
   alphanum(As),
      { atom_codes(Id, [L|As]) }.	  
	  
	  
	  

/*Ta czesc sprawdza poprawnosc ustawienia tokenow*/

%Zaimplementowana gramatyka

program(Ast) -->
	definicje(Ast).
	
definicje([]) --> [].
definicje([H|T]) --> 
	definicja(H),
	definicje(T).


definicja(Ast) --> 
	[tDef],
	id(Id),
	[tLParen],wzorzec(Wz),
	[tRParen],!,
	[tEq],
	wyrazenie(Wyr),
	{Ast = def(Id,Wz,Wyr)}.
	
wzorzec(Ast) --> [tPod],!,{A = wildcard(no)},wzorzecP(A,Ast).
wzorzec(Ast) --> zmienna(A),wzorzecP(A,Ast).
wzorzec(Ast) --> [tLParen],!,wzorzec(A),[tRParen],wzorzecP(A,Ast).
wzorzecP(Acc,Acc) --> [].
wzorzecP(Ast,Acc) --> 
	[tCom],!,wzorzec(A),
	{N = pair(no,Ast,A)},wzorzecP(N,Acc).
%------------------------------------------
wyrazenie(Ast) -->
	(
	[tIf],!,wyrazenie(A1),[tThen],!,wyrazenie(A2),[tElse],!,wyrazenie(A3),
	{Ast = if(no,A1,A2,A3)};
	[tLet],!,wzorzec(A1),[tEq],wyrazenie(A2),[tIn],!,wyrazenie(A3),
	{Ast = let(no,A1,A2,A3)};
	wyrazenie_op(Ast)
	).
	
wyrazenie_op(Ast) -->
	(
	w_bin1(Ast);
	op_u(O),!,wyrazenie_op(A),
	{Ast = op(no,O,A)};
	/*Warning*/
	wyrazenie_p(Ast)	
	).
	
%Rozszerzenie gramatyki o lacznosc i priorytety

w_bin1(Ast) --> 
	w_bin2(Ast);
	w_bin2(A1),op_1(_),!,w_bin1(A2),
	{Ast = pair(no,A1,A2)}.


w_bin2(Ast) --> 
	w_bin3(Ast);
	w_bin3(A1),op_2(O),w_bin3(A2),!,
	{Ast = op(no,O,A1,A2)}.


w_bin3(Ast) --> 
	w_bin4(Ast);
	w_bin4(A1),op_3(O),w_bin3(A2),!,
	{Ast = op(no,O,A1,A2)}.

w_bin4(Ast) --> w_bin5(A),w4(A,Ast).

w4(Acc,Acc) --> [].
w4(Ast,Acc) --> op_4(O),!,w_bin5(A1),
{W = op(no,O,Ast,A1)},w4(W,Acc).

	
w_bin5(Ast) --> w_bin6(A),w5(A,Ast).

w5(Acc,Acc) --> [].
w5(Ast,Acc) --> op_5(O),!,w_bin6(A1),
{W = op(no,O,Ast,A1)},w5(W,Acc).

w_bin6(Ast) --> 
	op_u(A1),!,wyrazenie_p(A2),
	{Ast = op(no,A1,A2)};
	wyrazenie_p(Ast).
	
op_5(O) --> 
	[tAnd],!,{O = '&'};
	[tMult],!,{O = '*'};
	[tDiv],!,{O = '/'};
	[tMod],{O = '%'}.
	
op_4(O) --> 
	[tOr],!,{O = '|'};
	[tPow],!,{O = '^'};
	[tAdd],!,{O = '+'};
	[tSub],{O = '-'}.
	
op_3(O) --> 
	[tMonk],{O = '@'}.

op_2(O) --> 
	[tM],!,{O = '<'};
	[tMR],!,{O = '<='};
	[tW],!,{O = '>'};
	[tWR],!,{O = '>='};
	[tNot],!,{O = '<>'};
	[tEq],{O = '='}.
	
op_1(',') --> [tCom].

op_u('-') --> [tSub].
op_u('#') --> [tHash].
op_u('~') --> [tNeg].
%---------------------------------------------------------------
wyrazenie_p(Ast) --> [tLParen],wyrazenie(A),[tRParen],wyrazenie_pP(A,Ast).
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
%---------------------------------------------------------------
wyrazenie_atom(Ast) -->
	zmienna(Ast);
	invoke(Ast);
	[tokNumber(X)],!,
	{Ast = num(no,X)};
	pusty_wektor(Ast),!;
	bit(A),{Ast = bit(no,A)}.
	
zmienna(Ast) -->
	id(A),{Ast = var(no,A)}.

invoke(Ast) -->
	id(A1),[tLParen],wyrazenie(A2),[tRParen],
	{Ast = call(no,A1,A2)}.
	
pusty_wektor(empty(no)) --> [tLSquare],[tRSquare].

bit(Ast) --> 
	[tLSquare],wyrazenie(A),[tRSquare],
	{Ast = bit(no,A)}.
	
id(Id) --> 
	[tokVar(Id)].
	