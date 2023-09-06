//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

enum InterfaceScript {
    
    enum Menu: CustomStringConvertible {
        case userInput, exitProgram
        
        var description: String {
            switch self {
            case .userInput: return "가위(1), 바위(2), 보(3)! <종료 : 0> : "
            case .exitProgram: return "게임 종료"
            }
        }
    }
    
    enum Failure: Error, CustomDebugStringConvertible {
        case wrongInput
        
        var debugDescription: String {
            switch self {
            case .wrongInput: return "잘못된 입력입니다. 다시 시도해주세요."
            }
        }
        
    }
    
    enum GameResult: CustomStringConvertible {
        case win, lose, draw
        
        var description: String {
            switch self {
            case .win: return "이겼습니다!"
            case .lose: return "졌습니다!"
            case .draw: return "비겼습니다!"
            }
        }
        
    }
    
}

