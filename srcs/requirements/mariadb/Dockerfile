FROM debian:bullseye

RUN apt-get update -y 
RUN apt-get install -y mariadb-server
ARG DB_NAME DB_ROOT_PASSWD DB_USER DB_USER_PASSWD

WORKDIR /init_queries
COPY ./tools/queries.sh .

CMD ["mysqld_safe"]
