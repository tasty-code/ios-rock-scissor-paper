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
    
    func getUserSideResult() -> HandGameResult {
        let computerHand = Hand.randomize()
        return userHand.judge(counter: computerHand)
    }
}
