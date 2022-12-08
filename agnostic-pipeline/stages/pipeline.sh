#!/usr/bin/env bash
set -e

echo
echo "Prepage CI/CD pipeline"

set -x

CONFIG_PATH="$PROJECT_DIR/.env"
cat "${CONFIG_PATH}"
source "${CONFIG_PATH}"

IMAGE="${PIPELINE_REGISTRY}/${PIPELINE_ACCOUNT}/${PIPELINE_APP_NAME}:${PIPELINE_TAG_NAME}"

if [[ ! -z "${DOCKER_PASSWORD}" ]]
then
    # cloud running
    echo "${DOCKER_PASSWORD?:}" | docker login -u "${PIPELINE_ACCOUNT?:}" --password-stdin "${PIPELINE_REGISTRY}"
else
    # local running
    docker login
fi
docker build -t "${IMAGE}" -f "${PIPELINE_APP_NAME}/Dockerfile.prod" "./${PIPELINE_APP_NAME}"
docker push "${IMAGE}"


