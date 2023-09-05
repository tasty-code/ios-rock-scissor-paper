//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

import Foundation

var flag : Bool = false

func winLoseResult(_ input : Int) ->  Bool
{
    flag = false
    let computerHand = Int.random(in: 1...3)
    
    if (input == computerHand)
    {
        print("비겼습니다.")
        flag.toggle()
    }
    
    else if input == 1 && computerHand == 3
        || input == 2 && computerHand == 1
        || input == 3 && computerHand == 2
    {
       print(computerHand)
       print("이겼습니다")
    }
    else
    {
        print(computerHand)
        print("졌습니다")
    }

    return flag
}

while true {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    
    guard let input = readLine() else
    {
       break
    }
        
    guard let input = Int(input) else
    {
        break
    }
        
    switch input
    {
    case 0:
        print("게임 종료")
    case 1...3:
        winLoseResult(input)
    default:
        print("잘못된 입력입니다. 다시 입력해주세요")
            
    }
    
    if !flag
    {
        print("----------------------------------------")
        break
    }

}

