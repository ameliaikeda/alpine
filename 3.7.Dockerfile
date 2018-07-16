FROM amelia/dhparam:latest as dhparam
FROM alpine:3.7 as production

LABEL maintainer=amelia@dorks.io

ADD harden.sh ./harden.sh

COPY --from=dhparam /dhparam.pem /etc/ssl/dhparam.pem

RUN apk --update add ca-certificates \
    && update-ca-certificates \
    && rm -rf /var/cache/apk/* \
    && sh ./harden.sh \
    && rm ./harden.sh
