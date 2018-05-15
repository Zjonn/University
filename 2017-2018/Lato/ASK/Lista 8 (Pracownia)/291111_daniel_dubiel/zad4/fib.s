        .global fibonacci
        .type fibonacci,@function

        .section .text
fibonacci:
    n = %rdi

    pushq   %rbp 
    movq    %rsp, %rbp

    test n, n
    mov $0, %rax
    je Ret

    cmp $1, n
    mov $1, %rax
    je Ret

    pushq n
    subq $1, n
    call fibonacci

    popq n
    pushq %rax
    subq $2, n
    call fibonacci
    popq n

    addq n, %rax

Ret:
    movq    %rbp, %rsp
    popq    %rbp
    ret

    .size   fibonacci, . - fibonacci
