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
    
    init(gameType: GameType, user: Player, computer: Player, turn: Player) {
        self.gameType = gameType
        self.user = user
        self.computer = computer
        self.turn = turn
    }
    
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
    
    mutating func playRockScissorPaper(userInput: Int) {
        user.setRockScissorPaper(input: userInput)
        computer.setRockScissorPaper(input: Int.random(in: 1...3))
    }
    
    mutating func playMookJjiBba(userInput: Int) {
        user.setMookJjiBba(input: userInput)
        computer.setMookJjiBba(input: Int.random(in: 1...3))
    }
    
    mutating func evaluateRockScissorPaper() {
        if self.user.getRockScissorPaper() == self.computer.getRockScissorPaper() {
            print(GameResult.draw.rawValue)
            return
        }
        
        switch user.getRockScissorPaper() {
        case .rock:
            self.turn = computer.getRockScissorPaper() == .scissor ? user : computer
        case .scissor:
            self.turn = computer.getRockScissorPaper() == .paper ? user : computer
        case .paper:
            self.turn = computer.getRockScissorPaper() == .rock ? user : computer
        }
        
        if self.turn.getName() == "사용자" {
            print(GameResult.win.rawValue)
        } else {
            print(GameResult.lose.rawValue)
        }
        self.gameType = .mookJjiBba
    }

    mutating func evaluateMookJjiBba() -> GameResult {
        if self.user.getMookJjiBba() == self.computer.getMookJjiBba() {
            print("\(self.getTurn().getName())의 승리!")
            return .win
        }
        
        switch user.getMookJjiBba() {
        case .rock:
            self.turn = computer.getMookJjiBba() == .scissor ? user : computer
        case .scissor:
            self.turn = computer.getMookJjiBba() == .paper ? user : computer
        case .paper:
            self.turn = computer.getMookJjiBba() == .rock ? user : computer
        }
        print("\(self.getTurn().getName())의 턴입니다.")
        return .draw
    }
}

