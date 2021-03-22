;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    ft_strcmp.s                                        :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: yassharm <marvin@42.fr>                    +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2021/03/22 15:17:59 by yassharm          #+#    #+#              #
;#    Updated: 2021/03/22 15:18:00 by yassharm         ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

%ifdef	__LINUX__
	%define	MY_STRCMPft_strcmp
%else
	%define	MY_STRCMP _ft_strcmp
%endif

global	MY_STRCMP

section	.text

MY_STRCMP:
	mov		rcx,0
	movzx	rax,byte[rdi+rcx]
	movzx	rdx,byte[rsi+rcx]
	cmp		rax,rdx
	jne		stop
	cmp		rax,0
	je		stop
	cmp		rdx,0
	je		stop

start_cmp:
	inc		rcx
	movzx	rax,byte[rdi+rcx]
	movzx	rdx,byte[rsi+rcx]
	cmp		rax,0
	je		stop
	cmp		rdx,0
	je		stop
	cmp		rax,rdx
	je		start_cmp
	
stop:
	sub		rax,rdx
	ret
