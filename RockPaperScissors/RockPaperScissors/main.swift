//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

import Foundation

enum RockScissorsPaper: String, CaseIterable {
    case exit = "0"
    case scissors = "1"
    case rock = "2"
    case paper = "3"
}

func RockScissorsPaperGame(_ userChoice: RockScissorsPaper) -> Bool {
    let userHand = Int(userChoice.rawValue)
    let computerHand = Int.random(in: 1...3)
    if userHand == 0 {
        return true
    } else if computerHand == userHand {
        print("비겼습니다!")
    } else if (computerHand == 1 && userHand == 2) ||
                (computerHand == 2 && userHand == 3) ||
                (computerHand == 3 && userHand == 1)  {
        print("이겼습니다!")
        return true
    }  else {
        print("졌습니다!")
        return true
    }
    return false
}

var onGame: Bool = true

func endGame() {
    onGame.toggle()
}

func launchGame(_ input: RockScissorsPaper) {
    if RockScissorsPaperGame(input) {
        endGame()
    }
}

while onGame {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :")
    if let input = readLine(),
       let select = RockScissorsPaper(rawValue: input) {
        launchGame(select)
    } else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}
