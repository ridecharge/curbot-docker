module.exports = function(robot) {
    room = process.env.HUBOT_NOTIFICATION_ROOM;

    robot.on("sns:notification", function(msg) {
        if (msg.topic != "curbformation-stage-notifications") {
            robot.messageRoom(room,
                "Received notification:" +
                "\nTopic: " + msg.topic +
                "\nMessage: " + msg.message);
        }
    });

    parser = require("properties-parser")
    robot.on("sns:notification:curbformation-stage-notifications", function(msg) {
        message = parser.parse(msg.message);

        if (message.StackName === message.LogicalResourceId) {
            robot.messageRoom(room,
                "Topic: " + msg.topic +
                "\nStack: " + message.StackName +
                "\nStatus: " + message.ResourceStatusß);
        }
    });
}