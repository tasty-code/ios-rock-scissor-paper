//
//  structures.swift
//  RockPaperScissors
//
//  Created by 박찬호 on 11/27/23.
//

import Foundation

struct Player {
    private var name: String
    var rockScissorsPaper: RockScissorsPaper
    private var mookJjiBba : MookJjiBba
    
    init(name: String, rockScissorsPaper: RockScissorsPaper, mookJjiBba: MookJjiBba) {
        self.name = name
        self.rockScissorsPaper = rockScissorsPaper
        self.mookJjiBba = mookJjiBba
    }
    
    init(name: String) {
        self.init(name: name, rockScissorsPaper: .paper, mookJjiBba: .bba)
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getRockScissorsPaper() -> RockScissorsPaper {
        return self.rockScissorsPaper
    }
    
    func getMookJjiBba() -> MookJjiBba {
        return self.mookJjiBba
    }
    
    mutating func setRockScissorsPaper(input: Int) {
        self.rockScissorsPaper = RockScissorsPaper(rawValue: input) ?? .paper
    }
    
    mutating func setMookJjiBba(input: Int) {
        self.mookJjiBba = MookJjiBba(rawValue: input) ?? .bba
    }
}
