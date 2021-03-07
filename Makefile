# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: btammara <btammara@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/06 16:30:33 by btammara          #+#    #+#              #
#    Updated: 2021/03/07 09:36:59 by btammara         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS =		./libasm_srcs/ft_strlen.s \
			./libasm_srcs/ft_strcpy.s \
			./libasm_srcs/ft_strcmp.s \
			./libasm_srcs/ft_write.s \
			./libasm_srcs/ft_read.s \
			./libasm_srcs/ft_strdup.s
OBJS =		$(SRCS:.s=.o)

NASM = 		nasm -f macho64

NAME =		libasm.a

TEST_NAME = test

%.o:		%.s
			@ $(NASM) $<

all: 		$(NAME)

$(NAME):	$(OBJS)
			@ ar rc $(NAME) $(OBJS)
			@ echo '"make check" - launches libasm_checker, "make test" - compiles my own main.c'

test:		all
			@ gcc -Wall -Wextra -Werror ./libasm_srcs/main.c $(NAME) -o $(TEST_NAME)
			@ echo 'type "./test" in the command line and press ENTER'

check:		all
			cd ./libasm_checker && make && cd -

clean:
			rm -f $(OBJS)

fclean:		clean
			rm -f $(NAME)
			rm -f $(TEST_NAME)

re:			fclean all

.PHONY:		all clean fclean re