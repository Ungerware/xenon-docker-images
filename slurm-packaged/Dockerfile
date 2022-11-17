# syntax=docker/dockerfile:1
FROM xenonmiddleware/slurm-abstract

# just get the packaged version of slurm
RUN apt-get update && \
    apt-get --no-install-recommends install -y slurm-wlm

# ADD slurm.conf from context to sysconfig directory
ADD slurm.conf /usr/local/etc/slurm/slurm.conf

