# simple-java-maven-app

This repository is for the
[Build a Java app with Maven](https://jenkins.io/doc/tutorials/build-a-java-app-with-maven/)
tutorial in the [Jenkins User Documentation](https://jenkins.io/doc/).

The repository contains a simple Java application which outputs the string
"Hello world!" and is accompanied by a couple of unit tests to check that the
main application works as expected. The results of these tests are saved to a
JUnit XML report.

The `jenkins` directory contains an example of the `Jenkinsfile` (i.e. Pipeline)
you'll be creating yourself during the tutorial and the `scripts` subdirectory
contains a shell script with commands that are executed when Jenkins processes
the "Deliver" stage of your Pipeline.

# Docker
## Create own image
### Create Dockerfile
* use official image as base image (jave 11 + maven 3.8): `FROM amd64/maven:3.8.1-adoptopenjdk-11`
* give user root access: `USER root`
* use shell to run commmands: `RUN <cmd>`
### Build image from Dockerfile
* `docker build -t <name> .`
### Run image as container
* `docker run --name <image-name> --rm --detach`  
`--rm --detach`: Remove Docker image when exiting, and don't run in foreground

