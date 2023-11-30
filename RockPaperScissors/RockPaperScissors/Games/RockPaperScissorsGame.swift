//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 장우석 on 11/29/23.
//

import Foundation

struct RockPaperScissorsGame: Game {
    var controller: Controller = RockPaperScissorsController()
    
    mutating func play() {
        controller.process()
    }
}
