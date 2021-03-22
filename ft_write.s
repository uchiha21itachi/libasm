;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    ft_write.s                                         :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: yassharm <marvin@42.fr>                    +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2021/03/22 15:26:38 by yassharm          #+#    #+#              #
;#    Updated: 2021/03/22 15:26:40 by yassharm         ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

%ifdef __LINUX__
	%define CALL_HELPER wrt ..plt
	%define ERROR_NO __errno_location
	%define SYS_WRITE
	%define MY_WRITE ft_write
%else
	%define CALL_HELPER
	%define ERROR_NO ___error
	%define SYS_WRITE 0x2000004
	%define MY_WRITE _ft_write
%endif

extern ERROR_NO

global	MY_WRITE

section .text

MY_WRITE:
	mov		rax, SYS_WRITE
	syscall
%ifdef __LINUX__
	cmp		rax, 0
	jl		show_error
%else
	jc		show_error
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
