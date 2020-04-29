#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5ea98ff96ab528001613de7b/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5ea98ff96ab528001613de7b
curl -s -X POST https://api.stackbit.com/project/5ea98ff96ab528001613de7b/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5ea98ff96ab528001613de7b/webhook/build/publish > /dev/null
