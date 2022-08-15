COMPOSE_FILE = srcs/docker-compose.yml

COMPOSE_CMD_F = docker-compose -f

UP				= up -d
# START			= start -d

.PHONY: all build ps down

all: up  

build:	
	$(COMPOSE_CMD_F) $(COMPOSE_FILE) build

up:
	@mkdir -p srcs/db-data
	$(COMPOSE_CMD_F) $(COMPOSE_FILE) $(UP)

stop:
	$(COMPOSE_CMD_F) $(COMPOSE_FILE) stop

ps: 
	$(COMPOSE_CMD_F) $(COMPOSE_FILE)  ps -a

down: stop
	$(COMPOSE_CMD_F) $(COMPOSE_FILE) down

im:
	$(COMPOSE_CMD_F) $(COMPOSE_FILE) images

rm: down 
	$(COMPOSE_CMD_F) $(COMPOSE_FILE) rm

in:
	docker exec -it $$(docker ps -q) /bin/bash


fclean: down rm  
	echo y | docker system prune
	docker volume rm -f $$(docker volume ls -q)
	rm -rf srcs/db-data
	docker rmi -f $$(docker images -aq)
	@echo
	@echo "containers images volumes"
	@echo "--------deleted----------"

rebuild: down all



# docker system prune - delete all res