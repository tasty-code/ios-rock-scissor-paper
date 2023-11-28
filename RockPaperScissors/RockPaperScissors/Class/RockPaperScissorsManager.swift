//
//  RockPaperScissorsManager.swift
//  RockPaperScissors
//
//  Created by EUNJU on 2023/11/21.
//

import Foundation

final class RockPaperScissorsManager: Playable {
    
    func validateUserInput(_ input: String?) throws -> RockPaperScissorsType {
        guard let input else {
            throw GameError.invalidInput
        }
        
        switch input {
        case "0": return .none
        case "1": return .scissors
        case "2": return .rock
        case "3": return .paper
        default: throw GameError.invalidInput
        }
    }
    
    func judgeGame(user: RockPaperScissorsType,
                            computer: RockPaperScissorsType?,
                            turn: PlayerType = .user) -> GameResultType {
        if user == computer {
            return .draw
        }
        
        switch user {
        case .scissors:
            return computer == .paper ? .win : .lose
        case .rock:
            return computer == .scissors ? .win : .lose
        case .paper:
            return computer == .rock ? .win : .lose
        case .none:
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
            let userChoice: RockPaperScissorsType
            let computerChoice = Int.random(in: 1...3)
            
            do {
                userChoice = try validateUserInput(input)
            } catch {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            
            let gameResult = judgeGame(user: userChoice,
                                       computer: RockPaperScissorsType(rawValue: computerChoice))
            showMessage(gameResult)
            
            if gameResult != .draw {
                return gameResult
            }
        }
    }
}
