# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: llarue <llarue@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/12/03 14:14:51 by llarue            #+#    #+#              #
#    Updated: 2025/01/02 21:19:51 by llarue           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: make_directory create_secrets
	docker compose --file ./srcs/docker-compose.yml up --detach

down:
	docker compose --file ./srcs/docker-compose.yml down
	
fclean: remove_directories
	docker compose --file ./srcs/docker-compose.yml down
	docker system prune -a --force

re: fclean all

make_directory:
	@ mkdir -p /home/llarue/data/mariadb
	@ mkdir -p /home/llarue/data/wordpress


remove_directories:
	@ rm -rf /home/llarue/data/*

create_secrets:
	@ mkdir -p ./secrets
	@ touch ./secrets/db_password.txt
	@ touch ./secrets/db_root_password.txt

remove_secrest:
	@ rm -rf ./secrets

create_environment:
	@ touch ./srcs/.env
	
delete_added_environment:
	@ rm -rf ./srcs/.env

.PHONY:	all							\
		down						\
		make_directory				\
		create_environment			\
		remove_directories			\
		create_secrets				\
		remove_secrets				\
		delete_added_environment	\
		fclean						\
		re