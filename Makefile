# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: llarue <llarue@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/12/03 14:14:51 by llarue            #+#    #+#              #
#    Updated: 2024/12/03 18:37:29 by llarue           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	docker compose up

clean:
	
fclean:

re:	fclean all

.PHONY:	all \
		clean \
		fclean \
		re