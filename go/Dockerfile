FROM golang:1.23.4-alpine3.21 AS builder
WORKDIR /app
COPY . .
RUN go mod download
RUN go build -o main /app/main.go

FROM alpine:3.22.0
WORKDIR /app
COPY --from=builder /app/main .
CMD ["/app/main"]
