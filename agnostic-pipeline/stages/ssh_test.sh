#!/usr/bin/env bash
set -e

pushd "$PROJECT_DIR"

deployUser=$(jq -r .deploy.user pipeline.json)
deployHost=$(jq -r .deploy.host pipeline.json)
deployPort=$(jq -r .deploy.port pipeline.json)
set -x

popd

# IMPORTANT !!! https://circleci.com/docs/github-integration/#establish-the-authenticity-of-an-ssh-host
ssh-keyscan -p ${deployPort} ${deployHost} >> ~/.ssh/known_hosts
ssh ${deployUser}@${deployHost} -p ${deployPort} hostname -f
