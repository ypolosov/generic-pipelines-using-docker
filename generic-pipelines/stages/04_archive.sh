#!/usr/bin/env bash

echo
echo "Archiving Application"

registry=$(jq -r .archive.registry pipeline.json)
account=$(jq -r .archive.account pipeline.json)
appName=$(jq -r .archive.appName pipeline.json)
tagName=$(jq -r .archive.tagName pipeline.json)
image="${registry}/${account}/${appName}:${tagName}"

docker build -t "${image}" .
docker push "${image}"