FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y php7.4 php7.4-fpm php7.4-mysql php-phar \
	mariadb-client curl php-mbstring php-xml php-tokenizer 

RUN mkdir -p /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /bin/wp-cli.phar

RUN sed -i 's/^listen.=.*/listen\t= 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/wp-setup.sh /
RUN chmod gu+x /wp-setup.sh

CMD ["/wp-setup.sh"]
