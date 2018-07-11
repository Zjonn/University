
﻿Zadanie 1. Czy poniższe wyrażenia zawsze obliczą się do prawdy dla dwóch dowolnych wartości zmiennych
«x» i «y» typu «int32_t»? Jeśli nie to podaj wartości, które prowadzą do obliczenia fałszu.

    (x > 0) || (x - 1 < 0)
        INT_MIN - 1 false

    (x & 7) != 7 || (x << 29 < 0)
        7 = 111
        zawsze

    (x * x) >= 0
        ~INT_MAX*2

    x < 0 || -x <= 0
        zawsze

    x > 0 || -x >= 0
        INT_MIN - undef

    (x | -x) >> 31 == -1
        0

    x + y == (uint32_t)y + (uint32_t)x
        raczej zawsze

    x * ~y + (uint32_t)y * (uint32_t)x == -x
        idk

Zadanie 2. Napisz ciąg instrukcji, który bez użycia dodatkowych zmiennych, zamieni miejscami zawartość
zmiennych «x» i «y».

    x += y
    y = x - y
    x = x - y

    4 7
    11 7
    11 4
    7 4

    110 111
    001 111
    001 110
    111 110

Zadanie 3. Napisz wyrażenie zawierające wyłącznie zmienne «x», «y» i «s», którego wartością logiczną
jest odpowiedź na pytanie czy wykonanie instrukcji «s = x + y» spowodowało nadmiar (ang. overflow)
lub niedomiar (ang. underflow).
    niedomiar - nie występuje dla liczb całkowitych
    
    s = (x & (1<<32))
    (((x & y & ~s) | (~x & ~y & s))>>31) & 1

Zadanie 4. Zmienne «x» i «y» przechowują liczby typu «uint32_t» składające się z czterech bajtów...
    add:
        s = (x & 7F7F7F) + (y & 7F7F7F)
        s = (x ^ y) & 808080 ^ s
    sub:
        s = (x | 808080) - (y & 7F7F7F)
        s = ~((x ^ y) | 7F7F7F) ^ s) 

    11111111 11111111
    01111111 01111111
    11111110
    00000000 ^ 11111110 = 11111110
    
    

     00000000 11111111
     10000000 01111111
     11111111 ^ 01111111 = 10000000
    ~10000000 = 01111111

Zadanie 5. Uzupełnij ciało funkcji zadeklarowanej następująco:
/* Oblicz x * 3 / 4 zaokrąglając w dół. */
int32_t threefourths(int32_t x);

#define MULT(x)(((x) << 1) + (x))
x = MULT(x>>2) + (MULT(x & 3) >> 2)

Zadanie 6. Podaj wyrażenie zawierające wyłącznie zmienne «x» i «y», którego wartością logiczną jest wynik
porównania «x < y» dla liczb (a) bez znaku (b) ze znakiem.

    (a)
    ~x & y
    ((x<<1) & (y<<1)) - (~x & y & 1)

Zadanie 7. Podaj fragment kodu, który oblicza funkcję:
abs(x) = (~(x>>31) & x) + ((x>>31) & -x)


Zadanie 8. Podaj fragment kodu, który oblicza funkcję:
sign(x) = (X != 0) & (X>>31) 

Zadanie 9. Uzupełnij ciało funkcji zadeklarowanej poniżej.
/* Kiedy x zawiera nieparzystą liczbę jedynek zwróć 1, w p.p. 0 */
int32_t odd_ones(uint32_t x);
    x = (x & 0xAAAAAAAA) >> 1 + (x & 0x55555555)
    x = (x & 0xCCCCCCCC) >> 1 + (x & 0x33333333)
    x = (x & 0xF0F0F0F0) >> 1 + (x & 0x0F0F0F0F)
    x = (x & 0xFF00FF00) >> 1 + (x & 0x00FF00FF)
    x = (x & 0xFFFF0000) >> 1 + (x & 0x0000FFFF)
    return x & 1;

