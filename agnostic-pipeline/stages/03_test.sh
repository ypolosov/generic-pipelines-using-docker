#!/usr/bin/env bash
set -e

echo
echo "Testing Application"

set -x

CONFIG_PATH="$PROJECT_DIR/.env"
cat "${CONFIG_PATH}"
source "${CONFIG_PATH}"

node "$PROJECT_DIR/index.spec.js"