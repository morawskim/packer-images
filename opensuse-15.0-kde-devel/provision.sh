#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

zypper --non-interactive ar http://download.opensuse.org/debug/distribution/leap/15.0/repo/oss/ debug && \
    zypper --non-interactive ar http://download.opensuse.org/debug/update/leap/15.0/oss/openSUSE:Leap:15.0:Update.repo

zypper --non-interactive install vim less gdb strace tar patch wget lsof \
    git patterns-devel-C-C++-devel_C_C++ patterns-kde-devel_kde_frameworks patterns-kde-devel_kde_frameworks \
    cmake extra-cmake-modules gcc-c++ plasma5-workspace-devel plasma-framework-devel kpackage-devel \
  && zypper clean

zypper --non-interactive update \
  && zypper clean
