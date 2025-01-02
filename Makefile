# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: llarue <llarue@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/12/03 14:14:51 by llarue            #+#    #+#              #
#    Updated: 2025/01/02 21:08:48 by llarue           ###   ########.fr        #
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
	@ echo "simplePassword" > ./secrets/db_password.txt
	@ echo "rootP4ssw0rd!@" > ./secrets/db_root_password.txt

remove_secrest:
	@ rm -rf ./secrets

create_environment:
	@ mkdir -p ./srcs/.env
	@ echo "MYSQL_DATABASE=inception_db" > ./srcs/.env
	@ echo "MYSQL_USER=llarue" >> ./srcs/.env
	@ echo "DOMAIN_NAME=llarue.42.fr" >> ./srcs/.env
	@ echo "WP_TITLE=Inception with dockers" >> ./srcs/.env
	@ echo "WP_ADMIN=admin-ll" >> ./srcs/.env
	@ echo "WP_ADMIN_PASSWORD=adminPasswdLL" >> ./srcs/.env
	@ echo "WP_ADMIN_EMAIL=admin@admin.com" >> ./srcs/.env
	@ echo "WP_USER=llarue" >> ./srcs/.env
	@ echo "WP_EMAIL=test@test.com" >> ./srcs/.env
	@ echo "WP_PASSWD=1234passwd" >> ./srcs/.env
	@ echo "WP_USER_ROLE=contributor" >> ./srcs/.env
	
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