curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install nodejs
npm install snyk@latest -g
export PATH=$PATH:${env.WORKSPACE}
curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b ${WORKSPACE}
curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b ${WORKSPACE}