#!/bin/bash - 

set -o nounset                              # Treat unset variables as an error
set -euo pipefail
IFS=$'\n\t'

OSM_FILE=$OSM_FILE_PATH

rm -rf /home/vagrant/nominatim || true
mkdir -p /home/vagrant/nominatim
tar -C /home/vagrant/nominatim --strip 1  -xf /home/vagrant/Nominatim.tar.bz2
cd /home/vagrant/nominatim
mkdir build
cd build
cmake ..
make

tee settings/local.php << EOF
<?php
 @define('CONST_Website_BaseURL', '/');
EOF

./utils/setup.php --quiet --osm-file $OSM_FILE --all --osm2pgsql-cache 3072 2>&1 | tee ~/setup.log
