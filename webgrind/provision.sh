#!/usr/bin/env sh

set -euo pipefail

if [ -z "$VERSION" ]; then
    echo 'ENV variable $VERSION is not set' >&2
    exit 1
fi

apk add --update wget ca-certificates graphviz python3

wget -O - https://api.github.com/repos/jokkedk/webgrind/tarball/v$VERSION | tar -xvzf -
mv jokkedk-webgrind-*/ /usr/local/webgrind/

sed -i -e 's#/usr/bin/python#/usr/bin/python3#' /usr/local/webgrind/config.php

apk del wget ca-certificates && \
    rm -rf /var/cache/apk/* /tmp/* /var/tmp/*
