all:
	sudo mkdir -p 	~/data
	sudo chmod 777 	~/data
	mkdir 	-p	~/data/mariadb
	sudo chmod 777	~/data/mariadb
	mkdir 	-p	~/data/wordpress
	sudo	chmod 777	~/data/wordpress
	cd srcs &&  sudo docker-compose up --build -d --remove-orphans && cd ..
	sudo docker-compose up &
up:
	cd srcs && sudo  docker-compose up --build -d --remove-orphans && cd ..

down:
	cd srcs && sudo docker-compose down -t 2 && cd ..
	#@rm -rf ~/data/mariadb

fdown:
	cd srcs &&  sudo docker-compose down -t 2 -v && cd ..
	sudo rm -rf ~/data

clean:
	sudo docker-compose down --rmi all
	

.PHONY: up down fdown clean

