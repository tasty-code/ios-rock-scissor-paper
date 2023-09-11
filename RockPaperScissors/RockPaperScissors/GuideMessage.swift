//
//  GuideMessage.swift
//  RockPaperScissors
//
//  Created by 지준용 on 2023/09/06.
//

import Foundation

enum GuideMessage {
    
    // MARK: - RockPaperScissors
    
    static let rpsChoiceMenu = "가위(1), 바위(2), 보(3)! <종료: 0> : "
    static let exit = "게임 종료"
    static let inputError = "잘못된 입력입니다. 다시 시도해주세요."
    static let draw = "비겼습니다!"
    static let win = "이겼습니다!"
    static let lose = "졌습니다!"
    
    // MARK: - Mukchippa
    
    static let mcpChoiceMenu = "묵(1), 찌(2), 빠(3)! <종료 : 0> : "
    static let userTurn = "사용자의 턴입니다."
    static let computerTurn = "컴퓨터의 턴입니다."
    static let userWin = "사용자의 승리!"
    static let computerWin = "컴퓨터의 승리!"
}
