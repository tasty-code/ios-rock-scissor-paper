//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

import Foundation

enum UserInput: String {
    case scissor = "1"
    case rock = "2"
    case paper = "3"
    case exit = "0"
}

enum Result: String {
    case menu = "가위(1), 바위(2), 보(3)! <종료: 0> : "
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
    case exit = "게임 종료"
    case error = "잘못된 입력입니다. 다시 시도해주세요."
}

func processUserInput(comPick: UserInput, userPick: UserInput) {
    switch userPick {
    case .exit:
        gameOver()
    case .paper, .rock, .scissor:
        printGameResult(comPick: comPick, userPick: userPick)
    }
}

func returnResult(comPick: UserInput, userPick: UserInput) -> Result {
    let isPlayerWin: Bool = (comPick == .scissor && userPick == .rock) ||
                               (comPick == .rock && userPick == .paper) ||
                               (comPick == .paper && userPick == .scissor)
    
    if comPick == userPick {
        return .draw
    }
    
    if isPlayerWin {
        return .win
    }
    
    return .lose
}

func printResult(for situation: Result) {
    switch situation {
    case .menu:
        print(situation.rawValue, terminator: "")
    default:
        print(situation.rawValue)
    }
}

func printGameResult(comPick: UserInput, userPick: UserInput) {
    let result: Result = returnResult(comPick: comPick, userPick: userPick)
    
    printResult(for: result)
    
    if result == .draw {
        return
    }

    gameOver()
}

func gameOver() {
    printResult(for: .exit)
    isGameWorking.toggle()
}

var isGameWorking: Bool = true
let comChoices: [String] = ["1", "2", "3"]
let playerChoices: [String] = ["0", "1", "2", "3"]

while isGameWorking {
    printResult(for: .menu)
    guard let randomComChoice = comChoices.randomElement(), let comPick = UserInput(rawValue: randomComChoice) else {
        continue
    }
    
    guard let input = readLine(), let userPick = UserInput(rawValue: input), playerChoices.contains(userPick.rawValue) else {
        printResult(for: .error)
        continue
    }
    
    processUserInput(comPick: comPick, userPick: userPick)
}
