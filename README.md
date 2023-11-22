

# TODO App with REST API CRUD

Experimentation with Golang, Gin, Docker Compose (v2), Mariadb, Krakend...

## Libraries

[MariaDB](https://hub.docker.com/_/mariadb)

[GORM](https://github.com/go-gorm/gorm)

[GIN](https://github.com/gin-gonic/gin)

[Krakend](https://www.krakend.io)

[Compose](https://docs.docker.com/compose)

[Viper](https://pkg.go.dev/github.com/spf13/viper)

# Commands


## run project

`make dev` 

or 

`make prod`

## Clean

`make stop-dev`

or

`make stop-prod`

## run database only

`make db`

## Monitoring

Get container ID

`docker ps` 

Open bash console on a container

`docker exec -it {id_docker_image_instance} bash`

# References

`https://medium.com/@thedevsaddam/build-restful-api-service-in-golang-using-gin-gonic-framework-85b1a6e176f3`

`https://chemidy.medium.com/create-the-smallest-and-secured-golang-docker-image-based-on-scratch-4752223b7324`
