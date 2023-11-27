//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation


func playRockPaperScissor(userHand: Int)-> GameResult {
    let computerHand = RockScissorPaper(rawValue: Int.random(in: 1...3))
    let userHand = RockScissorPaper(rawValue: userHand)
    
    if userHand == computerHand {
        return .draw
    }
    
    switch userHand {
    case .scissor:
        return computerHand == .paper ? .win : .lose
    case .rock:
        return computerHand == .scissor ? .win : .lose
    case .paper:
        return computerHand == .rock ? .win : .lose
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
            guard let userHand = userInput, let intUserHand = Int(userHand) else {
                break
            }
            
            let result = playRockPaperScissor(userHand: intUserHand )
            print(result.rawValue)
            
            if result == .win || result == .lose {
                break gameLoop
            }
            
        default :
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    } while userInput != "0"
    
    print("게임 종료")
}


main()
