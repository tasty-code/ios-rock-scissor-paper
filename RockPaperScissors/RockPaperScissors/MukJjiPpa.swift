//
//  MukJjiPpa.swift
//  RockPaperScissors
//
//  Created by imseonghyeon on 2023/09/07.
//

import Foundation

class MukJjiPpa
{
    func play(_ gameResult : String) throws -> String
    {
        var whichTurn : String = gameResult
        print("[\(whichTurn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")

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
        
        
        func getResult(of user: Int) -> String
        {
            let computer = Int.random(in: 1...3)
            
            if user == computer
            {
                print("비겼습니다")
                return "repeat"
            }
            else if isWin(of: user, versus: computer)
            {
                print("이겼습니다")
                return "UserTurn"
            }
            else
            {
                print("졌습니다")
                return "ComputerTurn"
            }
            
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
