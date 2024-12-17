# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: llarue <llarue@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/12/03 14:14:51 by llarue            #+#    #+#              #
#    Updated: 2024/12/17 11:35:54 by llarue           ###   ########.fr        #
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

make_directory:
	@ mkdir -p /home/llarue/data/mariadb
# 	@ mkdir -p /home/llarue/data/wordpress

# create_environment:
# 	@ echo "USER=llarue" >> ./srcs/.env

delete_directories:
	@ rm -rf /home/llarue/data/mariadb
# 	@ rm -rf /home/llarue/data/wordpress

# delete_added_environment:
	# @ sed -i '/USER=llarue/d' ./srcs/.env
	
.PHONY:	all							\
		down						\
		make_directory				\
		create_environment			\
		delete_directories			\
		delete_added_environment	\
		fclean						\
		re