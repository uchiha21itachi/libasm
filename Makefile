# # MacOS
# # $ nasm -fmacho64 hello.asm && ld hello.o && ./a.out

# # Linux
# # $ nasm -felf64 

UNAME_S				:= $(shell uname -s)
OS					= 0

ifeq ($(UNAME_S), Linux)
	OS = 1
	NA_FLAGS	=	-f elf64
else ifeq ($(UNAME_S), Darwin)
	OS = 2
	NA_FLAGS	=	-f macho64
endif

$(info    OS is $(UNAME_S))
$(info    NA_FLAGS is $(NA_FLAGS))


SRCS =	ft_strlen.s \
ft_strcmp.s \
ft_strcpy.s \
ft_write.s \
ft_read.s \
ft_strdup.s \

OBJS		=	$(SRCS:.s=.o)
NA			=	nasm
FLAGS 		=	-Wall -Werror -Wextra
NAME		=	libasm.a
TEST		=	include/main.c

%.o:			%.s
				$(NA) $(NA_FLAGS) $<

all:			$(NAME)

$(NAME):		$(OBJS)
				ar rcs $(NAME) $(OBJS)
				ranlib $(NAME)

test:
				gcc $(TEST) $(NAME)
				./a.out

clean:
				rm -rf $(OBJS) $(BONUS_OBJS)

fclean:			clean
				rm -rf $(NAME)

tclean:			clean
				rm -rf $(NAME) a.out

re:				fclean $(NAME)

.PHONY:			clean fclean re tclean test