Référence
===
https://medium.com/@thedevsaddam/build-restful-api-service-in-golang-using-gin-gonic-framework-85b1a6e176f3

Exemple simple d'une application TODO avec le framework web GIN
===
Golang Gin Docker Compose Mariadb

API REST CRUD classique

Base de données
==
ORM MySQL: github.com/jinzhu/gorm

Utilisation de MariaDB : https://store.docker.com/images/mariadb

Utilisation de docker-compose pour instancier la base de données

Chargement du script d'initialisation de base de données.

Ne pas oublier l'export du port de la base de donnée pour y avoir accès en dehors de l'image docker 

Command
==
docker-compose up

go build main.go

./main

Clean
==
docker-compose down

Monitoring
==
docker ps 
=> obtenir l'id de l'instance de l'image docker lancée

docker exec -it {id_docker_image_instance} bash
