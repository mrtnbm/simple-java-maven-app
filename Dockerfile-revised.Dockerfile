FROM amd64/maven:3.8.1-adoptopenjdk-11
USER root
RUN apt-get update && apt-get install -y build-essential sudo git pip
# install scanoss scanner
RUN pip3 install scanoss
# set env for scanoss, usually installed in this directory while testing
RUN export PATH=:$PATH:/home/$USER/.local/bin
# snyk installation
RUN curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN npm install snyk@latest -g
# syft + grype installation
# use /home/$USER/ if usr/local/bin can’t be accessed
RUN curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sudo sh -s -- -b /usr/local/bin
RUN curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sudo sh -s -- -b /usr/local/bin
# set env for syft/grype, usually usr/local/bin is already in PATH
RUN export PATH=$PATH:usr/local/bin
# scancode installation
RUN git clone https://github.com/nexB/scancode-toolkit.git
RUN cd scancode-toolkit
RUN git checkout develop
RUN ./configure
RUN source venv/bin/activate
# add scancode to path
RUN export PATH=$PATH:.
# oss review toolkit installation
RUN git clone https://github.com/oss-review-toolkit/ort.git
RUN cd ort
RUN ./gradlew installDist
