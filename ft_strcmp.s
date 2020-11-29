global  ft_strcmp

section .text

ft_strcmp:
    mov     rcx, 0
    movzx   rax, byte[rdi + rcx]
    movzx   rdx, byte[rsi + rcx]
    cmp     rax, rdx
    jne     stop
    cmp     rax, 0
    je      stop
    cmp     rdx, 0
    je      stop

start_cmp:
    inc     rcx
    movzx   rax, byte[rdi + rcx]
    movzx   rdx, byte[rsi + rcx]
    cmp     rax, 0
    je      stop
    cmp     rdx, 0
    je      stop
    cmp     rax, rdx
    je      start_cmp
    
stop:
    sub     rax, rdx
    ret