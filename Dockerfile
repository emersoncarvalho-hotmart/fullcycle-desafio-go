FROM golang:alpine AS build

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /desafio-go-full-cycle

FROM scratch

WORKDIR /

COPY --from=build /desafio-go-full-cycle /desafio-go-full-cycle

EXPOSE 8080

CMD ["/desafio-go-full-cycle"]
