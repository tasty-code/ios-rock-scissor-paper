//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//
var userSelect: String?
var computerSelect: String
var isRunning: Bool = true

while isRunning {
    print("가위(1), 바위(2), 보(3)! <종료 : 0 > : ", terminator: "")
    userSelect = readLine()
    computerSelect = String(Int.random(in: 1...3))
    
    guard let select = userSelect else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        break
    }
    
    switch select {
    case "0":
        isRunning = false
    case "1", "2", "3":
        if select == computerSelect {
            print("비겼습니다")
            break
        } else if select == "1" && computerSelect == "3" ||
            select == "2" && computerSelect == "1" ||
            select == "3" && computerSelect == "2" {
            print("이겼습니다")
            isRunning = false
        } else {
            print("졌습니다")
            isRunning = false
        }
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        break
    }
}

print("게임 종료")
