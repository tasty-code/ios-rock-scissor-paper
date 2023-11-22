//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

enum winDrawLose: String {
    case win = "이겼습니다!"
    case draw = "비겼습니다!"
    case lose = "졌습니다!"
}

func randomComputerHand() -> String {
    return String(Int.random(in: 1...3))
}

func compareHands(userHand: String?) -> winDrawLose {
    var result: winDrawLose = winDrawLose.draw
    let comHand = randomComputerHand()
    if userHand == String(comHand) {
        result = winDrawLose.draw
        return result
    }
    switch userHand {
    case "1":
        result = comHand == "3" ? winDrawLose.win : winDrawLose.lose
    case "2":
        result = comHand == "1" ? winDrawLose.win : winDrawLose.lose
    case "3":
        result = comHand == "2" ? winDrawLose.win : winDrawLose.lose
    default :
        print("잘못된 입력입니다.")
    }
    return result
}

func playRockPaperScissor() {
    var userInput: String?
    repeat {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        var result: String
        userInput = readLine()
        switch userInput {
        case "0":
            print("게임 종료")
        case "1", "2", "3":
    
                result = compareHands(userHand: userInput).rawValue
                print(result)
            default : print("잘못된 입력입니다. 다시 시도해주세요.")
        }
        
    } while userInput != "0"
}


playRockPaperScissor()
