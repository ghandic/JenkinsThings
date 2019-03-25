FROM jenkins/jenkins:lts

# Installing plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# switch to root, let the entrypoint drop back to jenkins
USER root

# install prerequisite debian packages
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common \
     vim \
     wget \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# install docker
ARG DOCKER_CLI_VERSION==5:18.09.2~3-0~debian-stretch
# ARG DOCKER_CLI_VERSION=
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
 && add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/debian \
     $(lsb_release -cs) \
     stable" \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    docker-ce-cli${DOCKER_CLI_VERSION} \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && groupadd -r docker
