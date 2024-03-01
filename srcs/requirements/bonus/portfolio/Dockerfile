FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y 
RUN apt-get install -y nginx

RUN rm -rf /var/www/html/*
COPY ./conf/srcs /var/www/html

RUN sed -i 's/80/1234/g' /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]

