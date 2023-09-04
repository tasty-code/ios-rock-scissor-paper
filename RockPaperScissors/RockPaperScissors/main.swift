//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

while true {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ")
    var str = readLine() ?? "error"

    guard let num = Int(str), (0...3).contains(num) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        continue
    }
    
    switch num {
    case 0:
        break
    case 1:
        break
    case 2:
        break
    case 3:
        break
    default:
        break
    }
}

func battle(player: Int) {
    guard let computer = (1...3).randomElement() else {
        print("오류가 발생했습니다.")
        return
    }
    
    if player == 1 && computer == 1 {
        print("비겼습니다.")
    } else if player == 1 && computer == 2 {
        print("졌습니다.")
    } else {
        print("이겼습니다.")
    }
    
    
    if player == 2 && computer == 1 {
        print("이겼습니다.")
    } else if player == 2 && computer == 2 {
        print("비겼습니다.")
    } else {
        print("졌습니다.")
    }
    
    if player == 3 && computer == 1 {
        print("졌습니다.")
    } else if player == 3 && computer == 2 {
        print("이겼습니다.")
    } else {
        print("비겼습니다.")
    }
}
