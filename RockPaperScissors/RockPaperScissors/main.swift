//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

import GameController

var gameController: GameController = GameController.shared

while gameController.gameState != .gameOver {
    gameController.playGame()
}
