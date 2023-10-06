#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

 echo '===> UPDATE distribution and install core packages'
 apt-get update && \
     apt-get -y install \
             curl \
             ca-certificates \
             unzip \
         --no-install-recommends


echo '===> Install google-chrome'
# FROM https://github.com/CircleCI-Public/circleci-dockerfiles/blob/master/node/images/8.9.4/browsers/Dockerfile
curl --silent --show-error --location --fail --retry 3 --output /tmp/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
      && (dpkg -i /tmp/google-chrome-stable_current_amd64.deb || apt-get -fy install)  \
      && rm -rf /tmp/google-chrome-stable_current_amd64.deb \
      && sed -i 's|HERE/chrome"|HERE/chrome" --disable-setuid-sandbox --no-sandbox|g' \
           "/opt/google/chrome/google-chrome" \
      && google-chrome --version

echo '===> Install chromedriver'
export CHROMEDRIVER_RELEASE=$(curl --location --fail --retry 3 http://chromedriver.storage.googleapis.com/LATEST_RELEASE) \
      && curl --silent --show-error --location --fail --retry 3 --output /tmp/chromedriver_linux64.zip "http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_RELEASE/chromedriver_linux64.zip" \
      && cd /tmp \
      && unzip chromedriver_linux64.zip \
      && rm -rf chromedriver_linux64.zip \
      && mv chromedriver /usr/local/bin/chromedriver \
      && chmod +x /usr/local/bin/chromedriver \
&& chromedriver --version

echo '===> Clean'
apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

chmod 755 /usr/local/bin/docker-entrypoint.sh
