FROM debian:bullseye
RUN apt update -y && apt upgrade -y \
    && apt install -y nginx \
    openssl

COPY tools/openssl.sh /
RUN chmod gu+x openssl.sh && ./openssl.sh 
RUN rm /etc/nginx/sites-available/default
COPY conf/default /etc/nginx/sites-available/default
#RUN chmod 777 /etc/nginx/sites-available/default
#RUN service nginx start

#CMD ["tail", "-f"]
CMD ["nginx", "-g", "daemon off;"]
