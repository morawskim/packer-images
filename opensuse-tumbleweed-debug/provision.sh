#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

zypper --non-interactive install git gdb strace ltrace vim binutils valgrind curl perf \
  && zypper clean

zypper mr --enable repo-debug && \
    zypper mr --enable repo-debug-non-oss && \
    zypper mr --enable repo-debug-update && \
    zypper mr --enable repo-debug-update-non-oss && \
    zypper mr --enable repo-source

zypper --non-interactive in -t pattern devel_rpm_build \
    && zypper clean

zypper --non-interactive update \
  && zypper clean

