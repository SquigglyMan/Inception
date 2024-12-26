IF you get an error, pin down what is causing it and what does it break. !!! before trying to fix it !!!

sudo docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_name_or_id>
mysql -uroot -pmariadbRootPassword! -h $(sudo docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_name_or_id>)

change /etc/hosts and add 127.0.0.0	localhost llarue.42.fr in vm

-----------------------------------------------------------------------------------------------------------------------------------------------------

.env :
DOMAIN_NAME=llarue.42.fr

# mariadb
MYSQL_DATABASE=inception_db
MYSQL_USER=llarue
# MYSQL_PASSWORD=mariadbpasswd
# MYSQL_ROOT_PASSWORD=mariadbRootPassword!

# wordpress
DOMAIN_NAME=llarue.42.fr
WP_TITLE=Inception with dockers
WP_ADMIN=admin-ll
WP_ADMIN_PASSWORD=adminPasswdLL
WP_ADMIN_EMAIL=admin@admin.com

WP_USER=llarue
WP_EMAIL=test@test.com
WP_PASSWD=1234passwd
WP_USER_ROLE=contributor