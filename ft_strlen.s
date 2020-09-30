global	ft_strlen

		section	.text
ft_strlen:
		mov		rax, 0
		cmp		byte [rdi], 0
		je		fin

count:
		inc		rax
		cmp		byte [rdi + rax], 0
		jne		count

fin:
        mov     rdi, rax
		ret