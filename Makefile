all: up

datadir:
	mkdir -p /home/jeongwok/data/db
	mkdir -p /home/jeongwok/data/wordpress

build: datadir
	docker compose -f ./srcs/docker-compose.yml build

up: datadir
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	docker compose -f ./srcs/docker-compose.yml down

clean: down
	docker system prune -af
	rm -rf /home/jeongwok/data
