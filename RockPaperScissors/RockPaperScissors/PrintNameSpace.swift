//
//  PrintNameSpace.swift
//  RockPaperScissors
//
//  Created by MAC2020 on 2023/11/27.
//

import Foundation

enum RockScissorsPaperMessages {
   enum Default {
        static let menu = "가위(1), 바위(2), 보(3)! <종료: 0>"
    }
    
    enum Results {
        static let win = "이겼습니다."
        static let lose = "졌습니다."
        static let draw = "비겼습니다."
    }
}

enum MukchippaMessages {
    enum UserTurn {
        static let menu = "[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>"
        static let userTurnMessage = "사용자의 턴입니다."
        static let win = "사용자의 승리!"
    }
    
    enum ComputerTurn {
        static let menu = "[컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>"
        static let computerTurnMessage = "컴퓨터의 턴입니다."
        static let win = "컴퓨터의 승리!"
    }
}

enum ErrorMessages {
    static let inputError = "잘못된 입력입니다. 다시 시도해주세요."
}

enum EndGameMessages {
    static let endMessage = "게임 종료"
}


