#!/usr/bin/env sh
set -eu

export DEBIAN_FRONTEND=noninteractive
apt-get install -y curl git
git clone --depth 1 https://github.com/morawskim/provision-dev-servers.git /provision
