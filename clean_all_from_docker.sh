#!/bin/bash

C="\e[1;46m$(tput bold)"
C1="\e[1;42m$(tput bold)"
C2="\e[1;44m$(tput bold)"
R="\e[0;0m"


if [ $(ls | grep "docker-compose.yma*l") ]; then
	echo -e "${C}  COMPOSE DOWN  ${R}"
	docker compose down
fi

echo -e "${C}  STOP ALL CONTAIANERS  ${R}"
if [ $(docker ps -aq | wc -l) != 0 ]; then
	docker stop $(docker ps -aq)
fi

echo -e "${C}  REMOVE CONTAINERS  ${R}"
if [ $(docker ps -aq | wc -l) != 0 ]; then
	docker rm $(docker ps -aq)
fi

echo -e "${C}  REMOVE ALL IMAGES  ${R}"
if [ $(docker image ls -aq | wc -l) != 0 ]; then
	docker image rm -f $(docker image ls -aq)
fi

echo -e "${C}  REMOVE ALL VOLUMES  ${R}"
if [ $(docker volume ls -q | wc -l) != 0 ]; then
	docker volume rm -f $(docker volume ls -q) 
fi

echo -e "${C}  REMOVE ALL NETWORKS  ${R}"
if [ $(docker network ls -q | wc -l) != 3 ]; then
	docker network rm $(docker network ls -q)
fi

echo -e "${C}  REMOVE BUILDER CACHE  ${R}"
docker builder prune -af

echo -e "${C}  REMOVE IMAGE CACHE  ${R}"
docker image prune -af

echo -e "${C}  REMOVE VOLUME CACHE  ${R}"
docker volume prune -af

echo -e "${C}  REMOVE NETWORK CACHE  ${R}"
docker network prune -f

echo -e "${C1}  SHOULD NOW BE ALL FRESH AND CLEAN  ${R}"

echo -e "${C1}  THE FOLLOWING COMMANDS SHOULD NOT OUTPUT ANY ITEMS  ${R}"

echo -e "${C2}  ----> docker ps -a  ${R}"
docker ps -a

echo -e "${C2}  ----> docker images ls -a  ${R}"
docker image ls -a

echo -e "${C2}  ----> docker volumes ls -a  ${R}"
docker volume ls

echo -e "${C2}  ----> docker network ls [show only the default networks]  ${R}"
docker network ls

