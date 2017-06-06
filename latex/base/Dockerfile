FROM debian:stretch-slim
MAINTAINER Eder Ruiz Maria <drrzmr@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV PATH ${PATH}:/opt/texlive/2016/bin/x86_64-linux
COPY texlive.profile /tmp 

ENV TEX_BASE_DEBIAN_PACKAGES \
wget \
gnupg \
perl-modules-5.24 \
libperl5.24


RUN set -x \
&& apt-get update \
&& apt-get -yq upgrade \
&& apt-get -yq install --no-install-recommends --no-install-suggests ${TEX_BASE_DEBIAN_PACKAGES} \
&& mkdir /tmp/install-tl \
&& wget -q -O - http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar -xz -C /tmp/install-tl \
&& INSTALLER_DIR=$(ls -1 /tmp/install-tl) \
&& /tmp/install-tl/${INSTALLER_DIR}/install-tl --profile /tmp/texlive.profile \
&& tlmgr update --self --all --reinstall-forcibly-removed \
&& rm -f /opt/texlive/2016/tlpkg/texlive.tlpdb.* \
&& rm -f /opt/texlive/2016/tlpkg/backups/* \
&& find /opt/texlive/2016/ -type f -name '*.log' -delete \
&& apt-get -yq autoremove --purge \
&& apt-get -yq clean \
&& apt-get -yq autoclean \
&& rm -rf /var/lib/apt/lists/* \
&& rm -rf /tmp/*
