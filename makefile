V_DB = /Users/aaammari/Desktop/db
V_WP = /Users/aaammari/Desktop/wp

RM_VLS = $(shell docker volume ls -q)

all: mkdir
	@docker compose -f ./srcs/docker-compose.yml up --build

mkdir:
	@mkdir -p $(V_DB)
	@mkdir -p $(V_WP)

up:
	@docker compose -f ./srcs/docker-compose.yml up

down:
	@docker compose -f ./srcs/docker-compose.yml down

start:
	@docker compose -f ./srcs/docker-compose.yml start

stop:
	@docker compose -f ./srcs/docker-compose.yml stop

clean:
	@docker compose -f ./srcs/docker-compose.yml down --rmi all

fclean: clean
	@docker system prune -af
	@docker volume prune -f
	@docker image prune -af
	@docker container prune -f
	@docker network prune -f
	@sudo rm -fr $(V_DB)
	@sudo rm -fr $(V_WP)
	@if [ "$(RM_VLS)" != "" ]; then docker volume rm $(RM_VLS); fi

re: fclean all

.PHONY: all mkdir clean fclean re