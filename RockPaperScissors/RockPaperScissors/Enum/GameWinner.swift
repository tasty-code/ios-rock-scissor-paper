//
//  Winner.swift
//  RockPaperScissors
//
//  Created by Janine on 2023/09/11.
//

import Foundation

enum GameWinner: String {
    case user
    case opponent
    case draw
    
    var message: String {
        switch self {
        case .draw:
            return "비겼습니다!"
        case .user:
            return "이겼습니다!"
        case .opponent:
            return "졌습니다!"
        }
    }
}
