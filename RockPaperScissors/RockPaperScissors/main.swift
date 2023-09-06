//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

runGame()

func runGame() {
    do {
        let turnOwner = try doRockPaperScissors()
        let winner = try doMukJjiPpa(isPlayerTurn: turnOwner)
        print(winner ? "사용자의 승리!" : "컴퓨터의 승리!")
    } catch RPCError.zeroExit {
        print("게임 종료.")
    } catch {
        print(error.localizedDescription)
    }
}

func getInteger() throws -> Int{
    let str = readLine() ?? "error"
    guard let num = Int(str), (0...3).contains(num) else {
        throw RPCError.invalidInputError
    }
    return num
}

func doRockPaperScissors() throws -> Bool {
    while true {
        print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
        do {
            let playerHand = try getInteger()
            if playerHand == 0 {
                throw RPCError.zeroExit
            }
            return try battle(player: playerHand)
        } catch RPCError.invalidInputError {
            print("잘못된 입력입니다. 다시 시도해주세요.")
        } catch RPCError.sameHandError {
            print("비겼습니다.")
            continue
        }
    }
}

func doMukJjiPpa(isPlayerTurn: Bool) throws -> Bool {
    var turnOwner = isPlayerTurn
    while true {
        let ownerString = turnOwner ? "사용자" : "컴퓨터"
        print("[\(ownerString) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        do {
            let playerHand = try getInteger()
            if playerHand == 0 {
                throw RPCError.zeroExit
            }
            turnOwner = try mukJjiBba(player: playerHand)
        } catch RPCError.sameHandError {
            return turnOwner
        } catch RPCError.invalidInputError {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            turnOwner = false
        }
        print("\(turnOwner ? "사용자" : "컴퓨터")의 턴입니다.")
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
