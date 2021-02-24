FROM jenkins/inbound-agent:latest-jdk11

USER root

RUN apt-get update && apt-get install -y \
        apt-transport-https \
        gnupg2 \
        curl \
    && rm -rf /var/lib/apt/lists/* \
       /tmp/* \
       /var/tmp/*

RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    curl -s https://baltocdn.com/helm/signing.asc | apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
    echo "deb https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list

RUN apt-get update && apt-get install -y \
        kubectl \
        helm \
    && rm -rf /var/lib/apt/lists/* \
       /tmp/* \
       /var/tmp/*

USER jenkins
