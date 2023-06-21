FROM golang:1.19-alpine
WORKDIR /usr/src/app

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
COPY go.mod desafioGo.go ./
RUN go mod download && go mod verify

COPY . .
#RUN go build -v -o /usr/local/bin/app ./...

CMD ["go run desafioGo.go"]