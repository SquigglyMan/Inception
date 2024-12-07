# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: llarue <llarue@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/12/03 14:14:51 by llarue            #+#    #+#              #
#    Updated: 2024/12/07 17:26:49 by llarue           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	docker compose --file ./srcs/docker-compose.yml up --detach

clean:
	docker compose --file ./srcs/docker-compose.yml down

fclean:
	docker stop; $$(docker ps -qa);				\
	docker rm; $$(docker ps -qa);				\
	docker rmi -f; $$(docker images -qa);		\
	docker volume rm $$(docker volume ls -q);	\
	docker network rm $$(docker network ls -q);	\

re:
	docker compose --file ./srcs/docker-compose.yml up --build

.PHONY:	all										\
		clean									\
		fclean									\
		re