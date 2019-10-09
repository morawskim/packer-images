#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
apt-get update -qq
apt-get install -y puppet make
gem install librarian-puppet
