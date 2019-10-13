#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

zypper --non-interactive ar --gpgcheck-allow-unsigned http://rpm.morawskim.pl/openSUSE:42.3/ morawskim && \
    zypper ref && \
    zypper --non-interactive install php54v php54v-fpm && \
    zypper clean -a
