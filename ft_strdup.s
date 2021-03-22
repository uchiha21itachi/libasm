;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    ft_strdup.s                                        :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: yassharm <marvin@42.fr>                    +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2021/03/22 15:24:27 by yassharm          #+#    #+#              #
;#    Updated: 2021/03/22 15:24:29 by yassharm         ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

%ifdef __LINUX__
	%define CALL_HELPER wrt ..plt
	%define MY_STRDUP ft_strdup
	%define MY_STRLEN ft_strlen
	%define MY_STRCPY ft_strcpy
	%define OG_MALLOC malloc
%else
	%define CALL_HELPER
	%define MY_STRDUP _ft_strdup
	%define MY_STRLEN _ft_strlen
	%define MY_STRCPY _ft_strcpy
	%define OG_MALLOC _malloc
%endif

extern MY_STRCPY
extern MY_STRLEN
extern OG_MALLOC

global MY_STRDUP

section .text
MY_STRDUP:
	push	rdi				; save rdi since malloc will overwrite it
	call	MY_STRLEN		; rdi is still == str
	inc		rax				; len++ for '\0'
	mov		rdi, rax		; size to malloc
	call	OG_MALLOC		; Calling malloc will return pointer to rax
	cmp		rax, 0
	je		ft_strdup_error
	pop		rsi				; original push rdi str as src
	mov		rdi, rax		; rdi is given destination pointer rax
	call	MY_STRCPY
	ret
ft_strdup_error:
	pop  rdi
	ret
