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
# export PORT=${port}
# export APP_NAME=${appName}
# docker run -dp "${port}:${port}" "${image}"

deployUser=$(jq -r .deploy.user pipeline.json)
deployHost=$(jq -r .deploy.host pipeline.json)
deployPort=$(jq -r .deploy.port pipeline.json)
docker -H "ssh://${deployUser}@${deployHost}:${deployPort}" run --rm --net host -d -e PORT="${PORT}" APP_NAME="${APP_NAME}" -p "${port}:${port}" "${image}"


popd
