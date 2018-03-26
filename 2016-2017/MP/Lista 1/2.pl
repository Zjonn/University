
mily(X):- ludzie(X), odwiedzaZoo(X).
styka(X,Y):- zwierze(X), mieszkaWZoo(X) ,odwiedzaZoo(Y), ludzie(Y).
szczesliwe(X):- zwierze(X), styka(X,_), mily(Y).
nieSmok(X):- mieszkaWZoo(X), szczesliwy(X).

zwierze(X):- smok(X).
odwiedzaZoo(a).
czlowiek(a).

mieszkaWZoo(X):- nieSmok(X).


