//
//  HandGameRound.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

struct HandGameRound {
    private let userHand: Hand
    
    init(userHand: Hand) {
        self.userHand = userHand
    }
    
    private func judgeIf(_ target: Hand, wins counter: Hand) -> HandGameResult {
        if target == counter {
            return .draw
        } else {
            return target.wins(counter) ? .win : .lose
        }
    }
    
    func getUserSideResult() -> HandGameResult {
        let computerHand = Hand.randomize()
        return judgeIf(userHand, wins: computerHand)
    }
}
