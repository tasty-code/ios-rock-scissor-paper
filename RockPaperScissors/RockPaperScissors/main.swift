//
//  RockPaperScissors - main.swift
//  Created by mireu & kyle.
//  Copyright © tastycode. All rights reserved.
//

import Foundation

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
        
        switch user {
        case 0:
            print("게임종료")
            return
        case 1...3:
            playGame(user: user, computer: computer)
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

func playGame(user: Int, computer: Int) {
    switch (user, computer) {
    case (1,2),(2,3),(3,1):
        print("졌습니다!")
        print("게임종료")
        isRunning = false
    case (1,3),(2,1),(3,2):
        print("이겼습니다!")
        print("게임종료")
        isRunning = false
    default:
        print("비겼습니다!")
    }
}

choiceRockScissorsPaper()
