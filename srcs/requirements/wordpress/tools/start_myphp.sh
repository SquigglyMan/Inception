#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

sed -i 's/listen\s*=\s*\/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf
# sed -i 's/;pm.status_path = \/status/pm.status_path = \/php_fpm_status/' /etc/php/8.2/fpm/pool.d/www.conf

wp core download --allow-root --path=/var/www/html/wordpress
wp config create --allow-root --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --skip-check
wp core install --allow-root --path=/var/www/html/wordpress --url"=https://$DOMAIN_NAME" --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
wp theme install astra --allow-root --activate 

php-fpm7.4 -F