# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: llarue <llarue@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/12/03 14:14:51 by llarue            #+#    #+#              #
#    Updated: 2024/12/07 18:28:30 by llarue           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	docker compose --file ./srcs/docker-compose.yml up --detach

clean:
	docker compose --file ./srcs/docker-compose.yml down

re:
	docker compose --file ./srcs/docker-compose.yml up --build --detach

.PHONY:	all		\
		clean	\
		fclean	\
		re