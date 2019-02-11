FROM ubuntu:18.04

RUN set -eux; \
mkdir -p /docker-entrypoint.d

COPY docker-entrypoint.sh /docker-entrypoint.sh
ONBUILD COPY /docker-entrypoint.d/* /docker-entrypoint.d/

ENTRYPOINT [ "/docker-entrypoint.sh" ]
