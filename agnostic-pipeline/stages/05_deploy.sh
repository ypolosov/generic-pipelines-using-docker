#!/usr/bin/env bash
set -e

echo
echo "Deploying Application"

set -x

CONFIG_PATH="$PROJECT_DIR/.env"
cat "${CONFIG_PATH}"
source "${CONFIG_PATH}"

IMAGE="${ARCHIVE_REGISTRY}/${ARCHIVE_ACCOUNT}/${ARCHIVE_APP_NAME}:${ARCHIVE_TAG_NAME}"

SSH_AUTH_SOCK=/tmp/ssh_agent.sock
mkdir -p ~/.ssh
ssh-keyscan -p ${DEPLOY_PORT} -t rsa ${DEPLOY_HOST} >> ~/.ssh/known_hosts
ssh-agent -a ${SSH_AUTH_SOCK} > /dev/null
ssh-add - <<< "${SSH_PRIVATE_KEY}"

docker -H "ssh://${DEPLOY_USER}@${DEPLOY_HOST}:${DEPLOY_PORT}" run --rm -d --net host -e "PORT=${APP_PORT}" -e "APP_NAME=${APP_NAME}" "${IMAGE}"

