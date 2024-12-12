# Pull the minimal debian image from version 11.11 Bullseye
FROM debian:bullseye

# install MariaDB
RUN apt-get update \
	&& apt-get install -y mariadb-server

RUN mkdir -p /var/run \
	&& mkdir -p /var/run/mysql \
	&& chown -R mysql:mysql /var/run/mysql \
	&& chmod 777 /var/run/mysql

# Open the port used to access
EXPOSE 3306

COPY ./tools/start_mysql.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start_mysql.sh

ENTRYPOINT ["usr/local/bin/start_mysql.sh"]

CMD [ "tail", "-l", "/dev/null" ]
# ENTRYPOINT [ "./start_mysql.sh" ]

# CMD ["mysqld", "--bind-address=0.0.0.0"]