//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

enum ChoiceMenu: String {
    case scissor = "1" , rock = "2", paper = "3", exit = "0"
}

func action(com: ChoiceMenu, user: ChoiceMenu) {
    switch user {
    case .exit:
        endGame()
    case .paper, .rock, .scissor:
        startGame(comPick: com, userPick: user)
    }
}

func startGame(comPick: ChoiceMenu, userPick: ChoiceMenu) {
    if comPick == userPick {
        print("비겼습니다!")
    } else if (comPick == .scissor && userPick == .rock) ||
                (comPick == .rock && userPick == .paper) ||
                (comPick == .paper && userPick == .scissor)
    {
        print("이겼습니다!")
        endGame()
    } else {
        print("졌습니다!")
        endGame()
    }
}

func endGame() {
    print("게임 종료")
    isWorking.toggle()
}

var isWorking: Bool = true
let rps: [String] = ["1", "2", "3"]

while isWorking {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
    let comChoice: String = rps.randomElement() ?? ""

    guard let userChoice = readLine(), ["0", "1", "2", "3"].contains(userChoice) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        continue
    }
    
    action(com: ChoiceMenu(rawValue: comChoice) ?? .exit, user: ChoiceMenu(rawValue: userChoice) ?? .exit)
}


