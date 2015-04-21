module.exports = (robot) ->
  room = process.env.HUBOT_NOTIFICATION_ROOM
  robot.on "sns:notification", (msg) ->
    robot.messageRoom(room,
      """
      Received notification:
        Topic:      #{msg.topic}
        Message:    #{msg.message}
      """)
