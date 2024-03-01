FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y 
RUN apt-get install -y nginx 
RUN apt-get install -y openssl

COPY tools/openssl.sh /
RUN chmod gu+x openssl.sh && ./openssl.sh 
RUN rm /etc/nginx/sites-available/default
COPY conf/default /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
