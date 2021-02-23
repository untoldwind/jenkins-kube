FROM jenkins/inbound-agent:latest-jdk11

USER root

RUN apt-get update && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common \
        gosu \
        maven \
        gradle \
        fuse-overlayfs \
    && rm -rf /var/lib/apt/lists/* \
       /tmp/* \
       /var/tmp/*

RUN curl -fsSL https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/Debian_10/Release.key | apt-key add - && \
    add-apt-repository "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/Debian_10/ /" && \
    apt-get update && \
    apt-get install -y buildah

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "entrypoint.sh" ]
