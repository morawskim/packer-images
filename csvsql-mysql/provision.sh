#!/usr/bin/env bash

set -euo pipefail

if [ -z "$VERSION" ]; then
    echo 'ENV variable $VERSION is not set' >&2
    exit 1
fi

pip install PyMySQL csvkit==$VERSION
