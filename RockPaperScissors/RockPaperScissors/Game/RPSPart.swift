//
//  RPSPart.swift
//  RockPaperScissors
//
//  Created by Effie on 11/29/23.
//

import Foundation

struct RPSPart {
    private let leftGesture: RPSGesture
    
    private let rightGesture: RPSGesture
    
    init(between leftGesture: RPSGesture, and rightGesture: RPSGesture) {
        self.leftGesture = leftGesture
        self.rightGesture = rightGesture
    }
    
    func getResult() -> RPSResult {
        let leftHand = leftGesture.hand
        let rightHand = rightGesture.hand
        
        if leftHand == rightHand {
            return .draw
        } else {
            let winningGesture = leftHand.wins(rightHand) ? leftGesture : rightGesture
            let winner = winningGesture.owner
            return .win(winner)
        }
    }
}
