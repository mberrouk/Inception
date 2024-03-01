#!/bin/bash

rm -f /var/www/html/index.nginx-debian.html
service php7.4-fpm start

if [[ -d /var/www/html && $(ls /var/www/html | wc -l) -eq 0 ]]; then

  wp-cli.phar core download --path=/var/www/html --allow-root

  wp-cli.phar config create --dbname=$DB_NAME --dbuser=$DB_USER --dbhost=mariadb \
    --dbpass=$DB_USER_PASSWD --path=/var/www/html --allow-root

  wp-cli.phar core install --url=$DOMAIN_NAME --title=Inception \
    --admin_user=$DB_USER --admin_password=$DB_USER_PASSWD \
    --admin_email=$USER_EMAIL --path=/var/www/html --allow-root

  wp-cli.phar user create $DB_STD_USER $DB_STD_EMAIL --user_pass=$DB_STD_PASSWD \
    --role=author --path=/var/www/html --allow-root

  # bonus
  wp-cli.phar plugin install redis-cache --activate --path=/var/www/html --allow-root

  chown -R www-data /var/www/html

  wp-cli.phar config set WP_REDIS_HOST "redis" --path=/var/www/html --allow-root
  wp-cli.phar config set WP_REDIS_PORT "6379" --path=/var/www/html --allow-root
  wp-cli.phar redis enable --path=/var/www/html --allow-root

fi

service php7.4-fpm stop

php-fpm7.4 -F
