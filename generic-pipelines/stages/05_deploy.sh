#!/usr/bin/env bash

echo
echo "Deploying Application"

pushd "$PROJECT_DIR"

containerPort=$(jq -r .deploy.containerPort pipeline.json)
registry=$(jq -r .archive.registry pipeline.json)
account=$(jq -r .archive.account pipeline.json)
appName=$(jq -r .archive.appName pipeline.json)
tagName=$(jq -r .archive.tagName pipeline.json)
image="${registry}/${account}/${appName}:${tagName}"
export PORT=${containerPort}
export APP_NAME=${appName}
docker run -dp "${containerPort}:${containerPort}" "${image}"

popd