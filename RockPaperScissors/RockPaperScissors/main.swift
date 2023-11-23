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

func runningGame(_ myChoice: Selection) {
    let myChoice = Int(myChoice.rawValue)
    let comChoice = Int.random(in: 1...3)
    if myChoice == 0 {
        exit(0)
    } else if comChoice == myChoice {
        print("비겼습니다!")
    } else if (comChoice == 1 && myChoice == 2) ||
              (comChoice == 2 && myChoice == 3) ||
              (comChoice == 3 && myChoice == 1)  {
        print("이겼습니다!")
        exit(0)
    }  else {
        print("졌습니다!")
        exit(0)
    }
}

while true {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :")
    if let input = readLine(),
       let select = Selection(rawValue: input) {
        runningGame(select)
    } else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}
