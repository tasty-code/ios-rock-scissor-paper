//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation



func randomComputerHand() -> (Int) {
    return Int.random(in: 1...3)
}

func playerRockPaperScissor() {
    var userHand = 0
    let comHand = randomComputerHand()
    repeat {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        if let input = readLine(), let playerInput = Int(input) {
            print("플레이어 선택 \(playerInput)")
            print("컴퓨터의 선택 \(comHand)")
        }
        
        
        if userHand == 0 {
            print("게임 종료")
            break
        }
    } while userHand != 0
}


playerRockPaperScissor()
