FROM golang:1.20

WORKDIR /app

RUN apt-get update && apt-get install -y librdkafka-dev

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY api/ ./api/
COPY cmd/ ./cmd/
COPY internal/ ./internal/
COPY pkg/ ./pkg/

RUN go build -o walletcore ./cmd/walletcore/main.go 

EXPOSE 3002

ENTRYPOINT ["/app/walletcore"]
# CMD ["tail", "-f", "/dev/null"]