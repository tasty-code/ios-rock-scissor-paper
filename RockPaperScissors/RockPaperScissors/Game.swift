//
//  Game.swift
//  RockPaperScissors
//
//  Created by 장우석 on 11/21/23.
//

import Foundation

enum RockPaperScissors {
    case win(userSelect: String, comSelect: String)
    case draw(userSelect: String, comSelect: String)
    case lose(userSelect: String, comSelect: String)
    case menuText
    case wrongText
    
    var result: String {
        switch self {
        case .win(userSelect: let userSelect, comSelect: let comSelct):
            return "이겼습니다!"
        case .lose(userSelect: let userSelect, comSelect: let comSelct):
            return "졌습니다!"
        case .draw(userSelect: let userSelect, comSelect: let comSelct):
            return "비겼습니다!"
        case .menuText:
            return "가위(1), 바위(2), 보(3)! <종료 : 0> :"
        case .wrongText:
            return "잘못된 입력입니다. 다시 시도해주세요."
        }
    }
}

struct Game {
    var rock: String
    var paper: String
    var scissors: String
}
