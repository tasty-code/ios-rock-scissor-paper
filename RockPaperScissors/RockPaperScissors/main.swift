//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

let rockPaperScissorsManager = RockPaperScissorsManager()
var computerChoice = Int.random(in: 1...3)

func playGame() {
    while true {
        rockPaperScissorsManager.showMessage(.default)
        
        let input = readLine()
        let userChoice: RockPaperScissorsType
        
        do {
            userChoice = try rockPaperScissorsManager.validateUserInput(input)
        } catch {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
        
        let gameResult = rockPaperScissorsManager.judgeGame(user: userChoice,
                                                            computer: RockPaperScissorsType(rawValue: computerChoice))
        rockPaperScissorsManager.showMessage(gameResult)
        
        if gameResult != .draw {
            return
        }
    }
}

playGame()

