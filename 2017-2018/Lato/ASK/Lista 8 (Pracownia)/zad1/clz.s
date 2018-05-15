        .global clz
        .type clz,@function

        .section .text
clz:
        num      = %rdi
        C     = %r10

        test num, num
        mov $64, %rax

        je RET
        mov $0, %rax

#Metoda z ksiażki uczta programistów
        mov $0x00000000FFFFFFFF, %r10
        cmp C, %rdi
        jg TEST2
        add $32, %rax
        sal $32, %rdi
TEST2:
        mov $0x0000FFFFFFFFFFFF, %r10
        cmp C, %rdi
        jg TEST3
        add $16, %rax
        sal $16, %rdi
TEST3:
        mov $0x00FFFFFFFFFFFFFF, %r10
        cmp C, %rdi
        jg TEST4
        add $8, %rax
        sal $8, %rdi
TEST4:
        mov $0x0FFFFFFFFFFFFFFF, %r10
        cmp C, %rdi
        jg TEST5
        add $4, %rax
        sal $4, %rdi
TEST5:
        mov $0x3FFFFFFFFFFFFFFF, %r10
        cmp C, %rdi
        jg TEST6
        add $2, %rax
        sal $2, %rdi
TEST6:
        mov $0x7FFFFFFFFFFFFFFF, %r10
        cmp C, %rdi
        jg RET
        add $1, %rax
        sal $1, %rdi

RET:
        ret
.size   clz, . - clz

