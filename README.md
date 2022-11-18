# About this Repo

This is Ungerware's fork of xenon-middleware/xenon-docker-images, a set of Docker images for deploying a simple SLURM cluster.

These files have updated base images to enable more recent Python versions compatible with AWS's [boto3](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html) package, a Python interface to their service API.

These images are in turn used by the Docker images in the [Ungerware slurmR fork](https://github.com/Ungerware/slurmR), which are useful for providing a local/dev-environment SLURM headnode and minimal cluster for testing.


The image hierarchy is orchestrated by docker-bake.hcl, allowing any local changes to end up in the final `slurm-packaged` target without having to do releases of the intermediate images.

## Local build
```
docker buildx bake
```

## Release build
Create a release in the Github repo. The [Github Workflow](https://docs.github.com/en/actions/using-workflows) under `.github/workflows/github-actions-release.yml` will deploy the built image to ghcr.io.
