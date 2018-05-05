# Description:
#   Queremos a motivacao do dia!
#
# Commands:
#   bender motivacao - Receba uma super dica

module.exports = (robot) ->

    frases = [
        "Vamos matar todos os humanos?",
        "Vou chutar seu bumbum metálico!",
        "Hey Fry, vamos tomar uma cerveja! :beer:",
        "Eu? Não tenho personalidade que vicia!"]

    robot.respond /motivacao/, (msg) ->
        resposta = frases[Math.floor(Math.random() * frases.length )]
        msg.send(resposta)

    robot.respond /estou desmotivado/, (msg) ->
        msg.send("Então me pague uma cerveja...  ")

