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
        isContinue = try battle(player: playerHandType)
    } catch {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

func battle(player: Int) throws -> Bool {
    guard let computerHandType = (1...3).randomElement() else {
        throw PlayingGameException.invalidInputError
    }
    
    guard let playerHandShape = RockPaperScissors(rawValue: player), let computerHandShape = RockPaperScissors(rawValue: computerHandType) else {
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
