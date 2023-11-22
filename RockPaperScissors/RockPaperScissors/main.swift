//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

import Foundation

let choice = ["가위", "바위", "보"]

var isEnd = false

func randomChoice () -> String{
    let randomElement = choice.randomElement()
    
    if let randomElement {
        return randomElement
    } else {
        return "값 없음"
    }
}

while(isEnd == false) {
    print("가위(1) 바위(2) 보(3)! <종료 : 0> :")
    
    guard let playerChoice = readLine() else {
        continue
    }
    
    guard let playerChoice = Int(playerChoice) else {
        continue
    }
    
    let compuerChoice = randomChoice()
    
    print("사용자: \(choice[playerChoice-1]) 컴퓨터: \(compuerChoice)")
    
    switch playerChoice {
    case 0: isEnd = true
    case 1: print(choice[0])
        break
    case 2: print(choice[1])
        break
    case 3: print(choice[2])
        break

    default: print("잘못된 입력값입니다.")
    
    }
}

