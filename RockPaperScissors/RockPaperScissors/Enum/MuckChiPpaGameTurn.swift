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
            print("컴퓨터의 턴입니다.")
        case .computer:
            self = .user
            print("사용자의 턴입니다.")
        }
    }
}
