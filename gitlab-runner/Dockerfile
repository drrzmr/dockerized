FROM debian:jessie-slim
MAINTAINER Eder Ruiz Maria <eder.rm82@gmail.com>

ENV DEBIAN_FRONTEND="noninteractive"

ENV PKGS_BASE="curl apt-transport-https ca-certificates"
ENV PKGS_DOCKER_ENGINE="docker-engine=1.12.6-0~debian-jessie"
ENV PKGS_GITLAB_RUNNER="gitlab-ci-multi-runner=1.10.4"

ADD https://github.com/Yelp/dumb-init/releases/download/v1.0.2/dumb-init_1.0.2_amd64 /usr/bin/dumb-init
ADD https://github.com/docker/compose/releases/download/1.11.0/docker-compose-Linux-x86_64 /usr/bin/docker-compose
ADD entrypoint.sh /entrypoint.sh

WORKDIR /etc/apt/sources.list.d
RUN set -x \
&& chmod +x \
	/usr/bin/dumb-init \
	/entrypoint.sh \
&& chmod 755 /usr/bin/docker-compose \
&& apt-get -qy update \
&& apt-get -qy upgrade \
&& apt-get -qy dist-upgrade \
&& apt-get -qy install --no-install-recommends --no-install-suggests ${PKGS_BASE} \
&& curl -fsSL https://yum.dockerproject.org/gpg |  apt-key add - \
&& curl -fsSL https://packages.gitlab.com/runner/gitlab-ci-multi-runner/gpgkey |  apt-key add - \
&& echo "deb https://apt.dockerproject.org/repo/ debian-jessie main" > docker-engine.list \
&& echo "deb https://packages.gitlab.com/runner/gitlab-ci-multi-runner/debian/ jessie main" > gitlab-runner.list \
&& apt-get -qy update \
&& apt-get -qy install --no-install-recommends --no-install-suggests ${PKGS_DOCKER_ENGINE} \
&& apt-get -qy install --no-install-recommends --no-install-suggests ${PKGS_GITLAB_RUNNER} \
&& mkdir -p /etc/gitlab-runner/certs \
&& chmod -R 700 /etc/gitlab-runner  \
&& rm -rf /var/lib/apt/lists/*

ENV CONFIG_CONCURRENT="1"
ENV CONFIG_CHECK_INTERVAL="60"

WORKDIR /home/gitlab-runner
VOLUME ["/etc/gitlab-runner", "/home/gitlab-runner"]
ENTRYPOINT ["/usr/bin/dumb-init", "/entrypoint.sh"]
CMD ["run", "--user=gitlab-runner", "--working-directory=/home/gitlab-runner"]
