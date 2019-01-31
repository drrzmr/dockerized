# vim: set ft=dockerfile:
FROM ubuntu:18.04

ENV REDIS_VERSION="3.2.10"

RUN set -eux; \
apt-get -q update; \
apt-get -qy upgrade; \
apt-get -qy dist-upgrade; \
apt-get -qy install --no-install-recommends \
	wget \
	supervisor \
	ruby \
	build-essential; \
wget -qO - https://github.com/antirez/redis/archive/${REDIS_VERSION}.tar.gz | tar -zxC /usr/src; \
cd /usr/src/redis-${REDIS_VERSION}; \
cp src/redis-trib.rb /usr/local/bin; \
export CFLAGS="-Wno-unused-variable -Wno-misleading-indentation -Wno-implicit-fallthrough \
               -Wno-cpp -Wno-expansion-to-defined -Wno-format-overflow"; \
make install; \
cd -; \
rm -rf /usr/src/redis-${REDIS_VERSION}; \
gem install redis -v 3.3.3; \
apt-get -qy remove --purge --autoremove \
	wget \
	build-essential; \
rm -rf /var/lib/apt/lists/*; \
mkdir -p /data/redis

COPY entrypoint.sh /entrypoint.sh

EXPOSE 7001/tcp 7002/tcp 7003/tcp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["redis-cluster"]
