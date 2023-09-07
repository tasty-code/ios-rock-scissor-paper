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
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")

    do
    {
        let gameResult : Bool = try RPS().play()

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

func shouldByClose(_ gameResult : Bool) -> Bool
{
    if gameResult
    {
        print("---------------------------------------")
        return true
    }
    else
    {
        return false
    }
}
