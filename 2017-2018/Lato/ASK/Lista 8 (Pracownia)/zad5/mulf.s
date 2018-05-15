        .global mulf
        .type mulf,@function

        .section .text
mulf:
        a = %rdi
        b = %rsi
        exp = %r11
        mant = %r9
        dig = %r10
        #znak
        mov a, dig
        xor b, dig

        #wykładnik
        mov a, exp
        mov b, %r8
        and EXP, exp
        and EXP, %r8
        add %r8, exp
        sub BIAS,exp     
        #rcx rdx
        
        #mantysa
        mov a, mant
        and MANT, mant
        or  MANT_H1, %r9d

        mov b, %rax      
        and MANT, %rax
        or MANT_H1, %eax

        xor %rdx, %rdx
        mul mant

        #normalizacja
        mov %rax, %rcx

        sar $47, %rcx

        #mov %rcx, %r8
        #sal $23, %r8
        #add %r8, exp

        add $22, %rcx
        sar %cl, %rax

        and MANT, %eax
        or exp, %rax
        or dig, %rax
        
        ret  

        .size   mulf, . - mulf
     
        .section .rodata
DIG:
        .int 0x80000000
NEG_DIG:
        .int 0x7FFFFFFF
EXP:
        .int 0x7F800000
MANT:  
        .int 0x007FFFFF
MANT_H1:  
        .int 0x00800000
BIAS:
        .int 1065353216


