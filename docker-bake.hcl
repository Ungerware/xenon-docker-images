# docker-bake.hcl
# see https://github.com/docker/buildx/blob/master/docs/manuals/bake/file-definition.md

group "default" {
  targets = ["slurm-packaged"]
}

target "slurm-packaged" {
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
