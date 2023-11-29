//
//  MJBPart.swift
//  RockPaperScissors
//
//  Created by Effie on 11/29/23.
//

import Foundation

struct MJBPart {
    private let turn: MJBGesture
    private let other: MJBGesture
    
    init(turn: MJBGesture, other: MJBGesture) {
        self.turn = turn
        self.other = other
    }
    
    func getResult() -> MJBResult {
        let turnHand = turn.hand
        let otherHand = other.hand
        
        if turnHand == otherHand {
            return .win(winner: turn.owner)
        } else {
            let winningGesture = turnHand.wins(otherHand) ? turn : other
            let nextTurn = winningGesture.owner
            return .regame(nextTurn: nextTurn)
        }
    }
}
