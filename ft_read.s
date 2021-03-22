;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    ft_read.s                                          :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: yassharm <marvin@42.fr>                    +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2021/03/22 15:15:57 by yassharm          #+#    #+#              #
;#    Updated: 2021/03/22 15:16:07 by yassharm         ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

%ifdef __LINUX__
	%define CALL_HELPER wrt ..plt
	%define ERROR_NO __errno_location
	%define SYS_READ
	%define MY_READ ft_read
%else
	%define CALL_HELPER
	%define ERROR_NO ___error
	%define SYS_READ 0x2000003
	%define MY_READ _ft_read
%endif

extern ERROR_NO

global  MY_READ

section .text

MY_READ:
	mov		rax, SYS_READ
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
