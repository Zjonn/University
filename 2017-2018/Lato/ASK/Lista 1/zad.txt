///////////////////////////////////////
4zad
///////////////////////////////////////
restrict - mówimy kompilatorowi, że na czas życia naszego
wskaźnika tylko on będzie wskazywał dane miejsce w pamięci.

volatile - zmienna może zostać zmodyfikowana poza działającym
programem, np.:
-przez przerwanie
-rejestr urządzeń IO

static - kontroluje czas żcia zmiennej i jej widoczność.
        globalna - spawia, że zmienna jest widoczna tylko w tym pliku
        lokalna - żyje do końca programu
        procedura - widoczna tylko w pliku
///////////////////////////////////////
5zad
///////////////////////////////////////

s += b[j+1] + b[--j];

t1 := j+1void bar(void) {
    foo = 0;

    while (foo != 255)
         ;
}
t2 := t1 * 4
t3 := b[t2]
j  := j-1
t5 := j*4
t6 := b[t5]
t7 := t3 + t6 
s := s + 7

/////////////////////////////////////

a[i++] -= b * (c[j*2] + 1);
a[i++] = a[i++] - b * (c[j*2] + 1);

t7:= i * 4
i := i+1
t8 := a[t7]

t1 := j*2
t2 := t1 * 4
t3 := c[t2]
t4 := t3 + 1
t5 := b*t4
t9 := t8 - t5

t11 = i * 4
i := i+1
a[t11] = t9

///////////////////////////////////////
6zad
///////////////////////////////////////

vs->d = us[1].a + us[j].c;
(*vs).d = (*us + 1).a + (*us + j).c
*(vs + 0) = *(us + 12 * 1 + 0) + *(us + 12*j + 8)

t1 := us + 12
t2 := *t1
t3 := 12 * j
t4 := us + t3 + 8
t5 := *t4
t6 := t2 + t4
*vs = t6 

///////////////////////////////////////
7zad
///////////////////////////////////////

        i := 0                   ; <<B1>>
        goto ITest              

ILoop:  j := i                   ; <<B2>>
        goto JTest

JLoop:  t1      := j * 4         ; <<B3>>
        temp    := arr[t1]
        t3      := j - 1
        t4      := t3 * 4
        t5      := arr[t4]
        arr[t1] := t5;
        arr[t4] := temp
        j       := j - 1

JTest:  if j > 0 goto JTest&     ; <<B4>>
        goto IPlus               ; <<B5>>
JTest&: a1 := j * 4              ; <<B6>>
        a2 := j - 1
        a3 := a2 * 4
        v4 := arr[a1]
        v5 := arr[a3]
        if v4 < v5 goto JLoop

IPlus:  i := i + 1               ; <<B7>>
ITest:  if i < length goto ILoop ; <<B8>>