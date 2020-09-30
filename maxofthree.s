global controller

extern get_len
extern print_len

section .text

    controller: 
        call    get_len
        mov     rdi, rax
        call    print_len
        
