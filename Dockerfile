FROM tobi312/rpi-certbot:latest
MAINTAINER Eric Barault (@ebarault)

VOLUME /certs
VOLUME /etc/letsencrypt
EXPOSE 443

RUN apk update && \
	apk add openssl curl

ADD crontab /etc/crontabs
RUN crontab /etc/crontabs/crontab

COPY ./scripts/ /scripts
RUN chmod -R +x /scripts/

ENTRYPOINT ["/scripts/entrypoint.sh"]
