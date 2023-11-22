//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

import Foundation

let choice = ["rock", "scissors", "paper"]

var isEnd = false

while(isEnd == false) {
    print("바위(1) 가위(2) 보(3) 중 선택하시오!")
    let playderChoice = Int(readLine()!)
    
    switch playderChoice {
    case 1: print(choice[0])
        break
    case 2: print(choice[1])
        break
    case 3: print(choice[2])
        break

    default: print("잘못된 입력값입니다.")
    
    }

    isEnd = true
}
