global      _start:

section     .text

_start:
    mov     rdx, output      ;gave total size to rdx
    mov     r8, 10            ;initial counter for starts
    mov     r9, 0

print:
    mov     byte [rdx], '*' ;giving the value to current byte
    inc     rdx
    dec     r8
    cmp     r8, r9
    jne     print

linedone:
    mov     byte [rdx], 10  ;newline
    inc     rdx
    inc     r9
    mov     r8, 10          ;again settinf it 10 for next linedone
    cmp     r9, 10
    jnge    print
    mov     r8, 1
    mov     r9, 0
    
reverse:
    mov     byte [rdx], '*'
    inc     rdx
    inc     r9
    cmp     r9, r8
    jne     reverse

reversedone:
    mov     byte [rdx], 10  ;newline
    inc     rdx
    mov     r9, 0
    inc     r8
    cmp     r8, 11
    jnge    reverse


done: 
    mov     rax, 1          ;system call for write
    mov     rdi, 1          
    mov     rsi, output
    mov     rdx, output
    syscall

    mov     rax, 60
    xor     rdi, rdi
    syscall





section     .bss

output    resb     200      ;total number of starts to print