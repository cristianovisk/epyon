FROM golang:1.17.13-alpine3.16 as build
COPY . /app
WORKDIR /app
RUN go build

FROM alpine:3.17.0
COPY --from=build /app/epyon /bin/epyon
ENTRYPOINT [ "/bin/epyon" ]
