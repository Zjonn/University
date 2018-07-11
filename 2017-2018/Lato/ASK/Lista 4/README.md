## 1 zad
#### Poniżej podano wartości typu long leżące pod wskazanymi adresami i w rejestrach: 
``` 
Adres Wartość  Rejestr Wartość
0x100 0xFF   | %rax     0x100
0x108 0xAB   | %rcx     1
0x110 0x13   | %rdx     3
0x118 0x11   |
```
#### Oblicz wartość poniższych operandów:

1. %rax<br>
`0x100`
2. 0x110<br>
`0xFF`
3. $0x108<br>
`0x108`
4. (%rax)<br>
`[ox100] = 0xFF`
5. 8(%rax)<br>
`[0x100 + 8] = 0xAB`
6. 21(%rax,%rdx)<br>
`21 = 0x15`<br>
`[0x118] = 0x11`
7. 0xFC(,%rcx,4)<br>
`[0xFC + 1 * 4] = [0x110] = 0x13`
8. (%rax,%rdx,8)<br>
`[0x100 + 3 * 8] = [0x100 + 0x18] = 0x11`
9. 265(%rcx,%rdx,2)<br>
`[265 + 1 + 3 * 2] = [0x109 + 0x7] = [0x110] = 0x13`

## 2 zad
#### Każdą z poniższych instrukcji wykonujemy w stanie maszyny opisanym tabelką z zadania 1. Wskaż miejsce, w którym zostanie umieszczony wynik działania instrukcji, oraz obliczoną wartość.

```
addq  Src,Dest      Dest = Dest +  Src
subq  Src,Dest      Dest = Dest -  Src
imulq Src,Dest      Dest = Dest *  Src
salq  Src,Dest      Dest = Dest << Src | shlq
sarq  Src,Dest      Dest = Dest >> Src Arithmetc
shrq  Src,Dest      Dest = Dest >> Src Logical
xorq  Src,Dest      Dest = Dest ^  Src
andq  Src,Dest      Dest = Dest &  Src
orq   Src,Dest      Dest = Dest |  Src
```
`adres; wynik`
1. addq %rcx,(%rax)<br>
`0x100; 0x100`
2. subq 16(%rax),%rdx<br>
`%rdx; [0x110] + 3 = 0x16`
3. shrq $4,%rax<br>
`%rax; 0x100 >> 4 = 0x0`
4. incq 16(%rax)<br>
`0x100 + 0x10 = 0x110; [0x110]++ = 0x14`
5. decq %rcx<br>
`%rcx; 1-- = 0`
6. imulq 8(%rax)<br>
`%rac L; 0x100 * 0xAB = 0xAB00`
```
 IA32 also provides two different “one-operand” multiply instructions
to compute the full 64-bit product of two 32-bit values—one for unsigned (mull), and one for two’s-complement (imull) multiplication. For both of these, one argument must be in register %eax, and the other is given as the instruction source operand. The product is then stored in registers %edx (high-order 32 bits)
and %eax (low-order 32 bits).
```

7. leaq 7(%rcx,%rcx,8),%rdx<br>
` leaq add, destination`<br>
`%rdx; 7 + 1 + 1 * 8 = 0x10` 
8. leaq OxA(,%rdx,4),%rdx<br>
`%rdx; 0xA + 3 * 4 = 0x17`

## 3 zad
#### Zaimplementuj w asemblerze x86-64 funkcję konwertującą liczbę typu «uint32_t» między formatem little-endian i big-endian. Argument funkcji jest przekazany w rejestrze %edi, a wynik zwracany w rejestrze %eax. Należy użyć instrukcji cyklicznego przesunięcia bitowego ror lub rol. Podaj wyrażenie w języku C, które kompilator optymalizujący przetłumaczy do instrukcji ror lub rol.
```assembly
f_rol:
  rorw  $8, %dx
  rorl  $16, %edx
  rorw  $8, %dx
  movl  %edx, %eax
  ret
```

```C
uint32_t rotl32 (uint32_t value, unsigned int count) {
    const unsigned int mask = CHAR_BIT*sizeof(value) - 1;
    count &= mask;
    return (value << count) | (value >> (-count & mask));
}

uint32_t rotl32 (uint32_t value, unsigned int count) {
    return value<<count | value>>(32-count);
}
```

## 4 zad
#### Zaimplementuj w asemblerze x86-64 funkcję liczącą wyrażenie «x + y». Argumenty i wynik funkcji są 128-bitowymi liczbami całkowitymi ze znakiem i nie mieszczą się w rejestrach maszynowych. Zatem «x» jest przekazywany przez rejestry %rdi (starsze 64 bity) i %rsi (młodsze 64 bity), analogicznie argument «y» jest przekazywany przez %rdx i %rcx, a wynik jest zwracany w rejestrach %rdx i %rax. Należy użyć instrukcji set! Jak uprościłby się kod, gdyby można było użyć instrukcji adc?
```assembly
add128:
  addq %rsi %rcx
  mov %rcx %rac
  set %r5
  addq %r5 %rdx
  addq %rdi %drx
  ret
```
używając adc (`addq source, dest <=> dest = dest + source`)
```assembly
add128:
  addq %rsi %rcx
  mov %rcx %rac
  adc %rdi %rdx
  ret
```

## 5 zad
#### Zaimplementuj w asemblerze x86-64 funkcję liczącą wyrażenie «x * y». Argumenty i wynik funkcji są 128-bitowymi liczbami całkowitymi bez znaku. Argumenty i wynik są przypisane do tych samych rejestrów co w poprzednim zadaniu. Instrukcja mul wykonuje co najwyżej mnożenie dwóch 64-bitowych liczb i zwraca 128-bitowy wynik. Wiedząc, że n = ... , zaprezentuj metodę obliczenia iloczynu, a dopiero potem przetłumacz algorytm na asembler.
`RDX:RAX`
```assembly
mul128:
  mov %rdx, %r5
  mov %rdi, %rax
  mul %rcx
  mov %rdx, %r6
  mov %rax, %r7

  mov %r5, %rax
  mul %rsi
  addq %rax,%r7

  mov %rcx, %rax
  mul %rsi

  addq %r7, %rdx
  ret
```

## 6 zad
#### Zaimplementuj poniższą funkcję w asemblerze x86-64, przy czym wartości «x» i «y» typu «uint64_t» są przekazywane przez rejestry %rdi i %rsi, a wynik zwracany w rejestrze %rax. Jak uprościłby się kod, gdyby można było użyć instrukcji cmov?

```assembly
addu:
  addq %rdi %rsi
  set %r5

  mov %rsi, %rax
  mul %r5
  mov %rax %rdi

  mov %r5
  mul $MAX_LONG
  addq %rdi,%rax
  ret
```
```assembly
addu:
  addq %rdi %rsi
  mov %rsi %rax

  movabsq $INT_LONG %rdi
  cmovo %rdi %rax
  ret
```

## 7 zad
#### W wyniku deasemblacji procedury «long decode(long x, long y)» otrzymano kod:
```assembly
decode: 
  leaq (%rdi,%rsi), %rax
  xorq %rax, %rdi
  xorq %rax, %rsi
  movq %rdi, %rax
  andq %rsi, %rax
  shrq $63, %rax
  ret
```
#### Zgodnie z System V ABI3 dla architektury x86-64, argumenty «x» i «y» są przekazywane odpowiednio przez rejestry %rdi i %rsi, a wynik zwracany w rejestrze %rax. Napisz funkcję w języku C, która będzie liczyła dokładnie to samo co powyższy kod w asemblerze. Postaraj się, aby była ona jak najbardziej zwięzła.

```C
long decode(long n, long m)
{
  long x = n + m;
  x = ((n ^ x) & (m ^ x)) >> 63;
  return x; 
}
```

## 8 zad
#### Zapisz w języku C funkcję o sygnaturze «int puzzle(long x, unsigned n)», której kod w asemblerze podano niżej. Przedstaw jednym zdaniem co ta procedura robi.
```assembly
puzzle: 
        testl %esi, %esi
        je .L4
        xorl %edx, %edx
        xorl %eax, %eax
  .L3:  movl %edi, %ecx
        andl $1, %ecx
        addl %ecx, %eax
        sarq %rdi
        incl %edx
        cmpl %edx, %esi
        jne .L3
        ret
  .L4: movl %esi, %eax
        ret

```
##### UWAGA! Wszystkie instrukcje operujące na dolnej połowie 64-bitowego rejestru czyszczą jego górną połowę. Można o tym przeczytać w §3.4.1.1 dokumentacji z nagłówka listy.
```C
int puzzle(long x, unsigned n)
{
  if(n==0)
    return 0;
  if(n>32)
    n==32;
  int y = 0;
  for(int i = 0;i<n;i++)
  {
    y = y + x & 1;
    x>>1;
  }
}
```



