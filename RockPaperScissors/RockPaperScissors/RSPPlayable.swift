//
//  RSPPlayable.swift
//  RockPaperScissors
//
//  Created by Roh on 11/22/23.
//

import Foundation

protocol RSPPlayable {
    var hand: Hand { get set }
}

final class UserPlayer: RSPPlayable {
    var hand: Hand
    
    init(hand: Hand) {
        self.hand = hand
    }
}

final class PCPlayer: RSPPlayable {
    var hand: Hand
    
    init() {
        self.hand = PCPlayer.randomizeHand()
    }
    
    private static func randomizeHand() -> Hand {
        Hand.allCases.randomElement() ?? .rock
    }
}
