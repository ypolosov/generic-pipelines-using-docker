#!/usr/bin/env bash
set -e

echo
echo "Building Application"

pushd "$PROJECT_DIR"

appType=$(jq -r .application.type pipeline.json)

popd

case "${appType}" in
  "java")
    mvn clean package
    ;;
  "netcore")
    dotnet restore
    dotnet build -c Release
    ;;
  "node")
    npm build
    ;;
  *)
    echo "Unable to build application type ${appType}"
    exit 1
    ;;
esac



