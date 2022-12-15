#!/usr/bin/env bash
set -e

echo
echo "Deploying Application"

set -x

CONFIG_PATH="$PROJECT_DIR/.env"
cat "${CONFIG_PATH}"
source "${CONFIG_PATH}"

IMAGE="${ARCHIVE_REGISTRY}/${ARCHIVE_ACCOUNT}/${ARCHIVE_APP_NAME}:${ARCHIVE_TAG_NAME}"

docker -H "ssh://${DEPLOY_USER}@${DEPLOY_HOST}:${DEPLOY_PORT}" run --rm -d -p "${APP_PORT}:${APP_PORT}" -e "APP_PORT=${APP_PORT}" -e "APP_NAME=${APP_NAME}" "${IMAGE}"

