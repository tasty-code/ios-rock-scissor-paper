//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

enum Selection: String {
    case exit = "0"
    case scissors = "1"
    case rock = "2"
    case paper = "3"
}

while true {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :")
    if let input = readLine(), let select = Selection(rawValue: input) {
        handleSelection(select)
    } else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

func handleSelection(_ enumValue: Selection) {
    switch enumValue {
    case .exit:
        exit(0)
    case .scissors:
        runningGame(1)
    case .rock:
        runningGame(2)
    case .paper:
        runningGame(3)
    }
}

func runningGame(_ myChoice: Int) {
    var comChoice = Int.random(in: 1...3)
    if comChoice == myChoice {
        print("비겼습니다!")
    } else if comChoice == 1 && myChoice == 2 {
        print("이겼습니다!")
        exit(0)
    } else if comChoice == 2 && myChoice == 3 {
        print("이겼습니다!")
        exit(0)
    } else if comChoice == 3 && myChoice == 1 {
        print("이겼습니다!")
        exit(0)
    } else {
        print("졌습니다!")
        exit(0)
    }
}
