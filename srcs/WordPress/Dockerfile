# Pull the minimal debian image from version 11.11 Bullseye
FROM debian:11.11

# install PHP and WordPress
RUN apt-get update \
	&& install -y php-cgi php-common php-fpm php-mysql \
	&& cd /var/www/html/ \
	&& wget https://wordpress.org/latest.tar.gz \
	&& tar -xvzf latest.tar.gz \
	&& rm -rf latest.tar.gz