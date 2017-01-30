FROM ederrm/latex:base-latest
MAINTAINER Eder Ruiz Maria <eder.rm82@gmail.com>

ENV TEX_MODERNCV_PACKAGES \
moderncv \
etoolbox \
xcolor \
ec \
l3packages \
l3kernel \
microtype \
fontawesome \
cm-super \
latex-bin \
colortbl \
tools \
url \
graphics \
oberdiek \
fancyhdr \
geometry \
hyperref \
pgf \
ms \
changepage

RUN set -x \
&& tlmgr update --self --all --reinstall-forcibly-removed \
&& tlmgr install ${TEX_MODERNCV_PACKAGES} \
&& rm -f /opt/texlive/2016/tlpkg/texlive.tlpdb.* \
&& rm -f /opt/texlive/2016/tlpkg/backups/* \
&& find /opt/texlive/2016/ -type f -name '*.log' -delete

WORKDIR /project
