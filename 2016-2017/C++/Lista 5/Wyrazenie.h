#pragma once
#include <string>
#include <math.h>
#include <vector>
using namespace std;

/*-------------------Start---------------------*/
//Klasa abstrakcyjna
class Wyrazenie
{
public:
	virtual double oblicz() = 0;
	virtual string opisz() = 0;
	int getP();
	bool getL();
protected:
	//im mniejsz wartosc tym wiêkszy priorytet
	int priorytet = 0;
	//false - w prawo|true - w lewo
	bool lacznosc = 0;
};
//Klasy
class Liczba : public Wyrazenie
{
public:
	Liczba(double val);
	virtual double oblicz();
	virtual string opisz();
private:
	double value;
};

class Zmienna : public Wyrazenie
{
public:
	Zmienna(string s);
	virtual double oblicz();
	virtual string opisz();
	static void setVarVal(string var, double val);
	static void removeVar(string var);
private:
	string var;
	static vector<pair<string, double>> pairs;
};
/*-------------------Sta³e---------------------*/
//Klasa abstrakcyjna
class Stala : public Wyrazenie
{
protected:
	double value;
};
//Klasy
class PI : public Stala
{
public:
	PI();
	virtual double oblicz();
	virtual string opisz();
};

class E : public Stala
{
public:
	E();
	virtual double oblicz();
	virtual string opisz();
};

class Fi : public Stala {
public:
	Fi();
	virtual double oblicz();
	virtual string opisz();
};
/*--------------------Operatory---------------------*/
//Klasy abstrakcyjne
class UnarnyOp : public Wyrazenie
{
public:
	UnarnyOp(Wyrazenie *);
	~UnarnyOp();
protected:
	Wyrazenie *w1;
};

class BinarnyOp : public UnarnyOp
{
public:
	BinarnyOp(Wyrazenie *, Wyrazenie *);
	~BinarnyOp();
	virtual string opisz();
	virtual string op(string, string) = 0;
protected:
	Wyrazenie *w2;
};
//Klasy : UnarnyOp
class Sin : public UnarnyOp
{
public:
	Sin(Wyrazenie *);
	virtual double oblicz();
	virtual string opisz();
};

class Cos : public UnarnyOp
{
public:
	Cos(Wyrazenie *);
	virtual double oblicz();
	virtual string opisz();
};

class Exp : public UnarnyOp
{
public:
	Exp(Wyrazenie *);
	virtual double oblicz();
	virtual string opisz();
};

class Ln : public UnarnyOp
{
public:
	Ln(Wyrazenie *);
	virtual double oblicz();
	virtual string opisz();
};

class Abs : public UnarnyOp
{
public:
	Abs(Wyrazenie *);
	virtual double oblicz();
	virtual string opisz();
};

class Przeciwna : public UnarnyOp
{
public:
	Przeciwna(Wyrazenie *);
	virtual double oblicz();
	virtual string opisz();
};

class Odwrotna : public UnarnyOp
{
public:
	Odwrotna(Wyrazenie *w);
	virtual double oblicz();
	virtual string opisz();
};
//Klasy : BinarnyOp
class Dodaj : public BinarnyOp
{
public:
	Dodaj(Wyrazenie *, Wyrazenie *);
	virtual double oblicz();
	virtual string op(string l, string r);
};

class Odejmij : public BinarnyOp
{
public:
	Odejmij(Wyrazenie *, Wyrazenie *);
	virtual double oblicz();
	virtual string op(string l, string r);
};

class Logarytm : public BinarnyOp
{
public:
	Logarytm(Wyrazenie *, Wyrazenie *);
	virtual double oblicz();
	virtual string op(string l, string r);
};

class Modulo : public BinarnyOp
{
public:
	Modulo(Wyrazenie *, Wyrazenie *);
	virtual double oblicz();
	virtual string op(string l, string r);
};

class Mnoz : public BinarnyOp
{
public:
	Mnoz(Wyrazenie *, Wyrazenie *);
	virtual double oblicz();
	virtual string op(string l, string r);
};

class Dziel : public BinarnyOp
{
public:
	Dziel(Wyrazenie *, Wyrazenie *);
	virtual double oblicz();
	virtual string op(string l, string r);
};

class Potega : public BinarnyOp
{
public:
	Potega(Wyrazenie *, Wyrazenie *);
	virtual double oblicz();
	virtual string op(string l, string r);
};