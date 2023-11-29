//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

let user: Player = Player(input: .noChoice)
let opponent: Player = Player(input: .noChoice)

let rpsGame: RockPaperScissorsGame = RockPaperScissorsGame(user: user, opponent: opponent)
let mjbGame: MukJjiPpaGame = MukJjiPpaGame(rpsGame: rpsGame)

let rpsGameController: RpsGameController =
RpsGameController(user: user, opponent: opponent, rpsGame: rpsGame)
let mjbGameController: MjbGameController =
MjbGameController(user: user, opponent: opponent, mjbGame: mjbGame)

var gameState: GameState = .rpsGame
var menuMessage: MenuMessage = .rps

while gameState != .endGame {
    switch gameState {
    case .endGame:
        break
    case .rpsGame:
        rpsGameController.printMenuMessage(message: menuMessage)
        gameState = rpsGameController.playGame()
    case .mjbGame:
        mjbGameController.printMenuMessage(message: menuMessage)
        gameState = mjbGameController.playGame()
    }
}
