//
//  AdvancedRockPaperScissorsManager.swift
//  RockPaperScissors
//
//  Created by 박재형 on 11/24/23.
//

import Foundation

final class AdvancedRockPaperScissorsManager: Playable, JudgeAdvancedRockPaperScissors {
    
    private let rockPaperScissorsManager: RockPaperScissorsManager
    
    init(rockPaperScissorsManager: RockPaperScissorsManager) {
        self.rockPaperScissorsManager = rockPaperScissorsManager
    }
    
    private func judgeWinner(_ gameResult: GameResultType) -> PlayerType {
        return gameResult == .win ? .user : .computer
    }
    
    func judgeGame(userChoice: AdvancedRockPaperScissorsType?,
                   computerChoice: AdvancedRockPaperScissorsType?,
                   turn: PlayerType) -> GameResultType {
        if userChoice == AdvancedRockPaperScissorsType.none {
            return .exit
        }
        
        if userChoice != computerChoice {
            return .draw
        }
        
        return turn == .user ? .win : .lose
    }
    
    func showMessage(_ messageType: GameResultType, _ turn: PlayerType) {
        switch messageType {
            
        case .default:
            print("[\(turn.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
        case .win, .lose:
            print("\(turn.rawValue)의 승리!")
        case .draw:
            print("\(turn.rawValue)의 턴입니다.")
        case .exit:
            print("게임 종료")
        }
    }
    
    @discardableResult
    func playGame(_ result: GameResultType) -> GameResultType {
        var turn: PlayerType = judgeWinner(result)
        
        while true {
            showMessage(.default, turn)
            
            let input = readLine()
            let validatedInput: Int
            let userChoice: AdvancedRockPaperScissorsType?
            let computerChoice = AdvancedRockPaperScissorsType(rawValue: Int.random(in: 1...3))
            
            do {
                validatedInput = try validateUserInput(input)
                userChoice = AdvancedRockPaperScissorsType(rawValue: validatedInput)
            } catch {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            
            let gameResult = judgeGame(userChoice: userChoice,
                                       computerChoice: computerChoice,
                                       turn: turn)
            switch gameResult {
            case .win, .lose:
                showMessage(gameResult, turn)
                return .exit
            case .draw:
                let result = rockPaperScissorsManager.judgeGame(userChoice: userChoice?.convertedType, computerChoice: computerChoice?.convertedType)
                let nextTurn: PlayerType = judgeWinner(result)
                showMessage(.draw, nextTurn)
                turn = nextTurn
            default:
                showMessage(.exit, .computer)
                return .exit
            }
        }
    }
}
