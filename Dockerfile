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
RUN mkdir -p /var/hubot
RUN chown hubot:hubot /var/hubot
RUN chmod 0600 /var/hubot

RUN mkdir -p /opt/hubot
COPY *.json /opt/hubot/
COPY scripts /opt/hubot/scripts

RUN chown -R hubot:hubot /opt/hubot
RUN chmod -R 0700 /opt/hubot

COPY hubot-wrapper.sh /tmp/hubot-wrapper.sh
RUN chown hubot:hubot /tmp/hubot-wrapper.sh
RUN chmod 0500 /tmp/hubot-wrapper.sh

RUN npm install -g yo generator-hubot
USER hubot
WORKDIR /opt/hubot
RUN yo hubot \
		--owner="Curb Sysadmin <sysadmin@gocurb.com>" \
		--name="Curbot" \
		--description="Curbot Environment Manager" \
		--adapter="hipchat"

RUN echo n
RUN npm install

EXPOSE 8080
ENTRYPOINT ["/tmp/hubot-wrapper.sh"]
