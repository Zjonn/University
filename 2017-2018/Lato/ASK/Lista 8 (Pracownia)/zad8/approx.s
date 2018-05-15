        .global approx_sqrt
        .type approx_sqrt,@function

        .section .text
approx_sqrt:
        x1  =   %xmm0
        x2  =   %xmm2
        eps =   %xmm1
        a   =   %xmm3  

        MOV $0x7FFFFFFFFFFFFFFF,%rdi
        MOVq %rdi, %xmm3

        MOVsd x1, a
FOR1:
        MOVsd a, x2
        DIVsd x1, x2
        ADDsd x1, x2
        MULsd Half, x2
INC1:
TEST1:
        SUBsd x2, x1
        ANDpd %xmm3, x1
        COMisd x1, eps
        MOVsd x2, x1
        jb FOR1

        ret

        .size   approx_sqrt, . - approx_sqrt

        .section .rodata
Half:
        .double 0.5       

