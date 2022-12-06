#!/usr/bin/env bash
set -e

echo
echo "Testing Application"

pushd "$PROJECT_DIR"

appType=$(jq -r .application.type pipeline.json)
port=$(jq -r .application.port pipeline.json)
appName=$(jq -r .application.name pipeline.json)
testPath=$(jq -r .test.path pipeline.json)

case "${appType}" in
  "java")
    mvn test
    ;;
  "netcore")
    # The path to the test project must be set until
    # https://github.com/Microsoft/vstest/issues/1129 is
    # resolved.
    dotnet test "${testPath}"
    ;;
  "node")
    export PORT=${port}
    export APP_NAME=${appName}
    npm start & sleep 2 & npm test
    ;;
  *)
    echo "Unable to test application type ${appType}"
    exit 1
    ;;
esac

popd