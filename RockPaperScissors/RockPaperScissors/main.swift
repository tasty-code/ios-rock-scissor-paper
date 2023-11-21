//
//  RockPaperScissors - main.swift
//  Created by mireu & kyle.
//  Copyright © tastycode. All rights reserved.
//

import Foundation

enum Choice: Int {
    case scissor = 1
    case rock = 2
    case paper = 3
}

let opponentHands: [Int] = [1, 2, 3]
var isRunning: Bool = true

func choiceRockScissorsPaper() {
    
    while isRunning {
        let computer = checkingOpponentHand()
        print(computer)
        print("가위(1), 바위(2), 보(3)! <종료: 0> :", terminator: " ")
        guard
            let input = readLine(),
            let user = Int(input)
        else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
        
        guard
            let userChoice = Choice(rawValue: user),
            let computerChoice = Choice(rawValue: computer)
        else {
            return
        }
        
        switch user {
        case 0:
            print("게임종료")
            return
        case 1...3:
            playGame(user: userChoice, computer: computerChoice)
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
    }
}

func checkingOpponentHand() -> Int {
    guard
        let opponentHand = opponentHands.randomElement()
    else {
        return 0
    }
    
    return opponentHand
}

func playGame(user: Choice, computer: Choice) {
    switch (user, computer) {
    case (.scissor,.rock),(.rock,.paper),(.paper,.scissor):
        print("졌습니다!")
        print("게임종료")
        isRunning = false
    case (.scissor,.paper),(.rock,.scissor),(.paper,.rock):
        print("이겼습니다!")
        print("게임종료")
        isRunning = false
    default:
        print("비겼습니다!")
    }
}

choiceRockScissorsPaper()
