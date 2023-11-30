//
//  mukchippaGameTurn.swift
//  RockPaperScissors
//
//  Created by 권태호 on 29/11/2023.
//

import Foundation


enum MuckChiPpaGameTurn {
    case user
    case computer
    
    mutating func toggle() {
        switch self {
        case .user:
            self = .computer
        case .computer:
            self = .user
        }
    }
}
