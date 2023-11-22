//
//  RockPaperScissorsManager.swift
//  RockPaperScissors
//
//  Created by EUNJU on 2023/11/21.
//

import Foundation

final class RockPaperScissorsManager {
    
    /// 사용자 입력 유효성 검사 메서드
    func validateUserInput(_ input: String?) -> Int {
        guard let input else {
            return -1
        }
        
        switch input {
        case "0": return 0
        case "1": return 1
        case "2": return 2
        case "3": return 3
        default: return -1
        }
    }
    
    /// 게임결과 판단 메서드
    func judgeGame(user: Int, computer: Int) -> UserGuideMessage {
        if user == computer {
            return .draw
        }
        
        switch user {
        case 1:
            return computer == 3 ? .win : .lose
        case 2:
            return computer == 1 ? .win : .lose
        case 3:
            return computer == 2 ? .win : .lose
        default:
            return .inputError
        }
    }
}
