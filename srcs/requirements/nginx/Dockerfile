FROM debian:bullseye
RUN apt update -y && apt upgrade -y \
    && apt install -y nginx \
    openssl \
    vim 

RUN service nginx start


CMD ["nginx", "-g", "daemon off;"]
