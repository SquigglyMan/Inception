## localhost

To work on self hosted domain/server/url you need to add it in your localhost file : `/etc/hosts` in the format of `[ip address] [domain name]

---


## .env
```
# mariadb
MYSQL_DATABASE=inception_db
MYSQL_USER=llarue

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
```

---

## secrets
```
db_root_password.txt
db_password.txt
```

---

sudo docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_name_or_id>
mysql -uroot -pmariadbRootPassword! -h $(sudo docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_name_or_id>)