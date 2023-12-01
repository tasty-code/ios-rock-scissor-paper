//
//  MukchippaResult.swift
//  RockPaperScissors
//
//  Created by nayeon  on 2023/11/29.
//

import Foundation

enum MukchippaResult: Int {
    case draw = 0
    case computer = 1
    case user = 2

    var turnMessage: String {
        return self == .user ? "[사용자 턴]" : "[컴퓨터 턴]"
    }

    var winMessage: String {
        return self == .user ? "사용자의 승리" : "컴퓨터의 승리"
    }

    var turnStartMessage: String {
        return self == .computer ? "컴퓨터의 턴입니다." : "사용자의 턴입니다"
    }
}
