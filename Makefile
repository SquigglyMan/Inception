# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: llarue <llarue@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/12/03 14:14:51 by llarue            #+#    #+#              #
#    Updated: 2024/12/14 02:06:47 by llarue           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: make_directory create_environment
	docker compose --file ./srcs/docker-compose.yml up --detach

down:
	docker compose --file ./srcs/docker-compose.yml down
	
fclean: delete_directories delete_added_environment
	docker compose --file ./srcs/docker-compose.yml down
	docker system prune -a --force

re: fclean all

# make_directory:
# 	@ mkdir -p /home/$(SUDO_USER)/data/mariadb

# create_environment:
# 	@ echo "USER=$(SUDO_USER)" >> ./srcs/.env

# delete_directories:
# 	@ rm -rf /home/$(SUDO_USER)/data/mariadb

# delete_added_environment:
# 	@ sed -i '/USER=$(SUDO_USER)/d' ./srcs/.env
	
.PHONY:	all							\
		down						\
		make_directory				\
		create_environment			\
		delete_directories			\
		delete_added_environment	\
		fclean						\
		re