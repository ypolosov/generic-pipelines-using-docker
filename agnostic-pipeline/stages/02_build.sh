#!/usr/bin/env bash
set -e

echo
echo "Building Application"

CONFIG_PATH="$PROJECT_DIR/.env"
cat "${CONFIG_PATH}"
source "${CONFIG_PATH}"

npm run build





