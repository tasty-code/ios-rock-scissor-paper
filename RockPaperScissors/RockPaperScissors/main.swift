//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

import Foundation

var isWin : [Int : Int] = [1:3, 2:1, 3:2]
var isExitCondition : Bool = false

func getGameResult(of user : Int)
{
    isExitCondition = false
    let computer = Int.random(in: 1...3)
    
    if user == computer
    {
        print("비겼습니다")
        isExitCondition.toggle()
    }
    
    else if isWin[user] == computer
    {
       print("이겼습니다")
    }
    else
    {
        print("졌습니다")
    }
}

while true {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    
    guard let input = readLine(), let input = Int(input) else
    {
       break
    }
        
    switch input
    {
    case 0:
        print("게임 종료")
    case 1...3:
        getGameResult(of: input)
    default:
        print("잘못된 입력입니다. 다시 입력해주세요")
            
    }
    
    if !isExitCondition
    {
        print("----------------------------------------")
        break
    }

}
