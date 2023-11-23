//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

import Foundation

enum RSPSelection: String {
    case exit = "0"
    case scissors = "1"
    case rock = "2"
    case paper = "3"
}

func RSPGame(_ myChoice: RSPSelection) -> Bool {
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
    }
    return false
}

while true {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :")
    if let input = readLine(),
       let select = RSPSelection(rawValue: input) {
        if RSPGame(select) {
            break
        }
    } else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

print("<프로그램을 종료합니다.>")
