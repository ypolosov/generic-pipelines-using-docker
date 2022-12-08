#!/usr/bin/env bash
set -e

echo
echo "Testing Application"

CONFIG_PATH="$PROJECT_DIR/.env"
cat "${CONFIG_PATH}"
source "${CONFIG_PATH}"

npm run test


