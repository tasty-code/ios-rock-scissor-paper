//
//  MookJjiBba.swift
//  RockPaperScissors
//
//  Created by Kim EenSung on 11/29/23.
//

import Foundation

struct MookJjiBba {
    func play(user: Player, computer: Player, turn: Turn, userInput: Int) -> GameResult {
        var user = user
        var computer = computer
        var turn = turn
        
        user.chooseMookJjiBba(input: userInput)
        computer.chooseMookJjiBba(input: Int.random(in: 1...3))
        
        let userHand = user.retrieveMookJjiBba()
        let computerHand = computer.retrieveMookJjiBba()
        
        if userHand == computerHand {
            print("\(turn.rawValue)의 승리!")
            return .win
        }
        
        switch userHand {
        case .mook:
            turn = computerHand == .jji ? .user : .computer
        case .jji:
            turn = computerHand == .bba ? .user : .computer
        case .bba:
            turn = computerHand == .mook ? .user : .computer
        }
        print("\(turn.rawValue)의 턴입니다.")
        return .draw
    }
}
