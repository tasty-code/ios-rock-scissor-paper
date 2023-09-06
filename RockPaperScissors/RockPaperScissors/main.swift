//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

import Foundation

var isExitCondition : Bool = false

func getGameResult(of user : Int)
{
    isExitCondition = false
    let computer = Int.random(in: 1...3)
    
    if user == computer
    {
        print("비겼습니다")
    }
    else if isWin(of: user, versus: computer)
    {
       print("이겼습니다")
       isExitCondition.toggle()
    }
    else
    {
        print("졌습니다")
        isExitCondition.toggle()
    }
}

func isWin(of user : Int, versus computer : Int) -> Bool
{
    let winCase : [Int : Int] = [1:3, 2:1, 3:2]

    if winCase[user] == computer
    {
        return true
    }
    else
    {
        return false
    }
}

while true
{
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    
    guard let user = readLine(), let user = Int(user) else
    {
       break
    }
        
    switch user
    {
    case 0:
        print("게임 종료")
    case 1...3:
        getGameResult(of: user)
    default:
        print("잘못된 입력입니다. 다시 입력해주세요")
    }
    
    if isExitCondition
    {
        print("----------------------------------------")
        break
    }
}



