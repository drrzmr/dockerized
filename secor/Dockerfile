FROM drrzmr/java:8.0.201-2

ENV SECOR_VERSION="0.27"
ENV SECOR_ETC="/etc/secor"

ENV SECOR_HOME="/opt/secor-v${SECOR_VERSION}"
ENV SECOR_PROPERTIES="${SECOR_ETC}/secor.properties"
ENV LOG4J_PROPERTIES="${SECOR_ETC}/log4j.properties"
ENV SECOR_TARBALL_URL="https://github.com/chaordic/secor/releases/download/v${SECOR_VERSION}/secor-${SECOR_VERSION}-bin.tar.gz"

RUN set -eux; \
mkdir -p ${SECOR_ETC} ${SECOR_HOME}; \
curl --silent --location ${SECOR_TARBALL_URL} | tar zxC ${SECOR_HOME}

COPY docker-entrypoint.d/30-secor /docker-entrypoint.d/30-secor
COPY secor.properties ${SECOR_PROPERTIES}
COPY log4j.properties ${LOG4J_PROPERTIES}
COPY run-secor.sh /usr/local/bin/run-secor.sh

CMD [ "run-secor.sh" ]

ENV SECOR_PLUGINS="/opt/secor-plugins"
COPY platform-secor-plugins-0.0.2-SNAPSHOT.jar ${SECOR_PLUGINS}/
