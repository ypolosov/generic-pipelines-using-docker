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
set -x

# IMPORTANT !!! https://circleci.com/docs/github-integration/#establish-the-authenticity-of-an-ssh-host
ssh-keyscan -p "${deployPort}" "${deployHost}" >> ~/.ssh/known_hosts
docker -H "ssh://${deployUser}@${deployHost}:${deployPort}" run --rm -d -p "${port}:${port}" -e="PORT=${port}" -e="APP_NAME=${appName}" "${image}"


popd
