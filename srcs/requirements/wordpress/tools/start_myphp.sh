#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

sed -i 's/listen\s*=\s*\/run\/php\/php8.2-fpm.sock/listen = 0.0.0.0:9000/' /etc/php/8.2/fpm/pool.d/www.conf
# sed -i 's/;pm.status_path = \/status/pm.status_path = \/php_fpm_status/' /etc/php/8.2/fpm/pool.d/www.conf

wp core download --allow-root --path=/var/www/tmlh/wordpress --quiet
wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD}
wp core install --allow-root --path=$path --url"=https://$DOMAIN_NAME" --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL

php-fpm8.2