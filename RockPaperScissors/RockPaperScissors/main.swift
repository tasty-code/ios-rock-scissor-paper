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

enum Result: String {
    case win = "이겼다!"
    case draw = "비겼다!"
    case lose = "졌다!"
}

func randomChoice() -> Choice {
    if let randomChoice = Choice.allCases.randomElement() {
        return randomChoice
    }
    return .rock
}

func playGame(player: Choice, computer: Choice) -> Result {
    switch (player, computer) {
    case (.rock, .scissors), (.scissors, .paper), (.paper, .rock):
        return .win
    case (.rock, .paper), (.scissors, .rock), (.paper, .scissors):
        return .lose
    default:
        return .draw
    }
}

func printResult(result: Result) {
    print(result.rawValue)
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

    if playerChoiceInt == 0 {
        isEnd = true
    } else {
        let playerChoice = Choice.allCases[playerChoiceInt - 1]
        let computerChoice = randomChoice()
        let result = playGame(player: playerChoice, computer: computerChoice)
        print("나 : \(playerChoice.rawValue), 컴퓨터 : \(computerChoice.rawValue)")
        printResult(result: result)
    }
}
