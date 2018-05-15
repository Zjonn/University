        .global lcm_gcd
        .type lcm_gcd,@function

        .section .text
lcm_gcd:
    a = %rdi
    b = %rsi
    t = %rcx

    mov a, %r8
    mov b, %r9
    #GCD
    jmp test
while:
    mov a, %rax
    xor %rdx, %rdx
    div %rsi
    mov b, a
    mov %rdx, b
test:
    test %rsi, %rsi
    jne while
    #LCM
    mov %r8, %rax
    mul %r9
    xor %rdx, %rdx
    div a
    mov a, %rdx
    ret

.size   lcm_gcd, . - lcm_gcd

    