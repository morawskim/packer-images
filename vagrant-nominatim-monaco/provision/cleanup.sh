#!/bin/bash - 

set -o nounset                              # Treat unset variables as an error
set -euo pipefail
IFS=$'\n\t'

apt-get remove -y 'build-essential' 'cmake' 'g++' 'libboost-dev' 'libboost-system-dev' 'libboost-filesystem-dev' \
    'libexpat1-dev' 'zlib1g-dev' 'libxml2-dev' 'libbz2-dev' 'libpq-dev' 'libproj-dev' 'postgresql-server-dev-10'

apt autoremove -y

# Blank netplan machine-id (DUID) so machines get unique ID generated on boot.
truncate -s 0 /etc/machine-id
