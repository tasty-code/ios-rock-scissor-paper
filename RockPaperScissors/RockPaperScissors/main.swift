//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation
var isContinue = true

while isContinue {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
    let str = readLine() ?? "error"

    guard let num = Int(str), (0...3).contains(num) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        continue
    }
    isContinue = battle(player: num)
}


func battle(player: Int) -> Bool {
    guard let computer = (1...3).randomElement() else {
        print("오류가 발생했습니다.")
        return false
    }
    
    guard let playerHand = RockPaperScissors(rawValue: player), let computerHand = RockPaperScissors(rawValue: computer) else {
        print("오류가 발생했습니다.")
        return false
    }
    
    if playerHand == computerHand {
        print("비겼습니다!")
        return true
    }else if computerHand < playerHand {
        print("이겼습니다!")
        return false
    }else{
        print("졌습니다!")
        return false
    }
}
