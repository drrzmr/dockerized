#!/bin/bash

DOCKER_ENTRYPOINT_DIR="/docker-entrypoint.d"

[[ -d ${DOCKER_ENTRYPOINT_DIR} ]] && /bin/run-parts --verbose ${DOCKER_ENTRYPOINT_DIR}

exec ${@}
