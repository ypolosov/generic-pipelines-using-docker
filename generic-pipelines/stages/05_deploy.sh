#!/usr/bin/env bash

echo
echo "Deploying Application"

container_port=$(jq -r .deploy.containerPort pipeline.json)
registry=$(jq -r .archive.registry pipeline.json)
account=$(jq -r .archive.account pipeline.json)
appName=$(jq -r .archive.appName pipeline.json)
tagName=$(jq -r .archive.tagName pipeline.json)
image="${registry}/${account}/${appName}:${tagName}"

docker run -dp "${container_port}:${container_port}" "${image}"