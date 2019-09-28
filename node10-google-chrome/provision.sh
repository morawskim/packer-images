#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

apt-get update && \
    apt-get -y install \
            software-properties-common \
            curl \
            unzip \
            ca-certificates \
            apt-transport-https lsb-release gnupg \
        --no-install-recommends

sh -c 'curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -' && \
    sh -c "echo 'deb https://deb.nodesource.com/node_10.x stretch main' > /etc/apt/sources.list.d/nodesource.list" && \
    sh -c "echo 'deb-src https://deb.nodesource.com/node_10.x stretch main' >> /etc/apt/sources.list.d/nodesource.list" && \
    apt-get update && \
    apt-get -y install nodejs

# FROM https://github.com/CircleCI-Public/circleci-dockerfiles/blob/master/node/images/8.9.4/browsers/Dockerfile
curl --silent --show-error --location --fail --retry 3 --output /tmp/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
      && (dpkg -i /tmp/google-chrome-stable_current_amd64.deb || apt-get -fy install)  \
      && rm -rf /tmp/google-chrome-stable_current_amd64.deb \
      && sed -i 's|HERE/chrome"|HERE/chrome" --disable-setuid-sandbox --no-sandbox|g' \
           "/opt/google/chrome/google-chrome" \
      && google-chrome --version

export CHROMEDRIVER_RELEASE=$(curl --location --fail --retry 3 http://chromedriver.storage.googleapis.com/LATEST_RELEASE) \
      && curl --silent --show-error --location --fail --retry 3 --output /tmp/chromedriver_linux64.zip "http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_RELEASE/chromedriver_linux64.zip" \
      && cd /tmp \
      && unzip chromedriver_linux64.zip \
      && rm -rf chromedriver_linux64.zip \
      && mv chromedriver /usr/local/bin/chromedriver \
      && chmod +x /usr/local/bin/chromedriver \
&& chromedriver --version

apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

useradd --create-home --user-group chrome
