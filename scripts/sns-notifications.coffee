module.exports = (robot) ->
  # Handle all notifications
  robot.on "sns:notification", (msg) ->
    robot.messageRoom("46691_curbot_stage_notifications@conf.hipchat.com",
      """
      Received notification:
        Topic:      #{msg.topic}
        Message:    #{msg.message}
      """)
