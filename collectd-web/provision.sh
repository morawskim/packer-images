#!/usr/bin/env bash

set -euo pipefail

GIT_COMMIT_HASH='70a277d8689ed91febac2be097c2d837fcde4283'

apt-get update && \
    apt-get install -y --no-install-recommends wget ca-certificates librrds-perl libjson-perl libhtml-parser-perl python libcgi-pm-perl

wget -O - https://github.com/httpdss/collectd-web/archive/${GIT_COMMIT_HASH}.tar.gz | tar -xvzf -
mv collectd-web-${GIT_COMMIT_HASH}/ /usr/local/collectd-web/

apt-get purge -y wget ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

mkdir  /etc/collectd && \
    echo 'datadir: "/rrd"' > /etc/collectd/collection.conf
