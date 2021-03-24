;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    ft_strcpy.s                                        :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: yassharm <marvin@42.fr>                    +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2021/03/22 15:21:15 by yassharm          #+#    #+#              #
;#    Updated: 2021/03/22 15:21:17 by yassharm         ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

%ifidn __OUTPUT_FORMAT__, elf64
	%define MY_STRCPY ft_strcpy
%else
	%define MY_STRCPY _ft_strcpy
%endif

global	MY_STRCPY

section	.text

MY_STRCPY:
	mov		rax, rdi
	mov		rdx, 0
	cmp		byte[rsi + rdx], 0
	je		stop

start_copy:
	mov		cl, byte[rsi + rdx]
	mov		byte[rax + rdx], cl
	inc		rdx
	cmp		byte[rsi + rdx], 0
	jne		start_copy
stop:
	mov		cl, byte[rsi + rdx]
	mov		byte[rax + rdx], cl
	ret
