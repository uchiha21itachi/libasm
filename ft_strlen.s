;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    ft_strlen.s                                        :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: yassharm <marvin@42.fr>                    +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2021/03/22 15:25:28 by yassharm          #+#    #+#              #
;#    Updated: 2021/03/22 15:25:31 by yassharm         ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

%ifdef __OUTPUT_FORMAT__, elf64
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
	mov		rdi, rax
	ret
