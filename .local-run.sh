#!/usr/bin/env sh
set -e

PROJECT_DIR=app-2

docker run \
    --env PROJECT_DIR="${PROJECT_DIR}" \
    --env REPOSITORY_URL=https://github.com/ypolosov/generic-pipelines-using-docker.git \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v ~/.docker:/root/.docker \
    -v ~/.ssh:/root/.ssh \
    docker.io/ypolosov/agnostic-pipeline \
    /stages/00_run.sh

