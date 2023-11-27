//
//  enumerations.swift
//  RockPaperScissors
//
//  Created by 박찬호 on 11/27/23.
//

import Foundation

enum GameResult: String {
    case win = "이겼습니다!"
    case draw = "비겼습니다!"
    case lose = "졌습니다!"
}

enum RockScissorPaper: Int {
    case scissor = 1, rock = 2, paper = 3
}

enum MookJjiBba: Int {
    case rock = 1, scissor = 2, paper = 3
}

enum GameType: String {
    case rockScissorPaper = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case mookJjiBba = "묵(1), 찌(2), 빠(3)! <종료 : 0> : "
}
