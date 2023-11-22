//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation


enum Hand: String {
    case scissor = "1" , rock = "2", paper = "3", exit = "0"
    
}

func action(com: Hand, user: Hand) {
    switch user {
    case .exit:
        endGame()
    case .paper, .rock, .scissor:
        startGame(comPick: com, userPick: user)
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}
