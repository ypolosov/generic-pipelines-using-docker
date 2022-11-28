#!/usr/bin/env bash

echo
echo "Testing Application"

pushd "$PROJECT_DIR"

application_type=$(jq -r .application.type pipeline.json)
test_path=$(jq -r .test.path pipeline.json)

set -x

case "${application_type}" in
  "java")
    mvn test
    ;;
  "netcore")
    # The path to the test project must be set until
    # https://github.com/Microsoft/vstest/issues/1129 is
    # resolved.
    dotnet test "${test_path}"
    ;;
  "node")
    node index.js
    ;;
  *)
    echo "Unable to test application type ${application_type}"
    exit 1
    ;;
esac

set +x

popd