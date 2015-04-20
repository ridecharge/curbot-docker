FROM ubuntu:14.04.2
RUN apt-get update && \
		apt-get -y upgrade && \
		apt-get install -y curl \
							build-essential \
							python

RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -y nodejs
RUN curl -sL https://www.npmjs.com/install.sh | sh

RUN adduser --uid 2000 hubot
RUN mkdir -p /opt/hubot
RUN mkdir -p /var/hubot
RUN chown hubot:hubot /opt/hubot
RUN chown hubot:hubot /var/hubot
RUN chmod 0600 /var/hubot
RUN chmod 0700 /opt/hubot

RUN npm install -g yo generator-hubot
WORKDIR /opt/hubot
USER hubot

COPY package.json /opt/hubot/package.json
COPY external-scripts.json /opt/hubot/external-scripts.json
COPY hubot-scripts.json /opt/hubot/hubot-scripts.json
COPY scripts /opt/hubot/scripts

RUN yo hubot \
		--owner="Curb Sysadmin <sysadmin@gocurb.com>" \
		--name="Curbot" \
		--description="Curbot Environment Manager" \
		--adapter="hipchat"

RUN echo n
RUN npm install

ENTRYPOINT ["/tmp/hubot-wrapper.sh"]
