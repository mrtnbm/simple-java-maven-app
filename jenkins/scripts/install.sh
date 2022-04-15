chmod +x -R ${env.WORKSPACE}
sudo curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install nodejs
sudo npm install snyk@latest -g
sudo export PATH=$PATH:${env.WORKSPACE}
sudo curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b ${WORKSPACE}
sudo curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b ${WORKSPACE}