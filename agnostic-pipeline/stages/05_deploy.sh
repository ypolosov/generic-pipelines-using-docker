#!/usr/bin/env bash
set -e

echo
echo "Deploying Application"

set -x

CONFIG_PATH="$PROJECT_DIR/.env"
cat "${CONFIG_PATH}"
source "${CONFIG_PATH}"

IMAGE="${ARCHIVE_REGISTRY}/${ARCHIVE_ACCOUNT}/${ARCHIVE_APP_NAME}:${ARCHIVE_TAG_NAME}"


if [[ ! -e ~/.ssh/known_hosts ]]; then
    mkdir -p ~/.ssh && touch ~/.ssh/known_hosts
fi
# IMPORTANT !!! https://circleci.com/docs/github-integration/#establish-the-authenticity-of-an-ssh-host
ssh-keyscan -p "${DEPLOY_PORT}" "${DEPLOY_HOST}" >> ~/.ssh/known_hosts
# ssh -o StrictHostKeyChecking=no -p ${deployPort} ${deployUser}@${deployHost}
docker -H "ssh://${DEPLOY_USER}@${DEPLOY_HOST}:${DEPLOY_PORT}" run --rm -d --net host -e "PORT=${PORT}" -e "APP_NAME=${APP_NAME}" "${IMAGE}"


