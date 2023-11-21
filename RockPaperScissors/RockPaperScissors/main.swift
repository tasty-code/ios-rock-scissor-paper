//
//  RockPaperScissors - main.swift
//  Created by mireu & kyle.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

let opponentHands: [Int] = [1, 2, 3]

func choiceRockScissorsPaper() {
    let isRunning: Bool = true
    
    while isRunning {
        let computer = checkingOpponentHand()
        print(computer)
        print("가위(1), 바위(2), 보(3)! <종료: 0> :", terminator: " ")
        guard let input = readLine() else { return }
        guard let input2 = Int(input) else { return }
        
        switch input2 {
        case 0:
            return
        case 1...3:
            playGame(user: input2, computer: computer)
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
         continue
        }
    }
}

func checkingOpponentHand() -> Int {
    guard let opponentHand = opponentHands.randomElement() else { return 0 }
    
    return opponentHand
}

func playGame(user: Int, computer: Int) {
    switch (user, computer) {
    case (1,2),(2,3),(3,1):
        print("졌습니다!")
    case (1,3),(2,1),(3,2):
        print("이겼습니다!")
    default:
        print("비겼습니다!")
    }
}

choiceRockScissorsPaper()
