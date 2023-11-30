//
//  Player.swift
//  RockPaperScissors
//
//  Created by 장우석 on 11/28/23.
//

import Foundation

struct Player {
    var playerSelect: RockPaperScissors
    var playerType: PlayerType
    
    init() {
        self.playerSelect = .none
        self.playerType = .none
    }
    
    init(_ playerSelect: RockPaperScissors) {
        self.playerType = .none
        self.playerSelect = playerSelect
    }
}
