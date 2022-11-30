#!/usr/bin/env bash
set -e

echo
echo "Cloning Application"


git clone "${REPOSITORY_URL:?}" .

