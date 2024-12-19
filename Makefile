# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: llarue <llarue@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/12/03 14:14:51 by llarue            #+#    #+#              #
#    Updated: 2024/12/19 09:45:16 by llarue           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: make_directory
	docker compose --file ./srcs/docker-compose.yml up --detach

down:
	docker compose --file ./srcs/docker-compose.yml down
	
fclean: remove_directories
	docker compose --file ./srcs/docker-compose.yml down
	docker system prune -a --force

re: fclean make_directory
	docker compose --file ./srcs/docker-compose.yml up --build --detach

make_directory:
	@ mkdir -p /home/llarue/data/mariadb
	@ mkdir -p /home/llarue/data/wordpress


remove_directories:
	@ rm -rf /home/llarue/data/mariadb
	@ rm -rf /home/llarue/data/wordpress
	
.PHONY:	all							\
		down						\
		make_directory				\
		create_environment			\
		remove_directories			\
		delete_added_environment	\
		fclean						\
		re