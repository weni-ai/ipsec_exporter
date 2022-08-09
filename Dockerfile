# syntax=docker/dockerfile:1

## Build
FROM golang:1.19.0-bullseye AS build

WORKDIR /build

ENV CGO_ENABLED=0

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY . .

RUN go build -ldflags="-extldflags=-static" -o /ipsec_exporter ./cmd/ipsec_exporter

FROM alpine

WORKDIR /

COPY --from=build /ipsec_exporter /ipsec_exporter

EXPOSE 8080

USER 2000:2000

ENTRYPOINT ["/ipsec_exporter"]

