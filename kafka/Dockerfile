# vim: set ft=dockerfile:
FROM drrzmr/java:8.0.201-1

ENV KAFKA_VERSION="0.10.1.1"

RUN set -eux; \
curl -s https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_2.11-${KAFKA_VERSION}.tgz | tar zxC /opt; \
ln -s /opt/kafka_2.11-${KAFKA_VERSION} /opt/kafka

COPY server.properties /opt/kafka/config/server.properties

RUN mkdir -p /data

VOLUME /data/kafka

ENV PATH="${PATH}:/opt/kafka/bin"

EXPOSE 9092/tcp

CMD [ "kafka-server-start.sh", "/opt/kafka/config/server.properties" ]
