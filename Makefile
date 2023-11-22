LOCAL_BIN:=$(CURDIR)/bin
PATH:=$(LOCAL_BIN):$(PATH)

db:
	docker compose --env-file ./infra/config/.env.dev run db

run-app:
	docker compose --env-file ./infra/config/.env.dev run app

build-dev:
	docker compose --env-file ./infra/config/.env.dev build --no-cache app

dev:
	docker compose --env-file ./infra/config/.env.dev up

stop-dev:
	docker compose --env-file ./infra/config/.env.dev down

prod:
	docker compose --env-file ./infra/config/.env.prod up

build-prod:
	docker compose --env-file ./infra/config/.env.prod build --no-cache app

stop-prod:
	docker compose --env-file ./infra/config/.env.prod down

test:
	go test ./...