//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

let gameManager = GameManager()

while(gameManager.canPlayGame()) {
    gameManager.playGame()
}
