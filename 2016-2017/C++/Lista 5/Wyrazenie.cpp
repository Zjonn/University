#include "stdafx.h"
#include "Wyrazenie.h"
//-------------------------------------------------------
//Wyrazenie
//-------------------------------------------------------
int Wyrazenie::getP()
{
	return priorytet;
}
bool Wyrazenie::getL()
{
	return lacznosc;
}
//-------------------------------------------------------
Liczba::Liczba(double val)
{
	value = val;
}

double Liczba::oblicz() {
	return value;
}

string Liczba::opisz()
{
	string str = to_string(value);
	return str.erase(str.find_last_not_of('0') + 2, string::npos);
}

vector<pair<string, double>> Zmienna::pairs;

Zmienna::Zmienna(string s)
{
	var = s;
}

double Zmienna::oblicz() {
	for (size_t i = 0; i < pairs.size(); i++) {
		if (pairs.at(i).first == var)
			return pairs.at(i).second;
	}
	throw string("Zmienna " + var + " nie posiada przypisanej wartoœci!");
}

string Zmienna::opisz()
{
	return var;
}
void Zmienna::setVarVal(string var, double val)
{
	for (size_t i = 0; i < pairs.size(); i++) {
		if (pairs.at(i).first == var) { pairs.at(i) = make_pair(var, val); return; };
	}
	pairs.insert(pairs.begin(), make_pair(var, val));
}
void Zmienna::removeVar(string var)
{
	size_t i = 0;
	for (; i < pairs.size(); i++) {
		if (pairs.at(i).first == var)break;
	}
	pairs.erase(pairs.begin() + i);
}
//-------------------------------------------------------
//Stala
//-------------------------------------------------------
PI::PI() {
	value = 3.14159265359;
}
double PI::oblicz()
{
	return value;
}

string PI::opisz()
{
	return "pi";
}
//-------------------------------------------------------
E::E() {
	value = 2.71828182846;
}
double E::oblicz()
{
	return value;
}

string E::opisz()
{
	return "e";
}
//-------------------------------------------------------
Fi::Fi() {
	value = 1.618033988749894850;
}
double Fi::oblicz()
{
	return value;
}

string Fi::opisz()
{
	return "fi";
}
//-------------------------------------------------------
//UnarnyOp
//-------------------------------------------------------
UnarnyOp::UnarnyOp(Wyrazenie * wr1)
{
	w1 = wr1;
}
UnarnyOp::~UnarnyOp()
{
	delete(w1);
}
//-------------------------------------------------------
Sin::Sin(Wyrazenie * w) : UnarnyOp(w)
{
}

double Sin::oblicz()
{
	return sin(w1->oblicz());
}

string Sin::opisz()
{
	return "sin(" + w1->opisz() + ")";
}
//-------------------------------------------------------
Cos::Cos(Wyrazenie * w) : UnarnyOp(w)
{
}

double Cos::oblicz()
{
	return cos(w1->oblicz());
}

string Cos::opisz()
{
	return "cos(" + w1->opisz() + ")";
}
//-------------------------------------------------------
Exp::Exp(Wyrazenie * w) : UnarnyOp(w)
{
}

double Exp::oblicz()
{
	return exp(w1->oblicz());
}

string Exp::opisz()
{
	return "exp(" + w1->opisz() + ")";
}
//-------------------------------------------------------
Ln::Ln(Wyrazenie * w) : UnarnyOp(w)
{
}

double Ln::oblicz()
{
	return log(w1->oblicz());
}

string Ln::opisz()
{
	return "ln(" + w1->opisz() + ")";
}
//-------------------------------------------------------
Abs::Abs(Wyrazenie * w) : UnarnyOp(w)
{
}

double Abs::oblicz()
{
	return abs(w1->oblicz());
}

string Abs::opisz()
{
	return "|" + w1->opisz() + "|";
}
//-------------------------------------------------------
Przeciwna::Przeciwna(Wyrazenie * w) : UnarnyOp(w)
{
}

double Przeciwna::oblicz()
{
	return -1 * w1->oblicz();
}

string Przeciwna::opisz()
{
	return "-(" + w1->opisz() + ")";
}
//-------------------------------------------------------
Odwrotna::Odwrotna(Wyrazenie * w) : UnarnyOp(w)
{
}

double Odwrotna::oblicz()
{
	return 1 / w1->oblicz();
}

string Odwrotna::opisz()
{
	return "1/(" + w1->opisz() + ")";
}
//-------------------------------------------------------
//BinarnyOp
//-------------------------------------------------------
BinarnyOp::BinarnyOp(Wyrazenie * wr1, Wyrazenie * wr2) : UnarnyOp(wr1)
{
	w2 = wr2;
}
BinarnyOp::~BinarnyOp()
{
	delete(w2);
}
string BinarnyOp::opisz()
{
	string l, r;
	if (((priorytet < w1->getP() && w1->getP() > 0) || (priorytet == w1->getP() && w1->getL())) && priorytet != 0) {
		l = "(" + w1->opisz() + ")";
	}
	else l = w1->opisz();

	if (((priorytet < w2->getP() && w2->getP() > 0) || (priorytet == w2->getP() && !w2->getL())) && priorytet != 0) {
		r = "(" + w2->opisz() + ")";
	}
	else r = w2->opisz();
	return op(l, r);
}
//-------------------------------------------------------
Dodaj::Dodaj(Wyrazenie * wr1, Wyrazenie * wr2) : BinarnyOp(wr1, wr2)
{
	priorytet = 4;
}

double Dodaj::oblicz()
{
	return w1->oblicz() + w2->oblicz();
}

string Dodaj::op(string l, string r)
{
	return l + "+" + r;
}
//-------------------------------------------------------
Odejmij::Odejmij(Wyrazenie * wr1, Wyrazenie * wr2) : BinarnyOp(wr1, wr2)
{
	priorytet = 4;
}

double Odejmij::oblicz()
{
	return w1->oblicz() - w2->oblicz();
}

string Odejmij::op(string l, string r)
{
	return l + "-" + r;
}
//-------------------------------------------------------
Mnoz::Mnoz(Wyrazenie * wr1, Wyrazenie * wr2) : BinarnyOp(wr1, wr2)
{
	priorytet = 3;
}

double Mnoz::oblicz()
{
	return w1->oblicz() * w2->oblicz();
}

string Mnoz::op(string l, string r)
{
	return l + "*" + r;
}
//-------------------------------------------------------
Dziel::Dziel(Wyrazenie * wr1, Wyrazenie * wr2) : BinarnyOp(wr1, wr2)
{
	priorytet = 3;
}

double Dziel::oblicz()
{
	return w1->oblicz() / w2->oblicz();
}

string Dziel::op(string l, string r)
{
	return l + "/" + r;
}
//-------------------------------------------------------
Potega::Potega(Wyrazenie * wr1, Wyrazenie * wr2) : BinarnyOp(wr1, wr2)
{
	priorytet = 5;
	lacznosc = true;
}

double Potega::oblicz()
{
	return pow(w1->oblicz(), w2->oblicz());
}

string Potega::op(string l, string r)
{
	return l + "^" + r;
}
//-------------------------------------------------------
Modulo::Modulo(Wyrazenie * wr1, Wyrazenie * wr2) : BinarnyOp(wr1, wr2)
{
	priorytet = 3;
}

double Modulo::oblicz()
{
	return (int)w1->oblicz() % (int)w2->oblicz();
}

string Modulo::op(string l, string r)
{
	return l + "%" + r;
}
//-------------------------------------------------------
Logarytm::Logarytm(Wyrazenie * wr1, Wyrazenie * wr2) : BinarnyOp(wr1, wr2)
{
}

double Logarytm::oblicz()
{
	return log10(w1->oblicz()) / log10(w2->oblicz());
}

string Logarytm::op(string l, string r)
{
	return "log(" + l + ")(" + r + ")";
}
//-------------------------------------------------------