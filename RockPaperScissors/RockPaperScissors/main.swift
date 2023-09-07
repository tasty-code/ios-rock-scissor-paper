//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

import Foundation

enum ErrorCases: Error
{
    case invalidInput
}

while true
{
    do
    {
        let gameResult : String = try RPS().play()
        
        if shouldByClose(gameResult)
        {
            break
        }

        if isRepeatRPC(gameResult)
        {
            continue
        }
        else
        {
            //           isUserTurn = MukJjiPpa().isUserTurn(gameResult)
           try MukJjiPpa().play(gameResult)
        }
        
        if shouldByClose(gameResult)
        {
            break
        }
        
        
    }
    catch ErrorCases.invalidInput
    {
        print("잘못된 입력입니다. 다시 입력해주세요")
    }

}

func checkInput() throws -> Int
{
    guard let user = readLine(), let user = Int(user) else
    {
        throw ErrorCases.invalidInput
    }
    return user
}

func shouldByClose(_ gameResult : String) -> Bool
{
    if gameResult == "exit"
    {
        print("---------------------------------------")
        return true
    }
    else
    {
        return false
    }
}

func isRepeatRPC(_ gameResult : String) -> Bool
{
    if gameResult == "repeat"
    {
        return true
    }
    else
    {
        return false
    }
}

func isWin(of user: Int, versus computer: Int) -> Bool
{
    let winCase: [Int: Int] = [1: 3, 2: 1, 3: 2]
    
    if winCase[user] == computer
    {
        return true
    }
    else
    {
        return false
    }
}
