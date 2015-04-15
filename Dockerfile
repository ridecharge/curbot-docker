FROM ubuntu:14.04.2

RUN apt-get update && \
	apt-get -y upgrade

ADD http://nodejs.org/dist/v0.12.2/node-v0.12.2-linux-x64.tar.gz /tmp/node-v0.12.2-linux-x64.tar.gz
WORKDIR /tmp
RUN tar -xvf node-v0.12.2-linux-x64.tar.gz
RUN mv node-v0.12.2-linux-x64/ /opt/node/

WORKDIR /opt/node/bin
RUN ls -lrt
RUN chmod +x node
RUN chmod +x npm
RUN npm install --allow-root -g yo generator-hubot