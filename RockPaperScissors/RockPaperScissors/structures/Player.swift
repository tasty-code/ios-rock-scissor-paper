//
//  structures.swift
//  RockPaperScissors
//
//  Created by 박찬호 on 11/27/23.
//

import Foundation

struct Player {
    var rockScissorsPaper: RockScissorsPaper = .paper
    var mookJjiBba : MookJjiBba = .mook
    
    func retrieveRockScissorsPaper() -> RockScissorsPaper {
        return self.rockScissorsPaper
    }
    
    func retrieveMookJjiBba() -> MookJjiBba {
        return self.mookJjiBba
    }
    
    mutating func chooseRockScissorsPaper(input: Int) {
        self.rockScissorsPaper = RockScissorsPaper(rawValue: input) ?? .paper
    }
    
    mutating func chooseMookJjiBba(input: Int) {
        self.mookJjiBba = MookJjiBba(rawValue: input) ?? .bba
    }
}
