FROM amd64/maven:3.8.1-adoptopenjdk-11
USER root
RUN apt-get update && apt-get install -y build-essential sudo git
RUN sudo curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
RUN sudo apt-get install -y nodejs
RUN npm install snyk@latest -g
RUN curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b /usr/local/bin
RUN curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b /usr/local/bin
RUN export PATH=$PATH:usr/local/bin