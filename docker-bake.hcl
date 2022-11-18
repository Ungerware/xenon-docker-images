# docker-bake.hcl
# see https://github.com/docker/buildx/blob/master/docs/manuals/bake/file-definition.md

group "default" {
  targets = ["slurm-packaged"]
}

# see https://github.com/docker/metadata-action#bake-definition
target "docker-metadata-action" {}

target "slurm-packaged" {
  inherits = ["docker-metadata-action"]
  context = "slurm-packaged"
  contexts = {
    "xenonmiddleware/slurm-abstract" = "target:slurm-abstract"
  }
  tags = ["ghcr.io/ungerware/slurm:dev"]
}

target "slurm-abstract" {
  context = "slurm-abstract"
  contexts = {
    "xenonmiddleware/slurm-ssh" = "target:slurm-ssh"
  }
}

target "slurm-ssh" {
  context = "slurm-ssh"
  contexts = {
    "xenonmiddleware/slurm-fixture" = "target:slurm-fixture"
  }
}

target "slurm-fixture" {
  context = "slurm-fixture"
}

