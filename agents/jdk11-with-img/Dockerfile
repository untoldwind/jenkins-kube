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
        uidmap \
        seccomp \
    && rm -rf /var/lib/apt/lists/* \
       /tmp/* \
       /var/tmp/*

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) \
       stable"

ARG IMG_VERSION=0.5.11
ARG IMG_SHA256=cc9bf08794353ef57b400d32cd1065765253166b0a09fba360d927cfbd158088

RUN curl -fSL "https://github.com/genuinetools/img/releases/download/v$IMG_VERSION/img-linux-amd64" -o "/usr/local/bin/img" \
	&& echo "$IMG_SHA256  /usr/local/bin/img" | sha256sum -c - \
	&& chmod a+x "/usr/local/bin/img"

RUN chmod u+s /usr/bin/newuidmap /usr/bin/newgidmap

USER jenkins
ENV USER jenkins
