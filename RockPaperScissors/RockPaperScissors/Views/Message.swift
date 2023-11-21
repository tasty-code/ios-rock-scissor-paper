//
//  Message.swift
//  RockPaperScissors
//
//  Created by 장우석 on 11/21/23.
//

import Foundation

enum Message {
    case win
    case draw
    case lose
    case menu
    case wrong
    case end
    
    var result: String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다!"
        case .draw:
            return "비겼습니다!"
        case .menu:
            return "가위(1), 바위(2), 보(3)! <종료 : 0> :"
        case .wrong:
            return "잘못된 입력입니다. 다시 시도해주세요."
        case .end:
            return "게임종료"
        }
    }
}
