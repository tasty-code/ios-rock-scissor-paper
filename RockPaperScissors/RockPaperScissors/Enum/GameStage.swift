//
//  Progress.swift
//  RockPaperScissors
//
//  Created by Janine on 2023/09/11.
//

import Foundation

enum  GameStage: String {
    case start
    case tryAgain
    case end
    case onGoing
    
    var message: String {
        switch self {
        case .start:
            return "가위(1), 바위(2), 보(3)! <종료 : 0> :"
        case .tryAgain:
            return "잘못된 입력입니다. 다시 시도해주세요."
        case .end:
            return "게임 종료"
        default:
            return ""
        }
    }
}
