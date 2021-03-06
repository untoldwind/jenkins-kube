FROM jenkins/inbound-agent:latest

USER root

RUN apt-get update && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common \
        gosu \
        uidmap \
        seccomp \
    && rm -rf /var/lib/apt/lists/* \
       /tmp/* \
       /var/tmp/*

ENV MAVEN_VERSION=3.5.2
ENV MAVEN_HOME=/opt/mvn
ENV PATH $PATH:$MAVEN_HOME/bin

# Download and extract maven to opt folder
RUN wget --no-check-certificate --no-cookies https://repo1.maven.org/maven2/org/apache/maven/apache-maven/${MAVEN_VERSION}/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    wget --no-check-certificate --no-cookies https://repo1.maven.org/maven2/org/apache/maven/apache-maven/${MAVEN_VERSION}/apache-maven-${MAVEN_VERSION}-bin.tar.gz.md5 && \
    echo "$(cat apache-maven-${MAVEN_VERSION}-bin.tar.gz.md5) apache-maven-${MAVEN_VERSION}-bin.tar.gz" | md5sum -c && \
    tar -zvxf apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /opt/ && \
    ln -s /opt/apache-maven-${MAVEN_VERSION} /opt/mvn && \
    rm -f apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    rm -f apache-maven-${MAVEN_VERSION}-bin.tar.gz.md5

ENV GRADLE_VERSION=6.8.3
ENV GRADLE_HOME=/opt/gradle
ENV PATH $PATH:$GRADLE_HOME/bin

RUN cd /opt && \
    wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
    wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip.sha256 && \
    echo "$(cat gradle-${GRADLE_VERSION}-bin.zip.sha256) gradle-${GRADLE_VERSION}-bin.zip" | sha256sum -c && \
    unzip gradle-${GRADLE_VERSION}-bin.zip && \
    ln -s /opt/gradle-${GRADLE_VERSION} /opt/gradle && \
    rm -f gradle-${GRADLE_VERSION}-bin.zip && \
    rm -f gradle-${GRADLE_VERSION}-bin.zip.sha256

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

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENV XDG_RUNTIME_DIR=/tmp

ENV USER jenkins

ENTRYPOINT [ "entrypoint.sh" ]
