FROM debian:jessie-slim
MAINTAINER Eder Ruiz Maria <eder.rm82@gmail.com>

ENV DEBIAN_FRONTEND="noninteractive"

ENV PKGS_BASE="curl apt-transport-https ca-certificates"
ENV PKGS_DOCKER_ENGINE="docker-engine"
ENV PKGS_GITLAB_RUNNER="gitlab-ci-multi-runner"

WORKDIR /etc/apt/sources.list.d
RUN set -x \
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
&& usermod -aG docker,staff gitlab-runner \
&& rm -rf /var/lib/apt/lists/*

WORKDIR /home/gitlab-runner
VOLUME ["/etc/gitlab-runner", "/home/gitlab-runner"]
ENTRYPOINT ["gitlab-ci-multi-runner"]
CMD ["run", "--user=gitlab-runner", "--working-directory=/home/gitlab-runner"]
