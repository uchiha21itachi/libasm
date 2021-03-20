%ifdef __LINUX__
    %define CALL_HELPER wrt ..plt
    %define ERROR_NO __errno_location
    %define MY_WRITE ft_write
%else
    %define CALL_HELPER
    %define ERROR_NO ___error
    %define MY_WRITE _ft_write
%endif

extern ERROR_NO

global  MY_WRITE

section .text

; int ft_write(int rdi, const void *rsi, size_t rdx);

MY_WRITE:
	mov		rax, 0x2000004
	syscall
%ifdef __LINUX__
    cmp rax, 0
    jl  show_error
%else
    jc  show_error
%endif
	ret
	
show_error:
%ifdef __LINUX__
	neg		rax
%endif
	push	rax
	call	ERROR_NO CALL_HELPER
	pop		qword [rax]
	mov		rax, -1
	ret