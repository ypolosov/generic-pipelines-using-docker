#!/usr/bin/env bash
set -e
set -x

# IMPORTANT !!! https://circleci.com/docs/github-integration/#establish-the-authenticity-of-an-ssh-host
ssh-keyscan -p 22 51.250.75.136 >> ~/.ssh/known_hosts
ssh ypolosov@51.250.75.136 -p 22 hostname -f
