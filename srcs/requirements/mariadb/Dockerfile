FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y mariadb-server
ARG DB_NAME DB_ROOT_PASSWD DB_USER DB_USER_PASSWD

WORKDIR /init_queries
COPY ./tools/queries.sh .

RUN chmod gu+x /init_queries/queries.sh \
	    && /init_queries/queries.sh 
RUN sed -i 's/^bind-address.*=.*/bind-address\t= 0.0.0.0/' \
	    /etc/mysql/mariadb.conf.d/50-server.cnf

CMD ["mysqld_safe"]
