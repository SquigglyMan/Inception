# Pull the minimal debian image from version 11.11 Bullseye
FROM debian:bullseye

# install MariaDB
RUN apt-get update \
	&& apt-get install -y mariadb-server mariadb-client

RUN mkdir -p /var/run \
	&& mkdir -p /var/run/mysql \
	# && chown -R mysql::mysql /var/run/mysql \
	# && chmod 777 /var/run/mysql
# Open the port used to access
EXPOSE 3306

COPY ./tools/mariadb.sh /usr/local/bin/
# COPY ./conf/wordpress.sql /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh
# RUN chmod +x /usr/local/bin/wordpress.sql

ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]

CMD ["mysqld", "--bind-address=0.0.0.0"]