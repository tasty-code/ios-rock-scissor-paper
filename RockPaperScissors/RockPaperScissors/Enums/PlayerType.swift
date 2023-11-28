//
//  PlayerInfo.swift
//  RockPaperScissors
//
//  Created by 장우석 on 11/28/23.
//

import Foundation

enum PlayerType {
    case user
    case computer
    case none
    
    var text: String {
        switch self {
        case .computer:
            return "컴퓨터"
        case .user:
            return "사용자"
        default:
            return "해당 없음"
        }
    }
}
