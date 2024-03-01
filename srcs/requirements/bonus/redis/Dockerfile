FROM debian:bullseye

RUN apt update -y && apt upgrade -y \ 
  && apt install -y redis-server

RUN rm /etc/redis/redis.conf
COPY ./redis.conf /etc/redis/

CMD ["redis-server", "--protected-mode no"]
