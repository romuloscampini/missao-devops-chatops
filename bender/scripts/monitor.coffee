# Description:
#   Queremos a motivacao do dia!
#
monitor = require "os-monitor"

module.exports = (robot) ->

    monitor.start({ delay: 3000
                , critical1: 1.7
                , critical5: 1.9
                , critical15: 1.2
                })

    monitor.on 'monitor', (event) ->
        robot.logger.info event.type + 'Estou monitorando!'

    monitor.on 'loadavg1', (event) ->
        logMessage = event.type + ': Sobrecarga no ultimo minuto!'
        robot.logger.info logMessage
        robot.messageRoom 'town-square', logMessage

    monitor.on 'loadavg5', (event) ->
        logMessage = event.type + ': Sobrecarga nos ultimos 5 minutos!'
        robot.logger.info logMessage
        robot.messageRoom 'town-square', logMessage

    monitor.on 'freemem', (event) ->
        logMessage = event.type + ': Pouca memória disponível!'
        robot.logger.info logMessage
        robot.messageRoom 'town-square', logMessage
    

