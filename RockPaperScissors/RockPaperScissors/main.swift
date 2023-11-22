//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

import Foundation

enum Choice: String, CaseIterable {
    case scissors = "가위"
    case rock = "바위"
    case paper = "보"
}

enum GameResult: String {
    case win = "이겼다!"
    case draw = "비겼다!"
    case lose = "졌다!"
}

func randomChoice() -> Choice? {
    return Choice.allCases.randomElement()
}

func playGame(player: Choice, computer: Choice) -> GameResult {
    print("나 : \(player.rawValue), 컴퓨터 : \(computer.rawValue)")
    
    switch (player, computer) {
    case (.rock, .scissors), (.scissors, .paper), (.paper, .rock):
        return .win
    case (.rock, .paper), (.scissors, .rock), (.paper, .scissors):
        return .lose
    default:
        return .draw
    }
}

var isEnd = false

while !isEnd {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    
    guard let input = readLine(), !input.isEmpty else {
        print("입력값이 없습니다. 다시 시도하세요.")
        continue
    }
    
    guard let playerChoiceInt = Int(input), playerChoiceInt >= 0, playerChoiceInt <= 3 else {
        print("잘못된 입력입니다. 1, 2, 3, 0 중 하나를 입력하세요.")
        continue
    }
    
    guard let computerChoice = randomChoice() else {
        continue
    }
    
    switch playerChoiceInt {
    case 0:
        isEnd = true
    case 1:
        let result = playGame(player: .scissors, computer: computerChoice)
        print(result.rawValue)
    case 2:
        let result = playGame(player: .rock, computer: computerChoice)
        print(result.rawValue)
    case 3:
        let result = playGame(player: .paper, computer: computerChoice)
        print(result.rawValue)
    default:
        break
    }
}
