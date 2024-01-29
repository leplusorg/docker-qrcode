FROM alpine:3.19.1

# hadolint ignore=DL3018
RUN apk --update --no-cache add libqrencode-tools \
    && rm -rf /var/cache/apk/*
