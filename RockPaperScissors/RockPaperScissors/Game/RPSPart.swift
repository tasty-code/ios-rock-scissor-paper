//
//  RPSPart.swift
//  RockPaperScissors
//
//  Created by Effie on 11/29/23.
//

struct RPSPart {
    private let leftGesture: RPSHand
    
    private let rightGesture: RPSHand
    
    init(between leftGesture: RPSHand, and rightGesture: RPSHand) {
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
