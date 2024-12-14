# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: llarue <llarue@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/12/03 14:14:51 by llarue            #+#    #+#              #
#    Updated: 2024/12/14 01:23:38 by llarue           ###   ########.fr        #
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
	@ mkdir -p /home/$(SUDO_USER)/data/mariadb

create_environment:
	@ echo "USER=$(SUDO_USER)" >> ./srcs/.env

delete_directories:
	@ rm -rf /home/$(SUDO_USER)/data/mariadb

delete_added_environment:
	@ sed -i '/USER/d' ./srcs/.env
	
.PHONY:	all		\
		clean	\
		re