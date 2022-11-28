#!/usr/bin/env bash

echo
echo "Building Application"

pushd "$PROJECT_DIR"


application_type=$(jq -r .application.type pipeline.json)

set -x

case "${application_type}" in
  "java")
    mvn clean package
    ;;
  "netcore")
    dotnet restore
    dotnet build -c Release
    ;;
  "node")
    npm ci
    ;;
  *)
    echo "Unable to build application type ${application_type}"
    exit 1
    ;;
esac

set +x

popd
