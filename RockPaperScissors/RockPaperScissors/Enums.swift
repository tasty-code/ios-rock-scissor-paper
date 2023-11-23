//
//  Enums.swift
//  RockPaperScissors
//
//  Created by MAC2020 on 2023/11/23.
//

import Foundation


enum RockScissorsPaperCase: Int {
    case scissors = 1, rock, paper
}

enum StringNameSpace: String {
    case winMessage = "이겼습니다."
    case loseMessage = "졌습니다."
    case drawMessage = "비겼습니다."
    case endMessage = "게임 종료"
    case inputErrorMessage = "잘못된 입력입니다. 다시 시도해주세요."
    case rockScissorsPaperExit = "가위(1), 바위(2) 보(3)! <종료: 0>"
}
