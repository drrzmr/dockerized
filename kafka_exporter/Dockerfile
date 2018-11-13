FROM golang:1.11.2-stretch as builder
ENV RELEASE="1.3.0-rc2"
WORKDIR /opt
RUN set -eux; \
wget https://github.com/drrzmr/kafka_exporter/archive/v${RELEASE}.tar.gz; \
tar xvf v${RELEASE}.tar.gz; \
cd kafka_exporter-${RELEASE}; \
go build; \
strip -s kafka_exporter; \
cp kafka_exporter /usr/local/bin/kafka_exporter

FROM debian:stretch-slim
COPY --from=builder /usr/local/bin/kafka_exporter /usr/local/bin/kafka_exporter
CMD /usr/local/bin/kafka_exporter
