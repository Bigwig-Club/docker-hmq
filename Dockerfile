FROM golang:1.14 as builder

ENV GO111MODULE=on
ENV CGO_ENABLED=0
ENV GOPROXY=https://goproxy.io,direct

WORKDIR /build
COPY . .
RUN go mod tidy
RUN go build -o hmq -a -ldflags '-extldflags "-static"' .


FROM alpine:3.8
WORKDIR /hmq
COPY --from=builder /build/hmq .
COPY hmq.config .
RUN chmod +x hmq
EXPOSE 1883

CMD ["./hmq", "-c", "hmq.config"]
