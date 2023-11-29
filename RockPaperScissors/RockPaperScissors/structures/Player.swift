//
//  structures.swift
//  RockPaperScissors
//
//  Created by 박찬호 on 11/27/23.
//

import Foundation

struct Player {
    var rockScissorsPaper: RPS = .paper
    var mookJjiBba : MJB = .mook
    
    func retrieveRockScissorsPaper() -> RPS {
        return self.rockScissorsPaper
    }
    
    func retrieveMookJjiBba() -> MJB {
        return self.mookJjiBba
    }
    
    mutating func chooseRockScissorsPaper(input: Int) {
        self.rockScissorsPaper = RPS(rawValue: input) ?? .paper
    }
    
    mutating func chooseMookJjiBba(input: Int) {
        self.mookJjiBba = MJB(rawValue: input) ?? .bba
    }
}
