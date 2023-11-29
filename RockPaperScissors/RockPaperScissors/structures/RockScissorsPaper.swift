//
//  RockScissorsPaper.swift
//  RockPaperScissors
//
//  Created by Kim EenSung on 11/29/23.
//

import Foundation

struct RockScissorsPaper {
    func play(user: Player, computer: Player, userInput: Int) -> (GameResult, Turn) {
        var user = user
        var computer = computer
        var turn: Turn
        
        user.chooseRockScissorsPaper(input: userInput)
        computer.chooseRockScissorsPaper(input: Int.random(in: 1...3))
        
        let userHand = user.retrieveRockScissorsPaper()
        let computerHand = computer.retrieveRockScissorsPaper()
        
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
