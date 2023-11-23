//
//  UserGuideMessage.swift
//  RockPaperScissors
//
//  Created by EUNJU on 2023/11/21.
//

import Foundation

enum UserGuideMessage {
    case `default`
    case win
    case lose
    case draw
    case exit
    
    func showMessage() {
        switch self {
            
        case .default:
            print("가위(1), 바위(2), 보(3)! <종료 : 0> : ")
        case .win:
            print("이겼습니다!")
        case .lose:
            print("졌습니다!")
        case .draw:
            print("비겼습니다!")
        case .exit:
            print("게임 종료")
        }
    }
}
