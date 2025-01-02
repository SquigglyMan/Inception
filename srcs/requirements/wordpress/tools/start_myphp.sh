#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

sed -i 's/listen\s*=\s*\/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's/;pm.status_path = \/status/pm.status_path = \/php_fpm_status/' /etc/php/7.4/fpm/pool.d/www.conf

cd /var/www/html/wordpress
wp core download --allow-root --path=/var/www/html/wordpress
wp config create --allow-root --path=/var/www/html/wordpress --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=$MYSQL_PASSWORD --dbhost=mariadb
wp core install --allow-root --path=/var/www/html/wordpress --url=https://"$DOMAIN_NAME" --title="$WP_TITLE" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
wp user create --allow-root --path=/var/www/html/wordpress $WP_USER $WP_EMAIL --user_pass=$WP_PASSWD --role=$WP_USER_ROLE
wp theme install colorstream --allow-root --path=/var/www/html/wordpress --activate


#	Creating categories
wp term create category 'Science' --description='Science' --allow-root --path=/var/www/html/wordpress --slug=science
wp term create category 'Culture.Mythology' --description='Culture and Mythology' --allow-root --path=/var/www/html/wordpress --slug=culture-mythology
wp term create category 'Arts.Creativity' --description='Arts and Creativity' --allow-root --path=/var/www/html/wordpress --slug=arts-creativity
wp term create category 'Culture' --description='Culture' --allow-root --path=/var/www/html/wordpress --slug=culture
wp term create category 'Arts.Culture' --description='Arts and Culture' --allow-root --path=/var/www/html/wordpress --slug=arts-culture
wp term create category 'Architecture.Society' --description='Architecture and Society' --allow-root --path=/var/www/html/wordpress --slug=architecture-society
wp term create category 'Arts.History' --description='Arts and History' --allow-root --path=/var/www/html/wordpress --slug=arts-history
wp term create category 'Arts.History.Music' --description='Arts, History and Music' --allow-root --path=/var/www/html/wordpress --slug=arts-history-music


#	Add new posts
wp post create --allow-root --path=/var/www/html/wordpress --post_author=llarue --post_title='SYMBOLS OF HOPE AND PROMISE' --post_name='symbols-of-hope-and-promise' --post_category='Culture.Mythology' --post_status=publish 
wp post create --allow-root --path=/var/www/html/wordpress --post_author=llarue --post_title='RECOGNIZING METEOROLOGICAL SIGNIFICANCE' --post_name='recognizing-meterological-significance' --post_category='Science' --post_status=publish 
wp post create --allow-root --path=/var/www/html/wordpress --post_author=llarue --post_title='INSPIRING CREATIVITY' --post_name='inspiring-creativity' --post_category='Arts.Creativity' --post_status=publish 
wp post create --allow-root --path=/var/www/html/wordpress --post_author=llarue --post_title='RAINBOW PHENOMENA AROUND THE WORLD' --post_name='rainbow-phenomena-around-the-world' --post_category='Culture' --post_status=publish 
wp post create --allow-root --path=/var/www/html/wordpress --post_author=llarue --post_title='DIVERSITY AND IMAGINATION ON LITERATURE' --post_name='diversity-and-imagination-on-literature' --post_category='Arts.Culture' --post_status=publish 
wp post create --allow-root --path=/var/www/html/wordpress --post_author=llarue --post_title='LGBTQ+ PRIDE AND INCLUSION' --post_name='lgbtq-pride-and-inclusion' --post_category='Culture' --post_status=publish
wp post create --allow-root --path=/var/www/html/wordpress --post_author=llarue --post_title='HOW RAINBOWS TRANFORM URBAN SPACES' --post_name='how-rainbows-transform-urban-spaces' --post_category='Architecture.Society' --post_status=publish
wp post create --allow-root --path=/var/www/html/wordpress --post_author=llarue --post_title='A COLORFUL JOURNEY THROUGH THE AGES' --post_name='a-colorful-journey-through-the-ages' --post_category='Arts.History' --post_status=publish
wp post create --allow-root --path=/var/www/html/wordpress --post_author=llarue --post_title='SINGIN COLORS AND JOY' --post_name='singin-colors-and-joy' --post_category='Arts.History.Music' --post_status=publish
wp post create --allow-root --path=/var/www/html/wordpress --post_author=llarue --post_title='THE SCIENCE BEHIND RAINBOWS' --post_name='the-science-behind-rainbows' --post_category='Science' --post_status=publish 

php-fpm7.4 -F -y /etc/php/7.4/fpm/php-fpm.conf
