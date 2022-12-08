#!/usr/bin/env bash
set -e

echo
echo "Testing Application"

pushd "$PROJECT_DIR"

source '.env' 

popd

npm run test


