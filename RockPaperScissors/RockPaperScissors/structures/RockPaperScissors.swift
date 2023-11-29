//
//  RockScissorsPaper.swift
//  RockPaperScissors
//
//  Created by Kim EenSung on 11/29/23.
//

import Foundation

struct RockPaperScissors {
    func play(userInput: Int) -> (GameResult, Turn) {
        var turn: Turn

        guard let userHand = RPS(rawValue: userInput), let computerHand = RPS(rawValue: Int.random(in: 1...3)) else {
            return (.restart, .computer)
        }
        
        if userHand == computerHand {
            print("비겼습니다.")
            return (.restart, .computer)
        }
        
        let winningLogic = userHand.logic
        turn = winningLogic[userHand] == computerHand ? .user : .computer

        if turn == .user {
            print("이겼습니다.")
        } else {
            print("졌습니다.")
        }
        return (.nextGame, turn)
        
    }
}
