global  ft_strdup

    extern  ft_strlen
    extern  malloc
    extern  ft_strcpy

    section .text

ft_strdup:
    mov     r12, rdi
    call    ft_strlen
    mov     rdi, rax
    inc     rdi
    call    malloc
    mov     rdi, rax
    mov     rsi, r12
    call    ft_strcpy
    ret
