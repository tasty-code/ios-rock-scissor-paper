//
//  Judge.swift
//  RockPaperScissors
//
//  Created by Roh on 11/22/23.
//

import Foundation

final class Judge {
    func judgeBetween(_ leftPlayer: RSPPlayable, _ rightPlayer: RSPPlayable) -> RSPResult {
        let lhs: Hand = leftPlayer.hand
        let rhs: Hand = rightPlayer.hand
        if lhs == rhs {
            return .tie
        } else {
            let winner = lhs.wins(rhs) ? leftPlayer : rightPlayer
            return .winning(winner)
        }
    }
}
