include .env
export

LOCAL_BIN:=$(CURDIR)/bin
PATH:=$(LOCAL_BIN):$(PATH)
	
start:
	docker compose up

stop:
	docker compose down

test:
	go test ./...

docker:
	docker build -t todo-golang-gin-build .

docker-run:
	docker run -d -p 9000:9000 todo-golang-gin-build