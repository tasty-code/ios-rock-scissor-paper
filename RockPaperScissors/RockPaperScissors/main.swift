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

func playRockPaperScissor(userHand: Int?) -> WinDrawLose {
    let comHand = RockScissorPaper(rawValue: Int.random(in: 1...3))
    let userHand = RockScissorPaper(rawValue: userHand ?? 0)
    
    if userHand == comHand {
        return .draw
    }
    
    switch userHand {
    case .scissor:
        return comHand == .paper ? .win : .lose
    case .rock:
        return comHand == .scissor ? .win : .lose
    case .paper:
        return comHand == .rock ? .win : .lose
    case .none:
        return .draw
    }
}

func main() {
    var userInput: String?

    gameLoop : repeat {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        userInput = readLine()
        
        switch userInput {
        case "0":
            break gameLoop
        case "1", "2", "3":
            if let userHand = userInput {
                let result = playRockPaperScissor(userHand: Int(userHand))
                print(result.rawValue)
                
                if result == .win || result == .lose {
                    break gameLoop
                }
                
            }
        default :
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    } while userInput != "0"
    
    print("게임 종료")
}


main()
