//
//  ComputerPlayer.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

final class ComputerPlayer: Playable {
    func makeDecision() -> PlayerDecision {
        let hand = Hand.randomize()
        return .go(hand: hand)
    }
}
