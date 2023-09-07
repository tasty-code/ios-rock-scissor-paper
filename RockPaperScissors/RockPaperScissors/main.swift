//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

var isContinue = true
while isContinue {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
    let playerInput = readLine() ?? "error"
    guard let playerHandType = Int(playerInput), (0...3).contains(playerHandType) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        continue
    }
    
    do {
        guard let computerHandType = (1...3).randomElement() else {
            throw PlayingGameException.invalidInputError
        }
        isContinue = try battle(playerHandType, and: computerHandType)
    } catch {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

func battle(_ player1: Int, and player2: Int) throws -> Bool {
    guard let playerHandShape = RockPaperScissors(rawValue: player1), let player2HandShape = RockPaperScissors(rawValue: player2) else {
        throw PlayingGameException.invalidInputError
    }
    
    if playerHandShape == player2HandShape {
        print("비겼습니다!")
        return true
    } else if player2HandShape < playerHandShape {
        print("이겼습니다!")
        return false
    } else {
        print("졌습니다!")
        return false
    }
}
