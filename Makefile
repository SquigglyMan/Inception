# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: llarue <llarue@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/12/03 14:14:51 by llarue            #+#    #+#              #
#    Updated: 2024/12/13 23:17:27 by llarue           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	mkdir -p $(HOME)/data/mariadb
	docker compose --file ./srcs/docker-compose.yml up --detach

clean:
	rm -rf $(HOME)/data/mariadb
	docker compose --file ./srcs/docker-compose.yml down
	docker system prune -a --force

re:
	docker compose --file ./srcs/docker-compose.yml up --build --detach

.PHONY:	all		\
		clean	\
		re