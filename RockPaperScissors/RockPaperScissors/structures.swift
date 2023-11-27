//
//  structures.swift
//  RockPaperScissors
//
//  Created by 박찬호 on 11/27/23.
//

import Foundation

struct Player {
    private var name: String
    private var rockScissorPaper: RockScissorPaper
    private var mookJjiBba : MookJjiBba
    
    init(name: String, rockScissorPaper: RockScissorPaper, mookJjiBba: MookJjiBba) {
        self.name = name
        self.rockScissorPaper = rockScissorPaper
        self.mookJjiBba = mookJjiBba
    }
    
    init(name: String) {
        self.init(name: name, rockScissorPaper: .paper, mookJjiBba: .paper)
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getRockScissorPaper() -> RockScissorPaper {
        return self.rockScissorPaper
    }
    
    func getMookJjiBba() -> MookJjiBba {
        return self.mookJjiBba
    }
    
    mutating func setRockScissorPaper(input: Int) {
        self.rockScissorPaper = RockScissorPaper(rawValue: input) ?? .paper
    }
    
    mutating func setMookJjiBba(input: Int) {
        self.mookJjiBba = MookJjiBba(rawValue: input) ?? .paper
    }
}

struct GameMaster {
    private var gameType: GameType
    private var user: Player
    private var computer: Player
    private var turn: Player
    
    func getGameType() -> GameType {
        return self.gameType
    }
    
    mutating func setGameType(to gameType: GameType) {
        self.gameType = gameType
    }
    
    func getUser() -> Player {
        return self.user
    }
    
    func getComputer() -> Player {
        return self.computer
    }
    
    func getTurn() -> Player {
        return self.turn
    }
    
    mutating func setTurn(to player: Player) {
        self.turn = player
    }
}
