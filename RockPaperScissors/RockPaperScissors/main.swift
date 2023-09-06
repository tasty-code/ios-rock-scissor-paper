//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

/// Error - Type 'WrongInput' does not conform to protocol 'CustomStringConvertible'
enum WrongInput: Error, CustomDebugStringConvertible {
    case tryAgain
    
    var debugDescription: String {
        switch self {
        case .tryAgain:
            return "잘못된 입력입니다. 다시 시도해주세요."
        default:
            return ""
        }
    }
}

func run() {
    while true {
        start()
        
    }
}


func start() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :")
    /// Error - Value of optional type 'String?' must be unwrapped to a value of type 'String
    /// Coalesce using '??' to provide a default when the optional value contains 'nil'
    /// Force-unwrap using '!' to abort execution if the optional value contains 'nil'
    let userInput: String? = readLine() ?? nil
    
    /// Call can throw, but it is not marked with 'try' and the error is not handled
    do { try isRightInput(userInput) } catch {
        print(error)
    }
}

func isRightInput(_ userInput: String?) throws -> Int {
    switch userInput {
    case "1":
        return 1
    case "2":
        return 2
    case "3":
        return 3
    case "0":
        print("게임 종료")
        return 4
    default:
        throw WrongInput.tryAgain
    }
}


