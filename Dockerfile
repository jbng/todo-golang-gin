############################
# STEP 1 build executable binary
############################
ARG PORT
ARG RELEASE
FROM golang:alpine AS builder

# Install git.
# Git is required for fetching the dependencies.
RUN apk update && apk add --no-cache git

WORKDIR /home

COPY go.mod go.sum ./

RUN go mod download

COPY ./app ./app
COPY ./infra/config ./infra/config
COPY ./infra/debug ./infra/debug
COPY ./infra/mariadb ./infra/mariadb

RUN ls ./app
# Build the binary.
RUN RELEASE=$RELEASE && CGO_ENABLED=0 GOOS=linux go build -C ./app -o /home/todo-golang-gin

############################
# STEP 2 build a small image
############################
FROM scratch
# Copy our static executable.
COPY --from=builder /home/todo-golang-gin /todo-golang-gin
COPY --from=builder /home/infra/config/.env /.env
COPY --from=builder /home/infra/config/.env.dev /.env.dev
COPY --from=builder /home/infra/config/.env.prod /.env.prod

CMD ./todo-golang-gin -port=$PORT

EXPOSE $PORT

# Run the todo-golang-gin binary.
ENTRYPOINT ["/todo-golang-gin"]