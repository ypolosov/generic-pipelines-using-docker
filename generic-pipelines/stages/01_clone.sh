#!/usr/bin/env bash
set -e

echo
echo "Cloning Application"

pushd "$PROJECT_DIR"

repository=$(jq -r .clone.repository pipeline.json)

git clone "${repository:?}" .

popd