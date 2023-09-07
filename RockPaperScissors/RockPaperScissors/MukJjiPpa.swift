//
//  MukJjiPpa.swift
//  RockPaperScissors
//
//  Created by imseonghyeon on 2023/09/07.
//

import Foundation

class MukJjiPpa : RPS
{
    private var whichTurn : String = ""
    
    func play(_ gameResult : String) throws -> String
    {
        whichTurn = gameResult
        while true
        {
            print("[\(whichTurn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
            
            do
            {
                let user: Int = try checkInput()

                switch user
                {
                case 0:
                    print("게임 종료")
                    return "exit"
                case 1...3:
                    let gameResult : String = getResult(of: user)
                    return gameResult
                default:
                    whichTurn = switchTurn(whichTurn)
                    throw ErrorCases.invalidInput
                }
            }
            catch ErrorCases.invalidInput
            {
                print("잘못된 입력입니다. 다시 입력해주세요")
            }
        }
    }
    
    override func getResult(of user: Int) -> String
    {
        let computer = Int.random(in: 1...3)
        
        if user == computer
        {
            print("\(whichTurn)의 승리!")
            return "exit"
        }
        else
        if isWin(of: user, versus: computer)
        {
            whichTurn = "사용자"
            print("\(whichTurn)의 턴입니다.")
            return whichTurn
        }
        else
        {
            whichTurn = "컴퓨터"
            print("\(whichTurn)의 턴입니다.")
            return whichTurn
        }
    }
    
    func switchTurn(_ gameResult : String) -> String
    {
        if gameResult == "사용자"
        {
            return "컴퓨터"
        }
        else
        {
            return "사용자"
        }
    }
    
    override func isWin(of user: Int, versus computer: Int) -> Bool
    {
        let winCase: [Int: Int] = [1: 2, 2: 3, 3: 1]
        
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

