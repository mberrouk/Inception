FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y php7.4 php7.4-fpm php7.4-mysql \
	mariadb-client wget unzip curl

WORKDIR /installations
RUN wget https://wordpress.org/latest.zip
RUN mkdir -p /var/www/html
RUN unzip latest.zip -d /var/www/html && rm -rf latest.zip
RUN chown -R root:root /var/www/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN service php7.4-fpm start

CMD ["php-fpm7.4", "-F"]
