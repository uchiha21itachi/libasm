global  ft_write 

    section .text

ft_write:
	mov	rax, 1
	syscall
	cmp	rax, 0
	jl	show_error
	ret

show_error:
	mov		rax, -1
	ret