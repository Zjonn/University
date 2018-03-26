// Wyrazenia.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "Wyrazenie.h"
#include <iostream>
using namespace std;

void print(Wyrazenie *);

int main()
{
	Wyrazenie *w1 = new Odejmij(
		new PI(),
		new Mnoz(
			new Dodaj(
				new Liczba(2),
				new Liczba(7)
			),
			new Mnoz(
				new Zmienna("x"),
				new Liczba(7)
			)
		)
	);
	Zmienna::setVarVal("x", 10);
	Wyrazenie *w2 = new Odejmij(
		new PI(),
		new Logarytm(
			new Modulo(
				new Liczba(5),
				new Liczba(3)
			),
			new Liczba(3)
			)
	);
	Wyrazenie *w3 = new Modulo(
		new Fi(),
		new Liczba(2)
	);

	print(w1);
	print(w2);
	print(w3);
}

void print(Wyrazenie *w) {
	cout << w->opisz() << " = " << w->oblicz() << endl;
}