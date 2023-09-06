//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation


enum  Alert: String {
    case tryAgain = "잘못된 입력입니다. 다시 시도해주세요."
    case end = "게임 종료"
    case draw = "비겼습니다!"
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case prompt = "가위(1), 바위(2), 보(3)! <종료 : 0> :"
}

enum RockSissorPaper: String {
    case sissor = "1"
    case rock = "2"
    case paper = "3"
    
    var value: Int {
        switch self {
        case .sissor:
            return 1
        case .rock:
            return 2
        case .paper:
            return 3
        }
    }
}

var isRunning: Bool = true

while isRunning {
    print(Alert.prompt.rawValue)
    let choice = userInput()

    guard choice != 0 else {
        print(Alert.end.rawValue)
        isRunning = false
        break
    }
    
    let computerChoice = Int.random(in: 1...3)
    
    guard !(choice == 3 && computerChoice == 1) else {
        print(Alert.lose.rawValue)
        isRunning = false
        break
    }
    
    guard !(choice == 1 && computerChoice == 3) else {
        print(Alert.win.rawValue)
        isRunning = false
        break
    }
    
    
    if choice == computerChoice {
        print(Alert.draw.rawValue)
    } else if choice > computerChoice {
        print(Alert.win.rawValue)
        isRunning = false
    } else if choice < 0 {
        print(Alert.tryAgain.rawValue)
    } else {
        print(Alert.lose.rawValue)
        isRunning = false
    }
}

func userInput() -> Int {
    let userInput = readLine()
    guard let input = userInput else {
        print(Alert.tryAgain.rawValue)
        return -1
    }
    guard let choice = Int(input) else {
        print(Alert.tryAgain.rawValue)
        return -1
    }
    
    return choice
}




