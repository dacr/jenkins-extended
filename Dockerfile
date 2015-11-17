FROM library/jenkins:latest

USER root

RUN apt-get update \
 && apt-get install -y git \
 && apt-get install -y zip unzip tar  \
 && apt-get install -y python-pip \
 && apt-get install -y python-dev \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip \
 && pip install ansible

#because of https://issues.jenkins-ci.org/browse/JENKINS-31089 :
RUN sed -i "s/jdk.certpath.disabledAlgorithms=MD2, RSA keySize < 1024/jdk.certpath.disabledAlgorithms=MD2, RSA keySize < 512/g" \
   /etc/java-8-openjdk/security/java.security

USER jenkins

COPY plugins.txt /plugins.txt
RUN /usr/local/bin/plugins.sh /plugins.txt

