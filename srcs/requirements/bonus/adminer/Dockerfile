FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install adminer -y
RUN apt -y install php php-common \
    php-pear php-mbstring libapache2-mod-php php-mysql

RUN apt -y install apache2 wget

RUN wget -O /var/www/html/adminer.php \
  https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

RUN sed -i 's/localhost/mariadb/' /var/www/html/adminer.php

CMD ["apache2ctl", "-D",  "FOREGROUND"]
