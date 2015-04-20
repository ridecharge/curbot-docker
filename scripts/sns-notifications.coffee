module.exports = (robot) ->
  # Handle all notifications
  robot.on "sns:notification", (msg) ->
    robot.messageRoom("46691_curbot_stage_notifications@conf.hipchat.com",
      """
      Received notification:
        TopicArn:   #{msg.topicArn}
        Topic:      #{msg.topic}
        Message Id: #{msg.messageId}
        Subject:    #{msg.subject}
        Message:    #{msg.message}
      """)
