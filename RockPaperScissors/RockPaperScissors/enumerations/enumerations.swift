//
//  enumerations.swift
//  RockPaperScissors
//
//  Created by 박찬호 on 11/27/23.
//

import Foundation

enum GameResult: String {
    case win, draw, lose
}

enum RPS: Int {
    case scissors = 1, rock = 2, paper = 3
}

enum MJB: Int {
    case mook = 1, jji = 2, bba = 3
}

enum GameType: String {
    case rockScissorsPaper = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case mookJjiBba = "묵(1), 찌(2), 빠(3)! <종료 : 0> : "
    
    func message(turn: Turn) -> String{
        switch self {
        case .rockScissorsPaper:
            return self.rawValue
        case .mookJjiBba:
            return "[\(turn.rawValue) 턴] " + self.rawValue
        }
    }
}

enum GameStatus {
    case ready, evaluation, falseInput, completed
}

enum Turn: String {
    case user = "사용자"
    case computer = "컴퓨터"
}
