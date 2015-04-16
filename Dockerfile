FROM ubuntu:14.04.2
RUN apt-get update && \
		apt-get -y upgrade && \
		apt-get install -y curl \
							build-essential \
							python

RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -y nodejs 
RUN curl -sL https://www.npmjs.com/install.sh | sh

RUN groupadd --gid 2000 hubot
RUN adduser --uid 2000 --gid 2000 hubot
RUN npm install -g yo generator-hubot
ENV HOME /home/hubot
WORKDIR /home/hubot
USER hubot

COPY package.json /home/hubot/package.json
COPY external-scripts.json /home/hubot/external-scripts.json

RUN yo hubot \
		--owner="Curb Sysadmin <sysadmin@gocurb.com>" \
		--name="Curbot" \
		--description="Curbot Environment Manager" \
		--adapter="hipchat"
RUN echo n
RUN echo n