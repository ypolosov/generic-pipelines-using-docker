#!/usr/bin/env bash

echo
echo "Building Application"
ls -la
PIPELINE="${PROJECT_DIR}/pipeline.json"
pwd; pushd "$PROJECT_DIR"

application_type=$(jq -r .application.type $PIPELINE)

case "${application_type}" in
  "java")
    mvn clean package
    ;;
  "netcore")
    dotnet restore
    dotnet build -c Release
    ;;
  "node")
    npm install
    ;;
  *)
    echo "Unable to build application type ${application_type}"
    exit 1
    ;;
esac

pwd; popd; pwd