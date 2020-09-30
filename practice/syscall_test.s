section   .data
message:  db   `\xe2\x98\xba` ; note the newline at the end
len       equ   $ - message             ;length of our dear string

mes2:      db   10, "len of first message is - %d", 10
len2      equ  $ - mes2

mes3:       db "len is = [%d]", 10, 65, 10, $len, 10
len3:       equ $-mes3
global main
section .text
    extern printf
    extern strlen

    main:
        mov    rax, 1
        mov    rdi, 1
        mov    rsi, message
        mov    rdx, len
        syscall
        
       ; mov     rax, 0
       ; mov     rdi, mes2
       ; mov     rsi, len
       ; call    printf

       ; mov     rax, 1
       ; mov     rdi, 1
       ; mov     rsi, mes3
       ; mov     rdx, len3
       ; syscall

       ; mov     rax, 0
       ; mov     rdi, mes3
       ; mov     rsi, len3
       ; call    printf

        mov     rax, 60
        xor     rdi, rdi                    ;xor gate 
        syscall

