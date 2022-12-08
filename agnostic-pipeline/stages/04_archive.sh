#!/usr/bin/env bash
set -e

echo
echo "Archiving Application"

source "$PROJECT_DIR/.env"

IMAGE="${ARCHIVE_REGISTRY}/${ARCHIVE_ACCOUNT}/${ARCHIVE_APP_NAME}:${ARCHIVE_TAG_NAME}"

if [[ ! -z "${DOCKER_PASSWORD}" ]]
then
    # cloud running
    echo "${DOCKER_PASSWORD?:}" | docker login -u "${ARCHIVE_ACCOUNT?:}" --password-stdin "${ARCHIVE_REGISTRY}"
else
    # local running
    docker login
fi
docker build -t "${IMAGE}" -f "${ARCHIVE_APP_NAME}/Dockerfile.prod"
docker push "${IMAGE}"

