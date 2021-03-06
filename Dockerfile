FROM golang:1.9-alpine as builder

RUN apk --update add git;
RUN go get -d github.com/optiopay/klar
RUN go build ./src/github.com/optiopay/klar

FROM alpine:3.6
EXPOSE 6060

RUN apk add --no-cache ca-certificates
COPY --from=builder /go/klar /klar

ENTRYPOINT ["/klar"]
