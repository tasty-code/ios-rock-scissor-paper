//
//  PlayerDecision.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

enum PlayerDecision: Equatable {
    case go(hand: Hand)
    case stop
}
