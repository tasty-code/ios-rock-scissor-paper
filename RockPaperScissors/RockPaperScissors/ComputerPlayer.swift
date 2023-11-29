//
//  ComputerPlayer.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

final class ComputerPlayer: HandGamePlayable {
    private let name = "컴퓨터"
    
    func makeRPSDecision() -> RPSDecision {
        let hand = Hand.randomize()
        let gesture = RPSGesture(hand: hand, owner: self)
        return .go(gesture: gesture)
    }
    
    func makeMJBDecision() -> MJBDecision {
        let hand = Hand.randomize()
        let gesture = MJBGesture(hand: hand, owner: self)
        return .go(gesture: gesture)
    }
}

extension ComputerPlayer: MJBResultDisplayable {
    func displayResult() -> String {
        #warning("구현?")
        return name
    }
}
