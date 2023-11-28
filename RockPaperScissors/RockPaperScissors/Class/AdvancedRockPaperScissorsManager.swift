//
//  AdvancedRockPaperScissorsManager.swift
//  RockPaperScissors
//
//  Created by 박재형 on 11/24/23.
//

import Foundation

final class AdvancedRockPaperScissorsManager: Playable {
    
    let rockPaperScissorsManager: RockPaperScissorsManager
    
    init(rockPaperScissorsManager: RockPaperScissorsManager) {
        self.rockPaperScissorsManager = rockPaperScissorsManager
    }
    
    func validateUserInput(_ input: String?) throws -> RockPaperScissorsType {
        guard let input else {
            throw GameError.invalidInput
        }
        
        switch input {
        case "0": return .none
        case "1": return .rock
        case "2": return .scissors
        case "3": return .paper
        default: throw GameError.invalidInput
        }
    }
    
    func judgeGame(user: RockPaperScissorsType,
                   computer: RockPaperScissorsType?,
                   turn: PlayerType) -> UserGuideMessage {
        if user != computer {
            return .draw
        }
        
        switch user {
        case .none:
            return .exit
        default:
            return turn == .user ? .win : .lose
        }
    }
    
    func showMessage(_ messageType: UserGuideMessage, _ turn: PlayerType) {
        switch messageType {
            
        case .default:
            print("[\(turn.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
        case .win:
            print("\(turn.rawValue)의 승리!")
        case .lose:
            let winner = turn == .user ? "사용자": "컴퓨터"
            print("\(winner)의 승리!")
        case .draw:
            print("\(turn.rawValue)의 턴입니다.")
        case .exit:
            print("게임 종료")
        }
    }
    
    @discardableResult
    func playGame(_ result: UserGuideMessage) -> UserGuideMessage {
        var turn: PlayerType
        turn = result == .win ? .user : .computer
        
        while true {
            showMessage(.default, turn)
            
            let input = readLine()
            let userChoice: RockPaperScissorsType
            let computerChoice = Int.random(in: 1...3)
            
            do {
                userChoice = try advancedRockPaperScissorsManager.validateUserInput(input)
            } catch {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            
            let gameResult = judgeGame(user: userChoice,
                                       computer: RockPaperScissorsType(rawValue: computerChoice)?.getAdvancedType(),
                                       turn: turn)
            
            switch gameResult {
            case .win, .lose:
                showMessage(gameResult, turn)
                return .exit
            case .draw:
                let result = rockPaperScissorsManager.judgeGame(user: userChoice, computer: RockPaperScissorsType(rawValue: computerChoice)?.getAdvancedType())
                let nextTurn: PlayerType = result == .win ? .user : .computer
                showMessage(.draw, nextTurn)
                turn = nextTurn
            default:
                showMessage(.exit, .computer)
                return .exit
            }
        }
    }
}
