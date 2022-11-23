#!/bin/bash

NODE=${SLURM_NODE_NAME:-slurm-worker-0}

mkdir -p /run/slurm/
chown -R slurm:root /run/slurm
mkdir -p /var/log/slurm
chown -R slurm:root /var/log/slurm

# intentionally run as root
# see https://slurm.schedmd.com/quickstart_admin.html
exec /usr/sbin/slurmd -D -N $NODE > /var/log/slurm/slurmd-${NODE}.out.log 2> /var/log/slurm/slurmd-${NODE}.err.log
