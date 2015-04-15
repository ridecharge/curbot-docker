FROM ubuntu:14.04

RUN apt-get update && \
	apt-get -y upgrade && \
	apt-get install -y curl

RUN curl -sL https://deb.nodesource.com/setup | bash
RUN apt-get install -y nodejs build-essential
RUN chown 501 /root
RUN curl -sL https://www.npmjs.com/install.sh | sh
RUN npm install -g --allow-root yo generator-hubot

RUN mkdir -p /opt/hubot
WORKDIR /opt/hubot
RUN yo hubot \
		--owner="Curb Sysadmin <sysadmin@gocurb.com>" \
		--name="Curbot" \
		--description="Curbot Environment Manager" \
		--adapter="shell"
