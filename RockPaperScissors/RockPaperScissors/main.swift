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
        let gameResult : Bool = try playRockPaperScissors()

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

func playRockPaperScissors() throws -> Bool
{
    let user: Int = try checkInput()

    switch user
    {
        case 0:
            print("게임 종료")
            return true
        case 1...3:
            let gameResult : Bool = getGameResult(of: user)
            return gameResult
        default:
            throw RockPaperScissorsError.invalidInput
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

func getGameResult(of user: Int) -> Bool
{
    let computer = Int.random(in: 1...3)

    if user == computer
    {
        print("비겼습니다")
        return false
    }
    else if isWin(of: user, versus: computer)
    {
        print("이겼습니다")
        return true
    }
    else
    {
        print("졌습니다")
        return true
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
