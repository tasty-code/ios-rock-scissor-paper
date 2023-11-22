//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

let ioManager = IOManager()
let rockPaperScissorsManager = RockPaperScissorsManager()
var computerChoice = Int.random(in: 1...3)

func playGame() {
    while true {
        ioManager.showMessage(.default)
        
        let input = readLine()
        let result = rockPaperScissorsManager.validateUserInput(input)
        ioManager.showMessage(rockPaperScissorsManager.judgeGame(user: result, computer: computerChoice))
    }
}

playGame()
