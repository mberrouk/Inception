##!/bin/bash                                                                                                       
set -ue
service mariadb start
RUN sleep 5
mysql -e "create user if not exists '$DB_USER'@'%' identified by '$DB_USER_PASSWD';"
mysql -e "create database if not exists $DB_NAME;"
mysql -e "grant all privileges on $DB_NAME.* to '$DB_USER'@'%';"
mysql -e "alter user root@'localhost' identified by '$DB_ROOT_PASSWD'; flush privileges;"
