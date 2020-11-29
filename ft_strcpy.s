global  ft_strcpy

    section .text

ft_strcpy:
        mov     rax, rdi
        mov     rdx, 0
        cmp     byte[rsi + rdx], 0
        je      stop

start_copy:
        mov     cl, byte[rsi + rdx]
        mov     byte[rax + rdx], cl
        inc     rdx
        cmp     byte[rsi + rdx], 0
        jne     start_copy
stop:
        mov     cl, byte[rsi + rdx]
        mov     byte[rax + rdx], cl
        ret
