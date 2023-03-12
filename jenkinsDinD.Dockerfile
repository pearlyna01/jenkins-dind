# Docker file for custom jenkins image with blueocean
FROM jenkins/jenkins:2.385-jdk11

USER root

RUN apt-get update && apt-get install -y lsb-release

# get docker related stuff
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
    https://download.docker.com/linux/debian/gpg

RUN echo "deb [arch=$(dpkg --print-architecture) \
    signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
    https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

RUN apt-get update && apt-get install -y docker-ce-cli

USER jenkins

# install blueocean plugin
RUN jenkins-plugin-cli --plugins "blueocean:1.27.0 docker-workflow:563.vd5d2e5c4007f"
