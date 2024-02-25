#!/bin/bash

service php7.4-fpm start
wp-cli.phar core download --path=/var/www/html --allow-root

wp-cli.phar config create --dbname=$DB_NAME --dbuser=$DB_USER --dbhost=mariadb \
       	--dbpass=$DB_USER_PASSWD --path=/var/www/html --allow-root

wp-cli.phar core install --url=$DOMAIN_NAME --title=Inception \
       	--admin_user=$DB_USER --admin_password=$DB_USER_PASSWD \
       	--admin_email=$USER_EMAIL --path=/var/www/html --allow-root

wp-cli.phar user create $DB_STD_USER $DB_STD_EMAIL --user_pass=$DB_STD_PASSWD \
       	--role=author --path=/var/www/html --allow-root

service php7.4-fpm stop

php-fpm7.4 -F
