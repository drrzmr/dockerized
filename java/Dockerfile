FROM drrzmr/base:18.04-2

ENV SDKMAN_DIR="/opt/sdkman"

RUN set -eux; \
apt-get -q update; \
apt-get -qy upgrade; \
apt-get -qy dist-upgrade; \
apt-get -qy install unzip zip curl; \
apt-get clean; \
rm -rf /var/lib/apt/lists; \
curl -s "https://get.sdkman.io" | bash

COPY sdkman.config ${SDKMAN_DIR}/etc/config

ENV ORACLE_JDK_VERSION="8.0.201"

SHELL [ "bash", "-c" ]

RUN set -e; \
source "${SDKMAN_DIR}/bin/sdkman-init.sh"; \
yes | sdk install java "${ORACLE_JDK_VERSION}-oracle"; \
sdk flush broadcast; \
sdk flush archives; \
sdk flush temp

COPY sdkman.profile /etc/profile.d/20-sdkman.sh
