%ifdef __LINUX__
    %define MY_STRLEN ft_strlen
%else
    %define MY_STRLEN _ft_strlen
%endif

global  MY_STRLEN

		section	.text
MY_STRLEN:
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