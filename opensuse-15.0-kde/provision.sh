#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

zypper --non-interactive install patterns-openSUSE-kde plasma5-desktop xdm \
  && zypper clean

zypper --non-interactive install sudo mkfontdir xset xsetroot glibc-locale \
  && zypper clean

zypper --non-interactive install patterns-openSUSE-kde_plasma MozillaFirefox akregator5 \
  baloo5-file baloo5-kioslaves baloo5-tools desktop-data-openSUSE \
  google-droid-fonts kaddressbook5 kde-gtk-config5 kde-oxygen-fonts kdebase4-workspace-libs kdeconnect-kde \
  kdenetwork4-filesharing keditbookmarks kmail5 knotes5 konqueror konsole kontact5 korganizer5 \
  plasma-nm5 plasma5-addons plasma5-pa plasma5-pk-updates polkit-default-privs pulseaudio pulseaudio-module-bluetooth \
  xdg-user-dirs yast2-control-center-qt akonadi-server \
  && zypper clean

zypper --non-interactive update \
  && zypper clean

# create user, setup sudo and change password to user
# U6aMy0wojraho is passwordless login
useradd --create-home --user-group user && \
    echo 'user:U6aMy0wojraho' | chpasswd -e && \
    echo 'user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/user

gpasswd -a user video

chown user:user /run/user
dbus-uuidgen > /var/lib/dbus/machine-id

