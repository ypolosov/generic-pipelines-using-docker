#!/usr/bin/env bash
set -e
set -x

# ssh ypolosov@37.139.105.194 -vvv -p 2222 hostname -f
ssh-keyscan -p 22 51.250.75.136 >> ~/.ssh/known_hosts
ssh ypolosov@51.250.75.136 -p 22 hostname -f
