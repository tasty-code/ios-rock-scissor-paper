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

func playRockPaperScissor(userHand: String?) -> winDrawLose {
    var result: winDrawLose = .draw
    let comHand = randomComputerHand()
    
    if userHand == String(comHand) {
        result = .draw
        return result
    }
    
    switch userHand {
    case "1":
        result = comHand == "3" ? .win : .lose
    case "2":
        result = comHand == "1" ? .win : .lose
    case "3":
        result = comHand == "2" ? .win : .lose
    default :
        print("잘못된 입력입니다.")
    }
    
    return result
}

func main() {
    var userInput: String?
    repeat {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        userInput = readLine()
        
        switch userInput {
        case "0":
            print("게임 종료")
        case "1", "2", "3":
            var result: String
            result = playRockPaperScissor(userHand: userInput).rawValue
            print(result)
        default : 
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
        
    } while userInput != "0"
}


main()
