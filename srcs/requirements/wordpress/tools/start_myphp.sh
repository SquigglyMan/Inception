#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

sed -i 's/listen\s*=\s*\/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's/;pm.status_path = \/status/pm.status_path = \/php_fpm_status/' /etc/php/7.4/fpm/pool.d/www.conf

cd /var/www/html/wordpress
wp core download --allow-root --path=/var/www/html/wordpress
wp config create --allow-root --path=/var/www/html/wordpress --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=$MYSQL_PASSWORD --dbhost=mariadb
wp core install --allow-root --path=/var/www/html/wordpress --url=https://"$DOMAINE_NAME" --title="$WP_TITLE" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
wp user create --allow-root --path=/var/www/html/wordpress $WP_USER $WP_EMAIL --user_pass=$WP_PASSWD --role=$WP_USER_ROLE
wp theme install saaslauncher --allow-root --path=/var/www/html/wordpress --activate

# Add new posts

wp post create --allow-root --path=/var/www/html/wordpress --post_author=llarue --post_title='THE SCIENCE BEHIND RAINBOWS' --post_name='the-science-behind-rainbows' --post_status=publish 
wp post create --allow-root --path=/var/www/html/wordpress --post_author=llarue --post_title='SYMBOLS OF HOPE AND PROMISE' --post_name='symbols-of-hope-and-promise' --post_status=publish 
wp post create --allow-root --path=/var/www/html/wordpress --post_author=llarue --post_title='RECOGNIZING METEOROLOGICAL SIGNIFICANCE' --post_name='recognizing-meterological-significance' --post_status=publish 
wp post create --allow-root --path=/var/www/html/wordpress --post_author=llarue --post_title='INSPIRING CREATIVITY' --post_name='inspiring-creativity' --post_status=publish 
wp post create --allow-root --path=/var/www/html/wordpress --post_author=llarue --post_title='RAINBOW PHENOMENA AROUND THE WORLD' --post_name='rainbow-phenomena-around-the-world' --post_status=publish 
wp post create --allow-root --path=/var/www/html/wordpress --post_author=llarue --post_title='DIVERSITY AND IMAGINATION ON LITERATURE' --post_name='diversity-and-imagination-on-literature' --post_status=publish 

php-fpm7.4 -F -y /etc/php/7.4/fpm/php-fpm.conf
