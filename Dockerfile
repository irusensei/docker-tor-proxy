FROM docker.io/alpine:3.15.0
MAINTAINER iru@despera.space
EXPOSE 9050 9051
RUN apk update && apk upgrade && apk add tor torsocks && rm -rf /var/cache/apk/* /tmp/* /var/tmp/*
VOLUME ["/var/lib/tor"]
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
USER tor
ENTRYPOINT ["/entrypoint.sh"]
