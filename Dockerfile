FROM alpine:latest as production

LABEL maintainer=amelia@dorks.io

ADD harden.sh ./harden.sh

RUN apk --update add ca-certificates \
    && update-ca-certificates \
    && rm -rf /var/cache/apk/* \
    && sh ./harden.sh \
    && rm ./harden.sh
