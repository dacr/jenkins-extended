FROM jenkins:latest

USER root

RUN apt-get update \
  && apt-get install -y pip \
  && rm -rf /var/lib/apt/lists/*

USER jenkins

COPY plugins.txt /plugins.txt
RUN /usr/local/bin/plugins.sh /plugins.txt

