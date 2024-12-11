# Pull the minimal debian image from version 11.11 Bullseye
FROM debian:bullseye

# install PHP and WordPress
RUN apt-get update \
	&& apt-get install -y php-fpm php-mysql curl \
	&& mkdir /var/www/ \
	&& mkdir /var/www/html \

COPY ./tools/start_myphp.sh ./start_myphp.sh
RUN chmod +x ./start_myphp.sh

EXPOSE 9000

# ENTRYPOINT ["./start_myphp.sh"]

CMD ["yes"]