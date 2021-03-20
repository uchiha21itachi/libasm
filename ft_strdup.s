
extern ft_strlen
extern ft_strcpy
extern malloc


global ft_strdup

section .text
; char *ft_strdup(const char *str);
ft_strdup:
    push rdi         ; save rdi because it will be overwrite for malloc

    call ft_strlen  ; rdi is still == str
    inc  rax          ; len++ for '\0'

    mov  rdi, rax     ; size to malloc
    call malloc wrt ..plt
    cmp  rax, 0
    je   ft_strdup_error

    pop  rsi          ; original str as src
    mov  rdi, rax     ; allocated as dest
    call ft_strcpy
    ret
ft_strdup_error:
    pop  rdi
    ret
