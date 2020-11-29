global  ft_strdup

    extern  ft_strlen
    extern  malloc
    extern  ft_strcpy

    section .text

ft_strdup:
    mov     r12, rdi
    call    ft_strlen wrt ..plt
    mov     rdi, rax
    inc     rdi
    call    malloc wrt ..plt
    mov     rdi, rax
    mov     rsi, r12
    call    ft_strcpy wrt ..plt
    ret
