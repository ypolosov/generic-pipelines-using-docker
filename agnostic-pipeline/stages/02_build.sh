#!/usr/bin/env bash
set -e

echo
echo "Building Application"

pushd "$PROJECT_DIR"

source '.env' 

popd

npm build





