#!/bin/bash

# gitlab-ci-multi-runner data directory
DATA_DIR="/etc/gitlab-runner"
CONFIG_FILE=${CONFIG_FILE:-$DATA_DIR/config.toml}

# custom certificate authority path
CA_CERTIFICATES_PATH=${CA_CERTIFICATES_PATH:-$DATA_DIR/certs/ca.crt}
LOCAL_CA_PATH="/usr/local/share/ca-certificates/ca.crt"

update_ca() {
  echo "Updating CA certificates..."
  cp "${CA_CERTIFICATES_PATH}" "${LOCAL_CA_PATH}"
  update-ca-certificates --fresh >/dev/null
}

fix_docker_group() {
  local group_id=$(stat -c %g /var/run/docker.sock) &&
  local group_name=$(getent group | grep ${group_id} | cut -d: -f1) &&
  if [ -z "${group_name}" ]; then
    groupmod -g ${group_id} docker
    usermod -aG docker gitlab-runner
  else
    usermod -aG ${group_name} gitlab-runner
  fi
}

if [ -f "${CA_CERTIFICATES_PATH}" ]; then
  # update the ca if the custom ca is different than the current
  cmp --silent "${CA_CERTIFICATES_PATH}" "${LOCAL_CA_PATH}" || update_ca
fi

fix_docker_group

# launch gitlab-ci-multi-runner passing all arguments
exec gitlab-ci-multi-runner "$@"
