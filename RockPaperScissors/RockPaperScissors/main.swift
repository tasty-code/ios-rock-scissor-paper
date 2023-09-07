//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

import Foundation

enum RockPaperScissorsError: Error
{
    case invalidInput
}

while true
{
    do
    {
        let gameResult : String = try RPS().play()
        var isUserTurn: String = ""

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
           isUserTurn = MukJjiPpa().isUserTurn(gameResult)
        }

        print("묵찌빠 하세요")
        // 묵찌빠.play()
        
        print(isUserTurn)
        
        if shouldByClose(gameResult)
        {
            break
        }
        
        
    }
    catch RockPaperScissorsError.invalidInput
    {
        print("잘못된 입력입니다. 다시 입력해주세요")
    }

}

func checkInput() throws -> Int
{
    guard let user = readLine(), let user = Int(user) else
    {
        throw RockPaperScissorsError.invalidInput
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

