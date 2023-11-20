//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

let opponentHands: [Int] = [1, 2, 3]

func choiceRockScissorsPaper() {
    let isRunning: Bool = true
    
    while isRunning {
        print("가위(1), 바위(2), 보(3)! <종료: 0> :", terminator: " ")
        guard let input = readLine() else { return }
        guard let input2 = Int(input) else { return }
        
        switch input2 {
        case 0:
            return
        case 1...3:
            return
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


