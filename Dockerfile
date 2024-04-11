
FROM golang:1.19 AS builder

WORKDIR /app


COPY go.* ./
RUN go mod download


COPY ./cmd/apigateway/ ./cmd/apigateway/


RUN CGO_ENABLED=0 GOOS=linux go build -o /api-gateway ./cmd/apigateway/main.go


FROM alpine:latest


RUN apk --no-cache add ca-certificates

WORKDIR /


COPY --from=builder /api-gateway /api-gateway


EXPOSE 8080


CMD ["/api-gateway"]
