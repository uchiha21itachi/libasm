# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adjemaa <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/02/12 19:52:50 by adjemaa           #+#    #+#              #
#    Updated: 2020/02/12 19:53:04 by adjemaa          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = gcc

NAME = libasm.a

FLAGS = -Wall -Wextra -Werror

SRCS =	ft_strlen.s\
ft_strcmp.s \
maxofthree.s \
		
TEST_FILE = main.c

OBJECT = $(SRCS:.s=.o)

%.o: %.s
	nasm -felf64 $<

$(NAME): ${OBJECT}
	$(CC) $(FLAGS) $(OBJECT) $(TEST_FILE)

# 	ar rc $(NAME)  $(OBJECT)
# 	ranlib $(NAME)
# 	$(CC) $(NAME) $(TEST_FILE)

bonus: ${OBJECT_B}
	@$(CC) $(FLAGS) -c $(BS)
	@ar rc $(NAME)  $(OBJECT_B)
	@ranlib $(NAME)

all: $(NAME)

clean:
	rm -rf $(OBJECT)

fclean : clean
	rm -rf $(NAME) a.out

re : fclean all

.PHONY: re clean fclean all bonus

# # MacOS
# # $ nasm -fmacho64 hello.asm && ld hello.o && ./a.out

# # Linux
# # $ nasm -felf64 hello.asm && ld hello.o && ./a.out
