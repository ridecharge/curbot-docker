#!/bin/sh 
export HUBOT_HIPCHAT_JID = $(curl consul/v1/kv/hubot/HUBOT_HIPCHAT_JID\?raw)
export HUBOT_HIPCHAT_PASSWORD = $(curl consul/v1/kv/hubot/HUBOT_HIPCHAT_PASSWORD\?raw)

exec /opt/hubot/bin/hubot -a hipchat