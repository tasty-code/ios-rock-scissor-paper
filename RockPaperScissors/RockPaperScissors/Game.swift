//
//  Game.swift
//  RockPaperScissors
//
//  Created by 장우석 on 11/21/23.
//

import Foundation

enum RockPaperScissors {
    case win
    case draw
    case lose
    case menuText
    case wrongText
    case endText
    
    var result: String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다!"
        case .draw:
            return "비겼습니다!"
        case .menuText:
            return "가위(1), 바위(2), 보(3)! <종료 : 0> :"
        case .wrongText:
            return "잘못된 입력입니다. 다시 시도해주세요."
        case .endText:
            return "게임종료"
        }
    }
}

