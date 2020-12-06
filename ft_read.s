global      ft_read

    section .text

ft_read:
    mov     rax, 0
    syscall
    cmp     rax, 0
    jl      show_error
    ret

show_error:
    mov     rax, -1
    ret
