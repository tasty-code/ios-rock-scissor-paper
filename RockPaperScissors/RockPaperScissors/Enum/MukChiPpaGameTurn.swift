//
//  mukchippaGameTurn.swift
//  RockPaperScissors
//
//  Created by 권태호 on 29/11/2023.
//

import Foundation

enum MukChiPpaGameTurn {
    case user
    case computer
    mutating func toggle() {
        switch self {
        case .user:
            self = .computer
            print("컴퓨터의 턴입니다.")
        case .computer:
            self = .user
            print("사용자의 턴입니다.")
        }
    }
}

enum WonrockScissorPaper {
    case didWon
    case didLose
    case didDraw
    case `default`
    func runMCP() -> Bool {
        switch self {
        case .didWon:
            return true
        case .didLose:
            return true
        case .didDraw:
            return false
        case .default:
            return true
        }
    }
}
