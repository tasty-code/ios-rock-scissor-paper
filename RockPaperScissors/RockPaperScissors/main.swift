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
        let userChoice = rockPaperScissorsManager.validateUserInput(input)
        if userChoice == 0 {
            return
        }
        
        let gameResult = rockPaperScissorsManager.judgeGame(user: userChoice, computer: computerChoice)
        
        switch gameResult {
        case .win, .lose:
            ioManager.showMessage(gameResult)
            return
        case .draw, .inputError:
            ioManager.showMessage(gameResult)
        default:
            return
        }
    }
}

playGame()
ioManager.showMessage(.exit)

