#!/bin/bash 

[ -n "${HOST:-}" ] && \
	export HOST="${HOST}-${HOSTNAME}" || true

exec ${@}
