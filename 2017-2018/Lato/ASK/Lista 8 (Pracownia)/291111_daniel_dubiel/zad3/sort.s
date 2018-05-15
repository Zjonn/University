        .global insert_sort
        .type insert_sort,@function

        .section .text
insert_sort:
        beg =   %rdi
        end =   %rsi
        key =   %r8
        i   =   %rdx
        j   =   %rcx
   
        mov     beg, i
        add     $8, i
        jmp     test1
for1:
        mov     (i), key
        mov     i, j
        sub     $8, j

        jmp     test2

for2:
        lea     8(j), %r9
        mov     (j), %rax
        mov     %rax, (%r9)

inc2:
        sub     $8, j
test2:
        cmp     beg, j
        jl      inc1
        cmp     key, (j)
        jg      for2

inc1:
        lea     8(j), %r9
        mov     key, (%r9)
        add     $8, i
test1:
        cmp     end, i
        jle     for1
        ret

        .size   insert_sort, . - insert_sort
