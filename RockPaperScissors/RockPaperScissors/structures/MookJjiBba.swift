//
//  MookJjiBba.swift
//  RockPaperScissors
//
//  Created by Kim EenSung on 11/29/23.
//

import Foundation

struct MookJjiBba {
    func play(turn: Turn, userInput: Int) -> (GameResult, Turn) {
        var turn = turn
        
        guard let userHand = MJB(rawValue: userInput), let computerHand = MJB(rawValue: Int.random(in: 1...3)) else {
            return (.restart, .computer)
        }
        
        if userHand == computerHand {
            print("\(turn.rawValue)의 승리!")
            return (.completed, turn)
        }
        
        let logic = userHand.logic
        turn = logic[userHand] == computerHand ? .user : .computer
        
        print("\(turn.rawValue)의 턴입니다.")
        return (.restart, turn)
    }
}
