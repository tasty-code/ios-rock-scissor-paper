//
//  MukJjiPpa.swift
//  RockPaperScissors
//
//  Created by imseonghyeon on 2023/09/07.
//

import Foundation

class MukJjiPpa: RPS
{
    override func startMessage()
    {
        print("[\(whichTurn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    }
    
    override func getResult(of user: Int) -> String
    {
        let computer = Int.random(in: 1 ... 3)
        
        if user == computer
        {
            print("\(whichTurn)의 승리!")
            return "exit"
        }
        else if isWin(of: user, versus: computer)
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
    
    override func isWin(of user: Int, versus computer: Int) -> Bool
    {
        let winCase: [Int: Int] =
        [
            CasesOf.rock.rawValue: CasesOf.paper.rawValue,
            CasesOf.paper.rawValue: CasesOf.scissors.rawValue,
            CasesOf.scissors.rawValue: CasesOf.rock.rawValue
        ]
        
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
