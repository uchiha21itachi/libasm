# # MacOS
# # $ nasm -fmacho64 hello.asm && ld hello.o && ./a.out

# # Linux
# # $ nasm -felf64 hello.asm && ld hello.o && ./a.out


SRCS =	ft_strlen.s \
ft_strcmp.s \
ft_strcpy.s \
ft_write.s \
ft_read.s \
ft_strdup.s \

OBJS		=	$(SRCS:.s=.o)
NA			=	nasm
NA_FLAGS	=	-f elf64
FLAGS 		=	-Wall -Werror -Wextra
NAME		=	libasm.a

%.o:			%.s
				$(NA) $(NA_FLAGS) $<

all:			$(NAME)

$(NAME):		$(OBJS)
				ar rcs $(NAME) $(OBJS)
				ranlib $(NAME)

clean:
				rm -rf $(OBJS) $(BONUS_OBJS)

fclean:			clean
				rm -rf $(NAME)

re:				fclean $(NAME)

.PHONY:			clean fclean re test 