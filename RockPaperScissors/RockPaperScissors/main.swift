//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

let user: Player = Player(input: .noChoice)
let opponent: Player = Player(input: .noChoice)

let rpsGame: RockPaperScissorsGame = RockPaperScissorsGame()
let mjbGame: MukJjiPpaGame = MukJjiPpaGame(rpsGame: rpsGame)

let rpsGameController: RpsGameController =
RpsGameController(rpsGame: rpsGame)
let mjbGameController: MjbGameController =
MjbGameController(mjbGame: mjbGame)

var gameState: GameState = .rpsGame

while gameState != .endGame {
    switch gameState {
    case .endGame:
        break
    case .rpsGame:
        rpsGameController.printMenuMessage()
        gameState = rpsGameController.playGame(user: user, opponent: opponent)
    case .mjbGame:
        mjbGameController.printMenuMessage()
        gameState = mjbGameController.playGame(user: user, opponent: opponent)
    }
}
