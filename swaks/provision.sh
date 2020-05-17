#!/usr/bin/env bash

set -euo pipefail

if [ -z "$VERSION" ]; then
    echo 'ENV variable $VERSION is not set' >&2
    exit 1
fi

apt-get update && \
    apt-get install -y --no-install-recommends \
        wget ca-certificates \
        libnet-ssleay-perl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

wget -O/usr/local/bin/swaks https://www.jetmore.org/john/code/swaks/files/swaks-$VERSION/swaks \
    && chmod +x /usr/local/bin/swaks

apt-get remove -y wget && \
    apt-get -y autoremove && \
    apt-get -y clean
