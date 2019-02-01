FROM confluentinc/cp-kafka-rest:3.1.2

ENV KAFKA_REST_ZOOKEEPER_CONNECT="localhost:2181"
ENV KAFKA_REST_SCHEMA_REGISTRY_URL="http://localhost:8081"
ENV KAFKA_REST_LISTENERS="http://localhost:8082"
ENV KAFKA_REST_HOST_NAME="localhost"

CMD [ "/etc/confluent/docker/run" ]
