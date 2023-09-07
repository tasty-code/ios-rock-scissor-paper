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
        else if isWin(of: user, versus: computer)
        {
            
            return "repeat"
        }
        else
        {
            print("졌습니다")
            return ""
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
}
