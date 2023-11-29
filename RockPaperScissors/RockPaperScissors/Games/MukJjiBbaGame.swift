//
//  MukJjiBbaGame.swift
//  RockPaperScissors
//
//  Created by 장우석 on 11/29/23.
//

import Foundation

struct MukJjiBbaGame: Game {
    var controller: Controller = MukJjiBbaController()
    
    mutating func play() {
        controller.process()
    }
}
