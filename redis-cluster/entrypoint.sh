#!/bin/bash

[[ "$1" != "redis-cluster" ]] && exec "$@"

first_port=${REDIS_CLUSTER_FIRST_PORT:-7001}
nodes_count=${REDIS_CLUSTER_NODES_COUNT:-3}
enable_replica=${REDIS_CLUSTER_ENABLE_REPLICA:-false}
ipaddress=$(hostname -I | cut -d" " -f1) # first ipaddress
let max_port=${first_port}+${nodes_count}-1

echo "> FIRST_PORT: [${first_port}]"
echo "> NODES_COUNT: [${nodes_count}]"
echo "> ENABLE_REPLICA: [${enable_replica}]"
echo "> MAX_PORT: [${max_port}]"
echo "> IP_ADDRESS: [${ipaddress}]"

cat << EOF > /data/redis/redis-cluster.conf
bind 0.0.0.0
cluster-enabled yes
cluster-config-file nodes.conf
cluster-node-timeout 5000
cluster-require-full-coverage no
appendonly yes
EOF

param=""
for port in $(seq ${first_port} ${max_port}); do
	mkdir -p "/data/redis/data/${port}"
	rm -f "/data/redis/data/${port}/nodes.conf"

	cat <<- EOF > /etc/supervisor/conf.d/redis-${port}.conf
	[program:redis-${port}]
	command=/usr/local/bin/redis-server /data/redis/redis-cluster.conf --port ${port} --dir /data/redis/data/${port} --loglevel warning
	stdout_logfile=/var/log/supervisor/%(program_name)s.log
	stderr_logfile=/var/log/supervisor/%(program_name)s.log
	autorestart=true
	EOF

	param+="${ipaddress}:${port} "

done

supervisord --configuration /etc/supervisor/supervisord.conf
sleep 3

[[ "x${enable_replica}" != "xfalse" ]] && replicas=1 || replicas=0

set -x
echo "yes" | ruby /usr/local/bin/redis-trib.rb create --replicas ${replicas} ${param}

tail -f /var/log/supervisor/*.log
