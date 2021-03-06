# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gasselin <gasselin@student.42quebec.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/22 11:49:55 by gasselin          #+#    #+#              #
#    Updated: 2022/01/19 15:28:13 by gasselin         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =		so_long
OBJS_PATH =	objs

SRCS =		so_long.c move_enemy.c ft_is_map_valid.c ft_manage_timer.c \
			ft_move.c ft_print_map.c ft_utils.c ft_utils2.c

CC =		gcc
CFLAGS =	-Wall -Werror -Wextra -c -g
INCLUDES =	-Imlx -I.
LIBS =		-lmlx -framework OpenGL -framework AppKit
OBJS =		$(SRCS:.c=.o)

SRCS_FULL =	$(addprefix srcs/, $(SRCS))
OBJS_FULL =	$(addprefix objs/, $(OBJS))

all: $(OBJS_PATH) $(NAME)

$(OBJS_PATH):
	@mkdir -p $(OBJS_PATH)
	@echo Created: Object directory

$(NAME): $(OBJS_FULL)
	@make re --no-print-directory -C ./ft_printf
	@$(CC) $(OBJS_FULL) $(LIBS) -o $(NAME) ./ft_printf/libftprintf.a
	@echo "\\n\033[32;1m SO_LONG HAS BEEN GENERATED \033[0m \\n"

$(OBJS_PATH)/%.o: ./%.c
	@echo "Created: $@\033[1A\033[M"
	@$(CC) $(CFLAGS) $(INCLUDES) $< -o $@

clean:
	@make clean --no-print-directory -C ./ft_printf
	@rm -rf $(OBJS_FULL) $(OBJS_PATH) 
	@echo "\033[34;1m CLEANED OBJECT FILES \033[0m"

fclean: clean
	@make fclean --no-print-directory -C ./ft_printf
	@rm -f $(NAME)
	@echo "\033[34;1m CLEANED SO_LONG \033[0m"

re: fclean all

.PHONY: all clean fclean re