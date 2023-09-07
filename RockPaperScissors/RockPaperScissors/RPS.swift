//
//  RPS.swift
//  RockPaperScissors
//
//  Created by imseonghyeon on 2023/09/07.
//

import Foundation

class RPS
{
    func play() throws -> Bool
    {
        let user: Int = try checkInput()

        switch user
        {
            case 0:
                print("게임 종료")
                return true
            case 1...3:
                let gameResult : Bool = getResult(of: user)
                return gameResult
            default:
                throw RockPaperScissorsError.invalidInput
        }
    }
    
    func getResult(of user: Int) -> Bool
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
}
