# vim: set ft=dockerfile:
FROM drrzmr/java:8.0.201-1

ENV ZOOKEEPER_VERSION="3.4.13"

RUN set -eux; \
curl -s https://apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz | tar zxC /opt; \
ln -s /opt/zookeeper-${ZOOKEEPER_VERSION} /opt/zookeeper

COPY zoo.cfg /opt/zookeeper/conf/zoo.cfg

RUN mkdir -p /data

VOLUME /data/zookeeper

ENV PATH="${PATH}:/opt/zookeeper/bin"

EXPOSE 2181/tcp

CMD [ "zkServer.sh", "start-foreground" ]
