DCOMPOSE = docker compose
SRC = srcs/docker-compose.yml

up : volume
	$(DCOMPOSE) -f $(SRC) up -d

build : volume
	$(DCOMPOSE) -f $(SRC) up --build -d 

stop:
	$(DCOMPOSE) -f $(SRC) stop

down:
	$(DCOMPOSE) -f $(SRC) down

down-v:
	$(DCOMPOSE) -f $(SRC) down -v

ps:
	docker ps

ps-a:
	docker ps -a

volume:
	if [ ! -d /home/${USER}/data/wordpress ];then sudo mkdir -p /home/${USER}/data/wordpress; fi
	if [ ! -d /home/${USER}/data/mariadb ];then sudo mkdir -p /home/${USER}/data/mariadb; fi

fclean: down-v
	sudo rm -rf /home/${USER}/data
	docker system prune -af

re: fclean build
