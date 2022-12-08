#!/usr/bin/env bash
set -e

echo
echo "Testing Application"

source "$PROJECT_DIR/.env"

npm run test


