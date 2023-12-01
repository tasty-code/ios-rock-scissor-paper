//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

let user: Player = Player(input: .noChoice, name: "사용자")
let opponent: Player = Player(input: .noChoice, name: "컴퓨터")

let rockPaperScissorsGame: RockPaperScissorsGame = RockPaperScissorsGame(menuMessage: .rockPaperScissors)
let mukJjiPpaGame: MukJjiPpaGame = MukJjiPpaGame(rockPaperScissorsGame: rockPaperScissorsGame, menuMessage: .mukJjiPpa)

let rpsGameController: RockPaperScissorsGameController = 
RockPaperScissorsGameController(rockPaperScissorsGame: rockPaperScissorsGame)

let mjbGameController: MukJjiPpaGameController =
MukJjiPpaGameController(mukJjiPpaGame: mukJjiPpaGame)

var gameState: GameType = .rockPaperScissors

while gameState != .endGame {
    switch gameState {
    case .endGame:
        break
    case .rockPaperScissors:
        rpsGameController.printMenuMessage()
        gameState = rpsGameController.playGame(user: user, opponent: opponent)
    case .mukJjiPpaGame:
        mjbGameController.printMenuMessage()
        gameState = mjbGameController.playGame(user: user, opponent: opponent)
    }
}
