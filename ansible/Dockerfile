FROM debian:stretch-slim

RUN set -eux; \
apt-get -q update; \
apt-get -qy upgrade; \
apt-get -qy dist-upgrade; \
apt-get -qy install --no-install-recommends --no-install-suggests python3-pip; \
apt-get -qy purge --auto-remove; \
rm -rf /var/lib/apt/lists/*

ENV SETUPTOOLS_VERSION="39.2.0"
ENV WHEEL_VERSION="0.31.1"
ENV ANSIBLE_VERSION="2.5.5"
ENV ANSIBLE_LINT_VERSION="3.4.23"

RUN set -eux; \
pip3 --no-cache-dir install setuptools==${SETUPTOOLS_VERSION}; \
pip3 --no-cache-dir install wheel==${WHEEL_VERSION}; \
pip3 --no-cache-dir install ansible==${ANSIBLE_VERSION}; \ 
pip3 --no-cache-dir install ansible-lint==${ANSIBLE_LINT_VERSION}