//
//  RockPaperScissorsManager.swift
//  RockPaperScissors
//
//  Created by EUNJU on 2023/11/21.
//

import Foundation

final class RockPaperScissorsManager: Playable {
    
    func judgeGame(userChoice: RockPaperScissorsType?,
                            computerChoice: RockPaperScissorsType?,
                            turn: PlayerType = .user) -> GameResultType {
        if userChoice == computerChoice {
            return .draw
        }
        
        switch userChoice {
        case .scissors:
            return computerChoice == .paper ? .win : .lose
        case .rock:
            return computerChoice == .scissors ? .win : .lose
        case .paper:
            return computerChoice == .rock ? .win : .lose
        default:
            return .exit
        }
    }
    
    func showMessage(_ messageType: GameResultType, _ turn: PlayerType = .user) {
        switch messageType {
            
        case .default:
            print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: " ")
        case .win:
            print("이겼습니다!")
        case .lose:
            print("졌습니다!")
        case .draw:
            print("비겼습니다!")
        case .exit:
            print("게임 종료")
        }
    }
    
    func playGame(_ result: GameResultType) -> GameResultType {
        while true {
            showMessage(.default)
            
            let input = readLine()
            let userChoice: RockPaperScissorsType?
            let computerChoice = RockPaperScissorsType(rawValue: Int.random(in: 1...3))
            
            do {
                userChoice = try RockPaperScissorsType(rawValue: validateUserInput(input))
            } catch {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            
            let gameResult = judgeGame(userChoice: userChoice, computerChoice: computerChoice)
            showMessage(gameResult)
            
            if gameResult != .draw {
                return gameResult
            }
        }
    }
}
