global  ft_strcmp

extern      printf
extern      ft_strlen
extern      printf

    section .text

ft_strcmp:
    mov     rax, 0      ;read
    mov     r8, rdi     ;copying first string in r8 
    mov     r9, rsi     ;copying second string in r9

get_len:
    mov     rax, 0      
    mov     rdi, r9
    call    ft_strlen
    mov     rsi, rdi    ;second string is - [rsi]
    mov     r9, rax     ;second string len- [r8]
    mov     rdi, r8     ;first string is  - [rdi]
    call    ft_strlen
    mov     r9, rax     ;first string len - [r9]



print1:
    mov     rax, 1      ;system call for write
    mov     rsi, r8    ;copying first arg to rsi
    mov     rdi, 1      ;file descriptor
    mov     rdx, r10     ;length of the string
    syscall

print2:
    mov     rax, 1
    mov     rsi, r9     
    mov     rdi, 1
    mov     rdx, 5
    syscall

exit:
    mov     rax, 60     ;system call for exit
    xor     rdi, rdi    
    syscall


section .data
mes     db      "len is [%s]", 10