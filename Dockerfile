FROM alpine as base

RUN apk add --update curl

RUN curl -sL https://github.com/rancher/container-crontab/releases/download/v0.5.0/container-crontab > /usr/bin/container-crontab && \
    chmod +x /usr/bin/container-crontab

FROM alpine

WORKDIR /

COPY --from=base /usr/bin/container-crontab /usr/bin/container-crontab
COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
