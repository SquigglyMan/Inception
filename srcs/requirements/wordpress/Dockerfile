# Pull the minimal debian image from version 11.11 Bullseye
FROM debian:bullseye

# install PHP and WordPress
RUN apt-get update \
	&& apt-get install -y php-cgi php-common php-fpm php-mysql wget \
	&& mkdir /var/www/ \
	&& mkdir /var/www/html \
	&& cd /var/www/html/ \
	&& wget https://wordpress.org/latest.tar.gz \
	&& tar -xvzf latest.tar.gz \
	&& rm -rf latest.tar.gz

CMD ["yes"]