module.exports = (robot) ->
  # Handle all notifications
  robot.on "sns:notification", (msg) ->
    """
    Received notification:
      TopicArn:   #{msg.topicArn}
      Topic:      #{msg.topic}
      Message Id: #{msg.messageId}
      Subject:    #{msg.subject}
      Message:    #{msg.message}
    """
