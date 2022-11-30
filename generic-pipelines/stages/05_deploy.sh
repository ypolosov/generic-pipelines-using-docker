#!/usr/bin/env bash
set -e

echo
echo "Deploying Application"

pushd "$PROJECT_DIR"

port=$(jq -r .application.port pipeline.json)
registry=$(jq -r .archive.registry pipeline.json)
account=$(jq -r .archive.account pipeline.json)
appName=$(jq -r .archive.appName pipeline.json)
tagName=$(jq -r .archive.tagName pipeline.json)
image="${registry}/${account}/${appName}:${tagName}"
export PORT=${port}
export APP_NAME=${appName}
docker run -dp "${port}:${port}" "${image}"

popd