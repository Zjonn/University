<a name = "start"></a>
* [Zad 1](#z1)
* [Zad 2](#z2)
* [Zad 3](#z3)
* [Zad 4](#z4)
* [Zad 5](#z5)
* [Zad 6](#z6)
* [Zad 7](#z7)
* [Zad 8](#z8)

## <a name = "z1"></a> Zadanie 1.[⇧](#start)[⇩](#z2)
#### 111

## <a name = "z2"></a>Zadanie 2. [⇧](#z1)[⇩](#z3)[⇮](#start)
#### 222

## <a name = "z3"></a>Zadanie 3.[⇧](#z2)[⇩](#z4)[⇮](#start)
#### 333
## <a name = "z4"></a>Zadanie 4. [⇧](#z3)[⇩](#z5)[⇮](#start)
#### 44

## <a name = "z5"></a>Zadanie 5. [⇧](#z4)[⇩](#z6)[⇮](#start)
#### Przeczytaj definicje struktur «SA» i «SB», po czym przeanalizuj kod procedur o sygnaturach «SB eval(SA s)» i «long wrap(long x, long y, long z)». Nastepnie zapisz w języku C kod odpowiadający procedurom «eval» i «wrap». Narysuj diagram przedstawiający zawartość rekordu aktywacji procedury «wrap» w momencie wywołania funkcji «eval».
```C
1     typedef struct A {
2           long u[2];
3           long *v;
4     } SA;
5     
6     typedef struct B {
7           long p[2];
8           long q;
9     } SB;

```
```assembly
10    eval:
11          movq %rdi, %rax
12          movq 16(%rsp), %rcx     u[1]
13          movq 24(%rsp), %rdx     v
14          movq (%rdx), %rsi       *v
15          movq %rcx, %rdx
16          imulq %rsi, %rdx        *v * u[1]
17          movq %rdx, (%rdi)       sb.p[0]
18          movq 8(%rsp), %rdx      sb.p[0]
19          movq %rdx, %rdi         
20          subq %rsi, %rdi         u[0]-*v
21          movq %rdi, 8(%rax)      sb.p[1]
22          subq %rcx, %rdx         u[0]-u[1]
23          movq %rdx, 16(%rax)     q
24          ret
```
```C
SB eval(SA s){
      SB s1 = {.p = {*s.v * s.u[1], s.u[0] - *s.v},
             .q = s.u[0] - s.u[1]};
      return s1;
}
```
```assembly
25    wrap:
26          subq $72, %rsp          rezerwacja miejsca
27          movq %rdx, (%rsp)       zapamiętujemy 'z'
28          movq %rsp, %rdx         n&z
29          leaq 8(%rsp), %rax      rax = rsp + 8
30          pushq %rdx              wskaźnik
31          pushq %rsi              y
32          pushq %rdi              x
33          movq %rax, %rdi         miejsce na zwróconą wartość
34          call eval
35          movq 40(%rsp), %rax     rax = sb.p[1]
36          addq 32(%rsp), %rax     rax += sb.p[0]
37          imulq 48(%rsp), %rax    rax *= sb.q
38          addq $96, %rsp
39          ret
```
```C
long wrap(long x, long y, long z){
      SA s = {.p{x, y}, z};
      SB b = eval(s);
      return (b.p[1] + b.p[0]) * b.q;
}
```
#### Rekod aktywacji
```
Size 96
┏━━━━┓
┃    ┃
┃free┃
┃spc ┃
┃    ┃
┃━━━━┃
┃str ┃
┃SB  ┃
┃━━━━┃<-rdi
┃ z  ┃
┃ &z ┃
┃ y  ┃
┃ x  ┃
┗━━━━┛
```


## <a name = "z6"></a>Zadanie 6. [⇧](#z5)[⇩](#z7)[⇮](#start)
#### 66
## <a name = "z7"></a>Zadanie 7. [⇧](#z6) [⇮](#start)
