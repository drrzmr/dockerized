# vim: set ft=dockerfile:
FROM drrzmr/java:8.0.201-1

ENV CASSANDRA_VERSION="2.1.17"

RUN set -eux; \
apt-get -q update; \
echo "install cqlsh dependence:"; \
apt-get -qy install python-minimal; \
rm -rf /var/lib/apt/lists/*; \
curl -s https://archive.apache.org/dist/cassandra/${CASSANDRA_VERSION}/apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz | tar zxC /opt; \
ln -s /opt/apache-cassandra-${CASSANDRA_VERSION} /opt/cassandra

COPY cassandra.yaml /opt/cassandra/conf/cassandra.yaml
COPY cassandra-env.sh /opt/cassandra/conf/cassandra-env.sh

VOLUME /data/cassandra

ENV PATH="${PATH}:/opt/cassandra/bin"

EXPOSE 9042/tcp

CMD [ "cassandra", "-f" ]
