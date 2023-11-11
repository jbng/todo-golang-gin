############################
# STEP 1 build executable binary
############################
FROM golang:alpine
# Install git.
# Git is required for fetching the dependencies.
RUN apk update && apk add --no-cache git

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY ./app/*.go ./
# Build the binary.
RUN CGO_ENABLED=0 GOOS=linux go build -o /todo-golang-gin

EXPOSE 9000

# Run the todo-golang-gin binary.
CMD ["/todo-golang-gin"]