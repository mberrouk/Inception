FROM debian:bullseye
RUN apt update -y && apt upgrade -y \
    && apt install -y nginx \
    openssl \

COPY tools/openssl.sh /
RUN rm /etc/nginx/sites-available/default
COPY conf/default /etc/nginx/sites-available/

RUN service nginx start


CMD ["nginx", "-g", "daemon off;"]
