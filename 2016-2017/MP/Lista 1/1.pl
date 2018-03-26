
czyPtak(_) :- fail.
czyDzdzownica(_) :- fail.
czyRyba(_) :- fail.

czyKot(my_cat).

lubi(X,Y):- czyPtak(X),czyDzdzownica(Y).

lubi(X,Y):- czyKot(X),czyRyba(Y).

lubi(X,Y):- przyjaciele(X,Y);przyjaciele(Y,X).

przyjaciele(my_cat,me).
jada(my_cat,Y) :- lubi(my_cat,Y).




