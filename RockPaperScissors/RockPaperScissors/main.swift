//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

func main() {
    
    let user = Player(name: "사용자")
    let computer = Player(name: "컴퓨터")
    let gameType = GameType.rockScissorPaper
    var gameMaster = GameMaster(gameType: gameType, user: user, computer: computer, turn: computer)

    var userInput: String?
    
    gameLoop : repeat {
        print(gameType.message(gameType: gameMaster.getGameType(), turn: gameMaster.getTurn()), terminator: "")
        userInput = readLine()
        
        switch userInput {
        case "0":
            break gameLoop
        case "1", "2", "3":
            guard let input = userInput, let intUserInput = Int(input) else {
                break
            }
            
            switch gameMaster.getGameType() {
            case .rockScissorPaper:
                gameMaster.playRockScissorPaper(userInput: intUserInput)
                gameMaster.evaluateRockScissorPaper()
            
            case .mookJjiBba:
                gameMaster.playMookJjiBba(userInput: intUserInput)
                let result = gameMaster.evaluateMookJjiBba()
                if result == .win {
                    break gameLoop
                }
            }
        default :
            gameMaster.setTurn(to: computer)
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    } while userInput != "0"
    
    print("게임 종료")
}


main()
