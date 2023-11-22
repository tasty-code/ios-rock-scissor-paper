//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

enum WinDrawLose: String {
    case win = "이겼습니다!"
    case draw = "비겼습니다!"
    case lose = "졌습니다!"
}

enum RockScissorPaper: Int {
    case scissor = 1, rock, paper
    subscript(index: Int) -> RockScissorPaper? {
        return RockScissorPaper(rawValue: index)
    }
}

func playRockPaperScissor(userHand: Int) -> WinDrawLose {
    let comHand = RockScissorPaper(rawValue: Int.random(in: 1...3))
    let userHand = RockScissorPaper(rawValue: userHand)
    var result: WinDrawLose = .draw
    
    if userHand == comHand {
        return .draw
    }
    
    switch userHand {
    case .scissor:
        result = comHand == .paper ? .win : .lose
    case .rock:
        result = comHand == .scissor ? .win : .lose
    case .paper:
        result = comHand == .rock ? .win : .lose
    default:
        print("잘못된 접근입니다.")
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
            if let userHand = userInput {
                var result = playRockPaperScissor(userHand: Int(userHand) ?? 0).rawValue
                print(result)
            }
        default :
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
        
    } while userInput != "0"
}


main()
