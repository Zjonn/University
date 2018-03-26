droga(wroclaw,warszawa).
droga(wroclaw,krakow).
droga(wroclaw,szczecin).
droga(szczecin,lublin).
droga(szczecin,gniezno).
droga(warszawa,katowice).
droga(gniezno,gliwice).
droga(lublin,gliwice).

connection/2.
connection(X,Y):- droga(X,Y);droga(X,A),connection(A,Y).