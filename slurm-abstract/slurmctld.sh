#!/bin/bash

mkdir -p /run/slurm
chown -R slurm:root /run/slurm
mkdir -p /var/log/slurm
chown -R slurm:root /var/log/slurm
mkdir -p /var/spool/slurm
exec /sbin/setuser slurm /usr/sbin/slurmctld -D -c -vvvv > /var/log/slurm/slurmctld.out.log 2> /var/log/slurm/slurmctld.err.log
