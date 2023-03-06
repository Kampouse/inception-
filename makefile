all:
	sudo mkdir -p 	~/data
	sudo chmod 777 	~/data
	mkdir 	-p	~/data/mariadb
	sudo chmod 777	~/data/mariadb
	mkdir 	-p	~/data/wordpress
	sudo	chmod 777	~/data/wordpress
	#check if docker is installed 
ifeq ($(shell command -v docker 2> /dev/null),)
	make bootstrap host all
endif
	sudo docker-compose up --build -d --remove-orphans && cd ..
	sudo docker-compose up &
up:
	cd srcs && sudo  docker-compose up --build -d --remove-orphans && cd ..

down:
	cd srcs && sudo docker-compose down -t 2 && cd ..

fdown:
	cd srcs &&  sudo docker-compose down -t 2 -v && cd ..
	sudo rm -rf ~/data

clean:
	sudo docker-compose down --rmi all
host:
	( sudo grep "jemartel.42.fr"  /etc/hosts  && echo "already there") || printf  "127.0.1.1	jemartel.42.fr	jemartel" | sudo tee -a /etc/hosts
db:
	sudo docker exec -it mariadb mysql -u jemartel -p  -e "SELECT * FROM wordpress.wp_users;"

.PHONY: up down fdown clean

