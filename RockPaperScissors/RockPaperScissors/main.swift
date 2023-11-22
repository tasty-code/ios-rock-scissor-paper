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
    
    let computerChoice = randomChoice()
    
    print("사용자: \(choice[playerChoice-1]) 컴퓨터: \(computerChoice)")
    
    switch playerChoice {
    case 0: isEnd = true
    case 1: if computerChoice == "보" {
        print("이겼다!")
    } else if computerChoice == "바위" {
        print("졌다!")
    } else {
        print("비겼다!")
    }
        break
    case 2: if computerChoice == "가위" {
        print("이겼다!")
    } else if computerChoice == "보" {
        print("졌다!")
    } else {
        print("비겼다!")
    }
        break
    case 3: if computerChoice == "바위" {
        print("이겼다!")
    } else if computerChoice == "가위" {
        print("졌다!")
    } else {
        print("비겼다!")
    }
        break

    default: print("잘못된 입력값입니다.")
    
    }
}

