#!/bin/bash

gid=$(stat -c %g /var/run/docker.sock) &&
gname=$(getent group | grep ${gid} | cut -d: -f1) &&
if [ -z "${gname}" ]; then
	groupmod -g ${gid} docker && usermod -aG docker gitlab-runner
else
	usermod -aG ${gname} gitlab-runner
fi &&
exec gitlab-ci-multi-runner "$@" 
