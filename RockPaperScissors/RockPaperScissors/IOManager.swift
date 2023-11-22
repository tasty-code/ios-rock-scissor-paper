//
//  IOManager.swift
//  RockPaperScissors
//
//  Created by EUNJU on 2023/11/21.
//

import Foundation

final class IOManager {
    
    func showMessage(_ option: UserGuideMessage) {
        switch option {
            
        case .default:
            print("가위(1), 바위(2), 보(3)! <종료 : 0> : ")
        case .win:
            print("이겼습니다!")
        case .lose:
            print("졌습니다!")
        case .draw:
            print("비겼습니다!")
        case .inputError:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        case .exit:
            print("게임 종료")
        }
    }
}
