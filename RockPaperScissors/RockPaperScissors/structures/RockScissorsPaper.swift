//
//  RockScissorsPaper.swift
//  RockPaperScissors
//
//  Created by Kim EenSung on 11/29/23.
//

import Foundation

struct RockScissorsPaper {
    func play(userInput: Int) -> (GameResult, Turn) {
        var turn: Turn

        guard let userHand = RPS(rawValue: userInput), let computerHand = RPS(rawValue: Int.random(in: 1...3)) else {
            return (.draw, .computer)
        }
        
        if userHand == computerHand {
            print("비겼습니다.")
            return (.draw, .computer)
        }
        
        switch userHand {
        case .rock:
            turn = computerHand == .scissors ? .user : .computer
        case .scissors:
            turn = computerHand == .paper ? .user : .computer
        case .paper:
            turn = computerHand == .rock ? .user : .computer
        }
        
        if turn == .user {
            print("이겼습니다.")
            return (.win, turn)
        } else {
            print("졌습니다.")
            return (.lose, turn)
        }
    }
}
