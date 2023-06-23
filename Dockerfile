FROM golang:1.16-alpine AS builder

WORKDIR /app
COPY . .
RUN go build -o myapp

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/myapp .

CMD ["./myapp"]
