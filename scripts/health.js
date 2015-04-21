module.exports = function(robot) {
    robot.router.get('/health', function(req, res) {
        res.send("OK")
    })
}
