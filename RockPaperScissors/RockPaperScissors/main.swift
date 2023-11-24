//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

import Foundation

enum RockScissorsPaper: String {
    case scissors = "1"
    case rock = "2"
    case paper = "3"
}

func RockScissorsPaperGame(_ myChoice: RockScissorsPaper) -> Bool {
    let myChoice = Int(myChoice.rawValue)
    let comChoice = Int.random(in: 1...3)
    if myChoice == 0 {
        return true
    } else if comChoice == myChoice {
        print("비겼습니다!")
    } else if (comChoice == 1 && myChoice == 2) ||
                (comChoice == 2 && myChoice == 3) ||
                (comChoice == 3 && myChoice == 1)  {
        print("이겼습니다!")
        return true
    }  else {
        print("졌습니다!")
        return true
    }
    return false
}

while true {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :")
    if let input = readLine(),
       let select = RockScissorsPaper(rawValue: input) {
        if RockScissorsPaperGame(select) {
            break
        }
    } else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

print("<프로그램을 종료합니다.>")
