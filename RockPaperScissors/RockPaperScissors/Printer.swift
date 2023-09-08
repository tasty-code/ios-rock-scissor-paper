//
//  Printer.swift
//  RockPaperScissors
//
//  Created by 전성수 on 2023/09/08.
//

import Foundation

enum RPSPrinter: Int {
    case menu
    case gameFinish
    case draw
    case win
    case lose
    case invalid
    
    func printMessage() {
        switch self {
        case .menu:
            print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
        case .gameFinish:
            print("게임 종료")
        case .draw:
            print("비겼습니다!")
        case .win:
            print("이겼습니다!")
        case .lose:
            print("졌습니다!")
        case .invalid:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}
