FROM confluentinc/cp-schema-registry:3.1.2

ENV SCHEMA_REGISTRY_LISTENERS="http://localhost:8081"
ENV SCHEMA_REGISTRY_KAFKASTORE_CONNECTION_URL="localhost:2181"
ENV SCHEMA_REGISTRY_HOST_NAME="localhost"

COPY entrypoint.sh /entrypoint.sh

CMD [ "/etc/confluent/docker/run" ]

ENTRYPOINT [ "/entrypoint.sh" ]
