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
#### Zaimplementuj funkcję zdefiniowaną poniżej w asemblerze x86-64. Taka procedura w języku C miałaby sygnaturę «long cmp(uint64_t x, uint64_t y)».
```
            { −1 gdy x < y
cmp(x, y) = { 1 gdy x > y
            { 0 gdy x = y
```

```assembly
cmp:
	cmp %rdi, %rsi 
	sbb %rax, %rax 	; x < y => rax = 1; wpp. rax = 0
	cmp %rsi, %rdi
	adc $0, %rax
	ret
```

## <a name = "z2"></a>Zadanie 2. [⇧](#z1)[⇩](#z3)[⇮](#start)
#### Poniżej zamieszczono kod procedury o sygnaturze «long puzzle2(char *s, char *d)». Wyznacz bloki podstawowe oraz narysuj graf kontroli przepływu. Przetłumacz tę procedurę na język C, a następnie jednym zdaniem powiedz co ona robi.

```assembly
      puzzle2:
      movq %rdi, %rax
.L3:  movb (%rax), %r9b
      leaq 1(%rax), %r8
      movq %rsi, %rdx
.L2:  movb (%rdx), %cl
      incq %rdx
      testb %cl, %cl
      je .L4
      cmpb %cl, %r9b
      jne .L2
      movq %r8, %rax
      jmp .L3
.L4:  subq %rdi, %rax
      ret
```

#### Bloki podstawowe:

```assembly
puzzle2:                  
      movq %rdi, %rax     <<B1>>

.L3:  movb (%rax), %r9b   <<B2>>
      leaq 1(%rax), %r8
      movq %rsi, %rdx

.L2:  movb (%rdx), %cl    <<B3>>
      incq %rdx
      testb %cl, %cl
      je .L4          

      cmpb %cl, %r9b      <<B4>>
      jne .L2     

      movq %r8, %rax      <<B5>>
      jmp .L3       
      
.L4:  subq %rdi, %rax     <<B6>>
      ret
```
#### Graf kontroli przepływu:
```
                        ┏━━━━━┓
                        ↓     ┃
[Start] -> B1 -> B2 -> B3 -> B4 -> B5 -> B6 -> [Stop]
                  ↑     │          ┃     ↑
                  ┃     ┗━━━━━━━━━━╋━━━━━┛
                  ┃                ┃
                  ┃                ┃
                  ┗━━━━━━━━━━━━━━━━┛                                
``` 
#### Kod w c:
```assembly
              rdi,      rsi         -> rax
      puzzle2(char * r, char * d):
      movq %rdi, %rax       rax = r;
.L3:  movb (%rax), %r9b     r9  = *rax;
      leaq 1(%rax), %r8     r8  = r9 + 1;
      movq %rsi, %rdx       rdx = d ;
.L2:  movb (%rdx), %cl      cl  = *rdx;
      incq %rdx             rdx++;

test arg1, arg2 = arg1 & arg2; ustawia ZF(zero), SF(sign) i PF(parity) zależnie od wyniku 
      testb %cl, %cl        cl & cl;   
      je .L4                if(cl == 0) goto L4;

cmp a, b = sub b - a bez apisywania wyniku
      cmpb %cl, %r9b
      jne .L2               if(cl != r9) goto L2;     
      movq %r8, %rax        rax = r8
      jmp .L3               goto L3;
.L4:  subq %rdi, %rax       rax = rax - rdi
      ret
```

```C
long puzzle2(char *r, char * d){
  char * rax = r;
L3.
  char r9 = rax*;
  char r8 = r9 + 1
  char rdx = d
L2.
  char cl = (*rdx)
  rdx++;
  if(cl == 0)
    goto L4;
  if(cl != r9)
    goto L2;
  rax = r8;
  goto L3;
L4.  
  return rax - rdi;
}
```
```C
long puzzle2(char * r, char * d){
  for(char * res = r; true; res++){
    for(char * c = d; *c != *res; c++){
      if(!(*c))
        return res - d;
    }
  }
}
```

`Co robi? Znajduje najdłuższy prefiks pierwszego słowa, który zawiera się w drugim.`

## <a name = "z3"></a>Zadanie 3.[⇧](#z2)[⇩](#z4)[⇮](#start)
#### Poniżej widnieje kod funkcji o sygnaturze «uint32_t puzzle3(uint32_t n, uint32_t d)». Wyznacz bloki podstawowe oraz narysuj graf kontroli przepływu, po czym przetłumacz tę funkcję na język C. Na podstawie ustępu „Mixing C and Assembly Language” strony GNU Assembler Examples1 napisz program, który pomoże Ci powiedzieć co ta funkcja robi.
```assembly
puzzle3:
      movl %edi, %edi
      salq $32, %rsi
      movl $32, %edx
      movl $0x80000000, %ecx
      xorl %eax, %eax
.L3: addq %rdi, %rdi
      movq %rdi, %r8
      subq %rsi, %r8
      js .L2
      orl %ecx, %eax
      movq %r8, %rdi
.L2: shrl %ecx
      decl %edx
      jne .L3
      ret
```
#### Bloki podstawowe:
```assembly
puzzle3:
      movl %edi, %edi           <<B1>>
      salq $32, %rsi
      movl $32, %edx
      movl $0x80000000, %ecx
      xorl %eax, %eax
.L3: addq %rdi, %rdi            <<B2>>
      movq %rdi, %r8
      subq %rsi, %r8            
      js .L2
      orl %ecx, %eax            <<B3>>
      movq %r8, %rdi
.L2: shrl %ecx                  <<B4>>
      decl %edx
      jne .L3                   
      ret                       <<B5>>
```
#### Graf kontroli przepływu:
```
                  ┏━━━━━━━━━━┓
                  ┃          ↓ 
[Start] -> B1 -> B2 -> B3 -> B4 -> B5 -> [Stop]
                  ↑          ┃
                  ┗━━━━━━━━━━┛
```

#### Kod w c:
Najpierw kompilujemy nasz kod i sprawdzamy co robi 😏
```assembly
        rdi        rsi       -> rax:
puzzle3(uint32t n, uint32t d)
      movl %edi, %edi         edi = edi ??       
      salq $32, %rsi          d = (uint64)d<<32
      movl $32, %edx          edx = 32 => iterator pętli
      movl $0x80000000, %ecx  ecx = 0x80000000
      xorl %eax, %eax         eax = 0;
.L3: addq %rdi, %rdi          rdi += rdi = rdi * 2 = rdi << 1
      movq %rdi, %r8          r8 = rdi
      subq %rsi, %r8          r8 -= rsi
      js .L2                  if(r8 > 0) goto L2
      orl %ecx, %eax          eax |= ecx
      movq %r8, %rdi          rdi = r8
.L2: shrl %ecx                ecx >>= 1
      decl %edx               edx--
      jne .L3                 if(i != 0) goto L3
      ret                       
```
```C
uint32_t puzzle3(uint32_t n, uint32_t d) {
  uint64_t long_n, long_d;
  uint32_t result, mask; 

  long_d = (int64_t)d << 32;
  long_n = n; 

  mask = 0x80000000;
  result = 0; 

  for (int i = 32; i! = 0; i--, mask >>= 1) {
    long_n <<= 1;
    if ((int64_t)(long_n - long_d) >= 0) {  
      result |= mask; 
      long_n -= long_d; //long_n - long_d powinno zostać przypisane do n
    }	
  }
  return result;
}
```
`Co to? Restoring division - dzielenie.`

## <a name = "z4"></a>Zadanie 4. [⇧](#z3)[⇩](#z5)[⇮](#start)
#### Poniżej zamieszczono kod rekurencyjnej procedury o sygnaturze «int puzzle4(long *a, long v, uint64_t s, uint64_t e)». Wyznacz bloki podstawowe oraz narysuj graf kontroli przepływu. Przetłumacz tę procedurę na język C, a następnie jednym zdaniem powiedz co ona robi.
```assembly
puzzle4:
      movq %rcx, %rax
      subq %rdx, %rax
      shrq %rax
      addq %rdx, %rax
      cmpq %rdx, %rcx
      jb .L5
      movq (%rdi,%rax,8), %r8
      cmpq %rsi, %r8
      je .L10
      cmpq %rsi, %r8
      jg .L11
      leaq 1(%rax), %rdx
      call puzzle4
.L10: ret
.L11: leaq -1(%rax), %rcx
      call puzzle4
      ret
.L5: movl $-1, %eax
      ret
```
##### Wskazówka: Z reguły procedurę «puzzle4» woła się następująco: «i = puzzle4(a, v, 0, n - 1)»

#### Bloki podstawowe:
```assembly
puzzle4:
      movq %rcx, %rax           <<B1>>
      subq %rdx, %rax
      shrq %rax
      addq %rdx, %rax
      cmpq %rdx, %rcx
      jb .L5    
      movq (%rdi,%rax,8), %r8   <<B2>>
      cmpq %rsi, %r8
      je .L10
      cmpq %rsi, %r8            <<B3>>
      jg .L11
      leaq 1(%rax), %rdx        <<B4>>
      call puzzle4
.L10: ret                       <<B5>>
.L11: leaq -1(%rax), %rcx       <<B6>>
      call puzzle4
      ret
.L5: movl $-1, %eax             <<B7>>
      ret
```

#### Graf kontroli przepływu:
```
                  ┏━━━━━━━━━━━━━━━━┓
                  ┃                ┃
                  ┃     ┏━━━━━━━━━━╋━━━━━┓
                  ┃     ┃          ↓     ↓
[Start] -> B1 -> B2 -> B3 -> B4 -> B5 -> B6 -> B7 -> [Stop]
            ┃                ┃           ┃     ↑       ↑
            ┗━━━━━━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━┛       ┃
                             ┃           ┃             ┃
                             ┣━━━━━━━━━━━┛             ┃
                             ↓                         ┃
                        (Call [Start])  ━━━━━━━━━━━━━━━┛

```         
#### Kod w c:
```assembly
        rdi      rsi     rdx         rcx        -> rax               
puzzle4(long *a, long v, uint64_t s, uint64_t e):
      movq %rcx, %rax           
      subq %rdx, %rax
      shrq %rax
      addq %rdx, %rax           => rcx = ((c - s) / 2) + s
      cmpq %rdx, %rcx         
      jb .L5                    jump below = jeśli mniejsze           
      movq (%rdi,%rax,8), %r8   r8 = rdi + 8 * rax
      cmpq %rsi, %r8
      je .L10                   jump equals r8
      cmpq %rsi, %r8            
      jg .L11                   jump greater
      leaq 1(%rax), %rdx        rdx = rax + 1
      call puzzle4
.L10: ret                       
.L11: leaq -1(%rax), %rcx       rcx = rax - 1
      call puzzle4
      ret
.L5: movl $-1, %eax             eax = -1
      ret
```

```C
puzzle4(*o, v, s, e) {
  int m = ((c - s) / 2) + s 	// m = (e + s) / 2
  if (c < s) 
    return -1
  if (a[m] == v) 
    return m
  else if (a[m] > v)
    return puzzle4(a, v, m + 1, e)
  else
    return puzzle4(a, v, s, m - 1)
}
```
`Co to? Wyszukiwanie binarne.`

## <a name = "z5"></a>Zadanie 5. [⇧](#z4)[⇩](#z6)[⇮](#start) NIE SKOŃCZONE
#### Poniżej widnieje kod procedury o sygnaturze «long puzzle5(void)». Podaj rozmiar i składowe rekordu aktywacji procedury «puzzle5». Jaką sygnaturę ma procedura «readlong»? Przetłumacz procedurę «puzzle5» na język C i wytłumacz jednym zdaniem co ona robi.
```assembly
puzzle5:
    subq $24, %rsp      - rezerwujemy miejsce na stosie
    movq %rsp, %rdi
    call readlong
    leaq 8(%rsp), %rdi
    call readlong
    movq (%rsp), %rax
    cqto
    idivq 8(%rsp)
    xorl %eax, %eax
    testq %rdx, %rdx
    sete %al
    addq $24, %rsp
    ret
```
```
Return adress = 8
Sub           = 24
Wyrównujemy do 16
Więc chyba rozmiar ramki to 32 (chyba)
```
`idiv actually divide 64bit number in edx:eax by a 32bit number specified as an operand. But your edx register contains random number.`

` cqto (convert quad to oct) If you are dealing with signed integers, you also need to sign extend rax to rdx:rax, that means copying the rax sign bit to every bit of rdx and is accomplished with cqo alias cqto`
```
  void readlong(uint64_t)
```

## <a name = "z6"></a>Zadanie 6. [⇧](#z5)[⇩](#z7)[⇮](#start)
#### Poniższy kod w asemblerze otrzymano w wyniku deasemblacji funkcji zadeklarowanej jako «long switch_prob(long x, long n)». Zapisz w języku C kod odpowiadający tej funkcji.


```assembly
400590 <switch_prob>:
400590: 48 83                     subq $0x3c,%rsi
400594: 48 83 fe 05               cmpq $0x5,%rsi
400598: 77 29                     ja *0x4005c3
40059a: ff 24 f5 f8 06 40 00      jmpq *0x4006f8(,%rsi,8)
4005a1: 48 8d 04 fd 00 00 00 00   lea 0x0(,%rdi,8),%rax
4005a9: c3                        retq
4005aa: 48 89 f8                  movq %rdi,%rax
4005ad: 48 c1 f8 03               sarq $0x3,%rax
4005b1:                           c3 retq
4005b2: 48 89 f8                  movq %rdi,%rax
4005b5: 48 c1 e0 04               shlq $0x4,%rax
4005b9: 48 29 f8                  subq %rdi,%rax
4005bc: 48 89 c7                  movq %rax,%rdi
4005bf: 48 0f af ff               imulq %rdi,%rdi
4005c3: 48 8d 47 4b               leaq 0x4b(%rdi),%rax
4005c7: c3                        retq
```
```
Zrzut pamięci przechowującej
tablicę skoków:
(gdb) x/6gx 0x4006f8
0x4006f8: 0x4005a1
0x400700: 0x4005a1
0x400708: 0x4005b2
0x400710: 0x4005c3
0x400718: 0x4005aa
0x400720: 0x4005bf
```
#### Kod w c:
```assembly
                  rdi      rsi
400590 switch_prob(long x, long n):
400590: 48 83                     subq $0x3c,%rsi         n -= 0x3c
400594: 48 83 fe 05               cmpq $0x5,%rsi          
400598: 77 29                     ja *0x4005c3            
if((uint64_t)n > 5) default w case
W tym miejscu mamy pewność, że n = <0..5> 
40059a: ff 24 f5 f8 06 40 00      jmpq *0x4006f8(,%rsi,8) 
skok pośredni - do adresu 0x4006f8 + rsi * 8  w tablicy skoków
case 0: case 1:
4005a1: 48 8d 04 fd 00 00 00 00   lea 0x0(,%rdi,8),%rax
4005a9: c3                        retq
case 4:
4005aa: 48 89 f8                  movq %rdi,%rax
4005ad: 48 c1 f8 03               sarq $0x3,%rax
4005b1:                           c3 retq
case 2:
4005b2: 48 89 f8                  movq %rdi,%rax
4005b5: 48 c1 e0 04               shlq $0x4,%rax
4005b9: 48 29 f8                  subq %rdi,%rax
4005bc: 48 89 c7                  movq %rax,%rdi
case 5:
4005bf: 48 0f af ff               imulq %rdi,%rdi
4005c3: 48 8d 47 4b               leaq 0x4b(%rdi),%rax
4005c7: c3                        retq
```
```C
long switch_prob(long x, long n){
  n -= 0x3c;
  switch (n) {
  case 0:
  case 1: return x * 8;
  case 4: return x >> 3;
  case 2: x *= 15;
  case 5: x *= x;
  default: return x + 75;
}
```
## <a name = "z7"></a>Zadanie 7. [⇧](#z6)[⇩](#z8)[⇮](#start)
## <a name = "z8"></a>Zadanie 8. [⇧](#z7)[⇮](#start)
#### Poniżej zamieszczono kod procedury o sygnaturze «struct T puzzle8(long *a, long n)». Na jego podstawie podaj definicję typu «struct T». Przetłumacz tę procedurę na język C, po czym jednym zdaniem powiedz co ona robi.
```assembly
puzzle8:
      movq %rdx, %r11
      xorl %r10d, %r10d
      xorl %eax, %eax
      movq $LONG_MIN, %r8
      movq $LONG_MAX, %r9
.L2:  cmpq %r11, %r10
      jge .L5
      movq (%rsi,%r10,8), %rcx
      cmpq %rcx, %r9
      cmovg %rcx, %r9
      cmpq %rcx, %r8
      cmovl %rcx, %r8
      addq %rcx, %rax
      incq %r10
      jmp .L2
.L5:  cqto
      movq %r9, (%rdi)
      idivq %r11
      movq %r8, 8(%rdi)
      movq %rax, 16(%rdi)
      movq %rdi, %rax
      ret
```
#### Kod w c:
```
If the type has class MEMORY, then the caller provides space for the return
value and passes the address of this storage in %rdi as if it were the first
argument to the function. In effect, this address becomes a “hidden” first argument.
This storage must not overlap any data visible to the callee through
other names than this argument.
On return %rax will contain the address that has been passed in by the
caller in %rdi.

```
```assembly
rdi niejawny
rdi      rsi   rdx
puzzle8(long *a, long n)
      movq %rdx, %r11           r11 = n
      xorl %r10d, %r10d         r10d = 0, i
      xorl %eax, %eax           eax = 0,  sum
      movq $LONG_MIN, %r8
      movq $LONG_MAX, %r9
.L2:  cmpq %r11, %r10     
      jge .L5                   if(r10 >= r11)
      movq (%rsi,%r10,8), %rcx  rcx = [rsi + r10 * 8]
      cmpq %rcx, %r9
      cmovg %rcx, %r9           greater
      cmpq %rcx, %r8            
      cmovl %rcx, %r8           less
      addq %rcx, %rax
      incq %r10
      jmp .L2
.L5:  cqto                      quad to oct
      movq %r9, (%rdi)
      idivq %r11
      movq %r8, 8(%rdi)
      movq %rax, 16(%rdi)
      movq %rdi, %rax
      ret
```

```C

struct T puzzle8(long *a, long n) {
	long sum = 0;
	long mini = LONG_MAX
	long maxi = LONG_MIN

	for (int i = 0; i < n; i++) {
		long tmp = a[i]
		mini = tmp < mini ? tmp : mini
		maxi = tmp > maxi ? tmp : maxi
		sum += tmp
	}
	return (struct T) {.min = mini, .max = maxi, .sr = suma / n} 
}
```
