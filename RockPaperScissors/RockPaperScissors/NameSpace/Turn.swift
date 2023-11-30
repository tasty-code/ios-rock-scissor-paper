//
//  Turn.swift
//  RockPaperScissors
//
//  Created by mireu & kyle.
//

enum Turn {
    case user
    case computer
}

extension Turn: CustomStringConvertible {
    var description: String {
        switch self {
        case .user:
            "사용자"
        case .computer:
            "컴퓨터"
        }
    }
}
