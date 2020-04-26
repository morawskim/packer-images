#!/usr/bin/env sh
set -eu

export DEBIAN_FRONTEND=noninteractive
apt-get install -y curl

# Disable Predictable Network Interface names and use eth0
sed -i 's/GRUB_CMDLINE_LINUX="\(.*\)"/GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0 \1"/g' /etc/default/grub;
update-grub
