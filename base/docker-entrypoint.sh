#!/bin/bash
set -e

DOCKER_ENTRYPOINT_DIR="/docker-entrypoint.d"

[[ -d ${DOCKER_ENTRYPOINT_DIR} ]] && /bin/run-parts --exit-on-error --verbose ${DOCKER_ENTRYPOINT_DIR}

set +e
exec ${@}
