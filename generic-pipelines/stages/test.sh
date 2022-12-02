#!/usr/bin/env bash
set -e
set -x

ssh ypolosov@37.139.105.194 -vvv -p 2222 hostname -f
