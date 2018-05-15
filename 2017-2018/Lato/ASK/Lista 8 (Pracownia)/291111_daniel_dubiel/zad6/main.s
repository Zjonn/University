        .global main
        .section .text
main:
        args =  %r10
        argc =  %rsi
        i    =  %r9

        mov     %rdi, args
        sub     $1, args
#Nie lubimy 0 argumentów
        test    args, args
        je      RET

        mov     $1, i
        jmp     TEST1
 #Wczytujemy dane -> atol -> stack
FOR1:       
        lea     (argc,i,8),%rdi
        mov     (%rdi), %rdi

        push    args
        push    i 
        push    argc

        call    atol

        pop     argc
        pop     i 
        pop     args 

        push    %rax   

        inc     i
TEST1:
        cmp     args,i 
        jle     FOR1

#stack -> min max
        min =   %rdx
        max =   %rcx
        val =   %r8
        pop     min
        mov     min, max
        mov     $1, i
        jmp     TEST2
FOR2:       
        pop     val
        cmp     val, min
        cmovg   val, min
        cmp     val, max
        cmovl   val, max       

        inc     i
TEST2:
        cmp     args,i 
        jl      FOR2  

#printf
        mov     max, %rsi
        mov     $0, %eax
        lea     format(%rip), %rdi
        call    printf
RET:
        ret

.size   main, . - main

        .section .rodata
format:   .asciz      "max: %lu min: %lu\n"


