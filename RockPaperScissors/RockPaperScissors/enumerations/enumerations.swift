//
//  enumerations.swift
//  RockPaperScissors
//
//  Created by 박찬호 on 11/27/23.
//

import Foundation

enum RPS: Int {
    case scissors = 1, rock = 2, paper = 3
    
    var winningLogic: [RPS:RPS] {
        get {
            let dictionary: [RPS:RPS] = [
                .rock : .scissors,
                .scissors : .paper,
                .paper : .rock
            ]
            return dictionary
        }
    }
}

enum MJB: Int {
    case mook = 1, jji = 2, bba = 3
    
    var winningLogic: [MJB:MJB] {
        get {
            let dictionary: [MJB:MJB] = [
                .mook : .jji,
                .jji : .bba,
                .bba : .mook
            ]
            return dictionary
        }
    }
}

enum GameResult: String {
    case completed, restart, nextGame
}

enum Turn: String {
    case user = "사용자"
    case computer = "컴퓨터"
}

enum GameType: String {
    case rockPaperScissors = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case mookJjiBba = "묵(1), 찌(2), 빠(3)! <종료 : 0> : "
    
    func message(turn: Turn) -> String {
        switch self {
        
        case .rockPaperScissors:
            return self.rawValue
        
        case .mookJjiBba:
            return "[\(turn.rawValue) 턴] " + self.rawValue
        }
    }
    
    func play(turn: Turn, userInput: Int) -> (GameResult, GameType, Turn) {
        switch self {
        
        case .rockPaperScissors:
            let rockScissorsPaper = RockPaperScissors()
            let (result, turn) = rockScissorsPaper.play(userInput: userInput)
            
            if result == .restart {
                return (.restart, .rockPaperScissors, turn)
            }
            
            return (.nextGame, .mookJjiBba, turn)
            
        case .mookJjiBba:
            let mookJjiBba = MookJjiBba()
            let (result, turn) = mookJjiBba.play(turn: turn, userInput: userInput)
            
            if result == .completed {
                return (.completed, .mookJjiBba, turn)
            }
            
            return (.restart, .mookJjiBba, turn)
        }
    }
}

