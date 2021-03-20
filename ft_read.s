%ifdef __LINUX__
    %define CALL_HELPER wrt ..plt
    %define ERROR_NO __errno_location
    %define MY_READ ft_read
%else
    %define CALL_HELPER
    %define ERROR_NO ___error
    %define MY_READ _ft_read
%endif

extern ERROR_NO

global  MY_READ

section .text

MY_READ:
    mov     rax, 0x2000003
    syscall
%ifdef __LINUX__
    cmp     rax, 0
    jl      show_error
%else
    jc  show_error
%endif
    ret

show_error:
%ifdef __LINUX__
    neg     rax
%endif
    push rax
    call    ERROR_NO CALL_HELPER
    mov     rax, -1
    pop		qword [rax]
	mov		rax, -1
	ret
