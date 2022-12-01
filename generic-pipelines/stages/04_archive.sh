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

# docker login \
#     -u "${DOCKER_USERNAME?:}" \
#     -p "${DOCKER_PASSWORD?:}" \
#     "${registry}"
echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin "${registry}"
docker build -t "${image}" .
docker push "${image}"

popd