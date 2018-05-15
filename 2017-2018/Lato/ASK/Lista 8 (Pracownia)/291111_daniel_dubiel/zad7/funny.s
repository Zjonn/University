        .global _start

write = 1
read  = 0
exit  = 60

        .section .text
_start:
        
jmp READ 
FOR1:
        cmp $65,%r10
        jl BIG
        cmp $90,%r10
        jg BIG
        add $32,%r10
        mov %r10, (buff)
        jmp WRITE

BIG:
        cmp $97,%r10
        jl WRITE
        cmp $122,%r10
        jg WRITE
        sub $32,%r10
        mov %r10, (buff)

WRITE:
        # write(int fd, const void *buf, size_t count)
        mov     $write,%rax
        mov     $1,%rdi
        mov     $buff,%rsi
        mov     $1,%rdx
        syscall

READ:
        # read(unsigned int fd,	char __user *buf, size_t count
        mov     $read,%rax
        mov     $0,%rdi
        mov     $buff,%rsi
        mov     $1,%rdx
        syscall

TEST1:  
        mov (buff), %r10
        test %rax, %rax
        jne FOR1

# exit(int status)
        mov     $exit,%rax
        mov     $1,%rdi
        syscall
        .size   _start, . - _start
        .section .rodata
        .section .bss
        .lcomm buff 1
