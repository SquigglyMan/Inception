# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: llarue <llarue@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/12/03 14:14:51 by llarue            #+#    #+#              #
#    Updated: 2024/12/14 01:05:53 by llarue           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: make_directory create_environment
	docker compose --file ./srcs/docker-compose.yml up --detach

clean: delete_directories delete_added_environment
	docker compose --file ./srcs/docker-compose.yml down
	docker system prune -a --force

re:
	docker compose --file ./srcs/docker-compose.yml up --build --detach

make_directory:
	@ mkdir -p $(HOME)/data/mariadb

create_environment:
	@ echo "HOME=$(HOME)" >> ./srcs/.env

delete_directories:
	@ rm -rf $(HOME)/data/mariadb

delete_added_environment:
	@ sed -i '/HOME/d' ./srcs/.env
	
.PHONY:	all		\
		clean	\
		re