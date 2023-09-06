//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

var isContinue = true
while isContinue {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
    let str = readLine() ?? "error"
    guard let num = Int(str), (0...3).contains(num) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        continue
    }
    var turn = true
    do {
        turn = try battle(player: num)
    } catch RPCError.sameHandError {
        print("비겼습니다!")
    } catch {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        isContinue = false
    }
    
    while true {
        let turnString = turn ? "사용자" : "컴퓨터"
        print("[\(turnString) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        let str2 = readLine() ?? "error"
        guard let num2 = Int(str2), (0...3).contains(num2) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
        if num == 0 {
            isContinue = false
            break
        }
        do {
            turn = try mukJjiBba(player: num2)
        } catch RPCError.sameHandError {
            print("\(turnString)의 승리!")
            isContinue = false
            break
        }
    }
}


func battle(player: Int) throws -> Bool {
    guard let computer = (1...3).randomElement() else {
        throw RPCError.invalidInputError
    }
    
    guard let playerHand = RockPaperScissors(rawValue: player), let computerHand = RockPaperScissors(rawValue: computer) else {
        throw RPCError.invalidInputError
    }
    
    if playerHand == computerHand {
        
        throw RPCError.sameHandError
    } else if computerHand < playerHand {
        print("이겼습니다!")
        return true
    } else {
        print("졌습니다!")
        return false
    }
}

func mukJjiBba(player: Int) throws -> Bool {
    guard let computer = (1...3).randomElement() else {
        throw RPCError.invalidInputError
    }
    
    guard let playerHand = RockPaperScissors(rawValue: player), let computerHand = RockPaperScissors(rawValue: computer) else {
        throw RPCError.invalidInputError
    }
    
    if playerHand == computerHand {
        
        throw RPCError.sameHandError
    } else if computerHand < playerHand {
        
        return true
    } else {
        
        return false
    }
}
