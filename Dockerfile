FROM golang:1.20 AS build

WORKDIR /app

COPY . .

RUN go build -o /main main.go

FROM scratch

WORKDIR /

COPY --from=build /main /main

ENTRYPOINT ["/main"]