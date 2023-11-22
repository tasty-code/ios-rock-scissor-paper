//
//  RockPaperScissorsManager.swift
//  RockPaperScissors
//
//  Created by EUNJU on 2023/11/21.
//

import Foundation

class RockPaperScissorsManager {
    
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
}
