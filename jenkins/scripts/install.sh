#!/usr/bin/env bash
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
apt-get install nodejs
apt install build-essential
npm install snyk@latest -g
curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b ${HOME_WORKSPACE}
curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b ${HOME_WORKSPACE}