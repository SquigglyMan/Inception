# Pull the minimal debian image from version 11.11 Bullseye
FROM debian:bullseye

# install PHP and WordPress
RUN apt-get update \
	&& apt-get install -y php-fpm php-mysql curl \
	&& mkdir -p /var/www/html/wordpress

COPY ./tools/start_myphp.sh /usr/local/bin//start_myphp.sh
RUN chmod +x ./usr/local/bin//start_myphp.sh

# Only informative, the ports are opened in the docker-compose
EXPOSE 9000

ENTRYPOINT [ "/usr/local/bin/start_myphp.sh" ]