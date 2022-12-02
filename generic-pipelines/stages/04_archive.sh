#!/usr/bin/env bash
set -e

echo
echo "Archiving Application"

pushd "$PROJECT_DIR"

registry=$(jq -r .archive.registry pipeline.json)
account=$(jq -r .archive.account pipeline.json)
appName=$(jq -r .archive.appName pipeline.json)
tagName=$(jq -r .archive.tagName pipeline.json)
image="${registry}/${account}/${appName}:${tagName}"

if [[ ! -z "${DOCKER_PASSWORD}" ]]
then
    # cloud running
    echo "${DOCKER_PASSWORD?:}" | docker login -u "${account?:}" --password-stdin "${registry}"
else
    # local running
    docker login
fi
docker build -t "${image}" .
docker push "${image}"

popd