#!/usr/bin/env bash

set -euo pipefail

export NODE_ENV=production

if [ -z "$VERSION" ]; then
    echo 'ENV variable $VERSION is not set' >&2
    exit 1
fi

npm install -g openclaw@$VERSION mcporter
