//
//  WinningTurn.swift
//  RockPaperScissors
//
//  Created by Taewan Kim on 11/30/23.
//

import Foundation

enum WinningTurn {
    case playerTurn
    case computerTurn
}

extension WinningTurn: CustomStringConvertible {
    var description: String {
        switch self {
        case .playerTurn:
            return "사용자"
        case .computerTurn:
            return "컴퓨터"
        }
    }
}
