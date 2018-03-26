## 1 zad


## 2 zad

#### *Standard IEEE 754-2008 definiuje liczby zmiennopozycyjne o szerokości 16-bitów. Zapisz ciąg bitów reprezentujący liczbę 1.5625 · 10−1 . Porównaj zakres liczbowy i dokładność w stosunku do liczb zmiennopozycyjnych pojedynczej precyzji (float).*
---
1.5625 · 10^−1 = 0.15625<br>
7c = 2^8 - 127 -> <-127,128><br>
s 8c 23m<br>
0 00000000 00100000000000000000000<br>
0 00000010 00000000000000000000000<br>
1111111<br>
0       01...
## 3 zad
## 4 zad
#### *Załóżmy, że zmienne x, f i d są odpowiednio typów int, float i double. Ich wartości są dowolne, ale f i d nie mogą równać się +∞, −∞ lub NaN. Czy każde z poniższych wyrażeń zostanie obliczone do prawdy? Jeśli nie to podaj wartości zmiennych, dla których wyrażenie zostanie obliczone do fałszu.*

1. x == (int32_t)(double) x<br>
`int < double`
2. x == (int32_t)(float) x<br>
`~ INT_MAX`
3. d == (double)(float) d<br>
`~ DOUBLE_MAX`
4. f == (float)(double) f<br>
`zawsze`
5. f == -(-f)<br>
`może jakieś float max`
6. 1.0 / 2 == 1 / 2.0<br>
`to samo`
7. d * d >= 0.0<br>
`idk`
8. (f + d) - f == d<br>
`raczeej zawsze`

## 5 zad

#### *Reprezentacje binarne liczb zmiennoprzecinkowych f i g typu «float» zostały załadowane odpowiednio do zmiennych «x» i «y» typu «uint32_t». Podaj wyrażenie, które:*

1. zmieni znak liczby «x»,<br>
``x = x ^ 1<<31``
2. obliczy wartość |_log2|x| _| typu «int» dla f w postaci znormalizowanej,
3. zwróci wartość logiczną operacji «x == y»,<br>
``~(((x | y) <<1) >>1) & 1 | x == y``
4. zwróci wartość logiczną operacji «x <= y».

##### Pamiętaj, że dla liczb zmiennopozycyjnych w standardzie IEEE 754 zachodzi −0 ≡ +0. Można pominąć rozważanie wartości NaN.

## 6 zad

#### *Reprezentacja binarna liczby zmiennoprzecinkowej f typu «float» została załadowana do zmiennej «x» typu «uint32_t». Podaj algorytm obliczający f · 2 i wykonujący obliczenia na zmiennej «x» używając wyłącznie operacji na liczbach całkowitych. Osobno rozważ i ≥ 0 i i < 0. Zakładamy, że liczba f jest znormalizowana, ale wynik operacji może dać wartość ±∞, ±0 lub liczbę zdenormalizowaną.*

##### *UWAGA! Należy podać algorytm, zatem dozwolona jest cała składnia języka C bez ograniczeń z nagłówka listy zadań. Jednakże należy używać wyłącznie operacji na typie «int32_t».*
---

## 7 zad

#### *Uzupełnij ciało funkcji zadeklarowanej następująco:*
``` 
/* Skonwertuj reprezentację liczby float do wartości int32_t. */
int32_t float2int(int32_t f);
```

*Zaokrąglij liczbę w kierunku zera. Jeśli konwersja spowoduje nadmiar lub f ma wartość NaN, zwróć
0x80000000. Dla czytelności napisz najpierw rozwiązanie z instrukcjami warunkowymi. Potem przepisz je,
by zachować zgodność z wytycznymi z nagłówka listy.*
##### Wskazówka. Postaraj się znaleźć jak najkrótsze rozwiązanie. Wzorcówka ma około 10 linii kodu!
---


## 8 zad
``` 
float FastInvSqrt(float x) {
  float xhalf = 0.5f * x;
  int i = *(int*)&x;         // evil floating point bit level hacking
  i = 0x5f3759df - (i >> 1);  // what the fuck?
  x = *(float*)&i;
  x = x*(1.5f-(xhalf*x*x));
  return x;
} 
```
---
Reprezentacja float i int: <br>
`` m = M/L ``<br>
`` e = E - B``

*For 32-bit floats L is 2^23 and B is 127. Given the values of e and m you calculate the floating-point number’s value like this:*

``(1+m)2^e``<br>
``M + LE``

Zapiszmy sobie nasze równanie:<br>
`y = x^{-1/2}`<br>
`log_2 y = -1/2 * log_2 x`

`log_2(1 + v) ≈ v + 𝝴`

##### more http://h14s.p5r.org/2012/09/0x5f3759df.html