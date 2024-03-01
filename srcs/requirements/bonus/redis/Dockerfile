FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y 
RUN apt-get install -y redis-server

RUN rm /etc/redis/redis.conf
COPY ./conf/redis.conf /etc/redis/

CMD ["redis-server", "--protected-mode no"]
