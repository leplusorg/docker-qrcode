FROM alpine:latest

RUN apk --update --no-cache add libqrencode \
    && rm -rf /var/cache/apk/*
