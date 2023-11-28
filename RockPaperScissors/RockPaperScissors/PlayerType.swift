//
//  PlayerType.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

enum PlayerType: CustomStringConvertible {
    case user
    case computer
    
    var description: String {
        switch self {
        case .user: return "사용자"
        case .computer: return "컴퓨터"
        }
    }
}
