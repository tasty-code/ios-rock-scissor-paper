//
//  MukJjiBbaResult.swift
//  RockPaperScissors
//
//  Created by Taewan Kim on 11/30/23.
//

import Foundation

enum MukJjiBbaResult {
    case playerTurn
    case computerTurn
    case win
}

extension MukJjiBbaResult: CustomStringConvertible {
    var description: String {
        switch self {
        case .playerTurn:
            return "사용자의 턴입니다."
        case .computerTurn:
            return "컴퓨터의 턴입니다."
        case .win:
            return ""
        }
    }
}

