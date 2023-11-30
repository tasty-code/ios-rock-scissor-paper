//
//  GameMenuPrompt.swift
//  RockPaperScissors
//
//  Created by 권태호 on 29/11/2023.
//

import Foundation

enum GameMenuPrompt: String {
    case menu = "가위(1), 바위(2), 보(3)! <종료: 0> : "
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
    case exit = "게임 종료"
    case mukChiPpaMenu = " 묵(1), 찌(2), 빠(3)! <종료: 0> : "
    case error = "잘못된 입력입니다. 다시 시도해주세요"
}

