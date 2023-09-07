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
    } catch PlayingGameException.zeroExit {
        print("게임 종료.")
    } catch {
        print("오류가 발생했습니다.")
    }
}

func getHandType() throws -> Int{
    let playerInput = readLine() ?? "error"
    guard let playerHandType = Int(playerInput), (0...3).contains(playerHandType) else {
        throw PlayingGameException.invalidInputError
    }
    return playerHandType
}

func doRockPaperScissors() throws -> Bool {
    while true {
        print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
        do {
            let playerHandShape = try getHandType()
            if playerHandShape == 0 {
                throw PlayingGameException.zeroExit
            }
            guard let computerHandShape = (1...3).randomElement() else {
                throw PlayingGameException.invalidInputError
            }
            return try battle(playerHandShape, and: computerHandShape)
        } catch PlayingGameException.invalidInputError {
            print("잘못된 입력입니다. 다시 시도해주세요.")
        } catch PlayingGameException.sameHandError {
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
            let playerHand = try getHandType()
            if playerHand == 0 {
                throw PlayingGameException.zeroExit
            }
            turnOwner = try mukJjiBba(player: playerHand)
        } catch PlayingGameException.sameHandError {
            return turnOwner
        } catch PlayingGameException.invalidInputError {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            turnOwner = false
        }
        print("\(turnOwner ? "사용자" : "컴퓨터")의 턴입니다.")
    }
}

func battle(_ player1: Int, and player2: Int) throws -> Bool {
    guard let playerHandShape = RockPaperScissors(rawValue: player1), let computerHandShape = RockPaperScissors(rawValue: player2) else {
        throw PlayingGameException.invalidInputError
    }
    
    if playerHandShape == computerHandShape {
        print("비겼습니다!")
        return true
    } else if computerHandShape < playerHandShape {
        print("이겼습니다!")
        return false
    } else {
        print("졌습니다!")
        return false
    }
}




func mukJjiBba(player: Int) throws -> Bool {
    guard let computer = (1...3).randomElement() else {
        throw PlayingGameException.invalidInputError
    }
    
    guard let playerHand = RockPaperScissors(rawValue: player), let computerHand = RockPaperScissors(rawValue: computer) else {
        throw PlayingGameException.invalidInputError
    }
    
    if playerHand == computerHand {
        throw PlayingGameException.sameHandError
    } else if computerHand < playerHand {
        return true
    } else {
        return false
    }
}
