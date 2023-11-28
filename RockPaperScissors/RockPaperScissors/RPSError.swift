//
//  RPSError.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

enum RPSError: Error {
    case invalidInput
    case someoneWantsToExit
    
    var description: String {
        switch self {
        case .invalidInput: return "잘못된 입력입니다. 다시 시도해주세요."
        case .someoneWantsToExit: return "게임 종료"
        }
    }
}
