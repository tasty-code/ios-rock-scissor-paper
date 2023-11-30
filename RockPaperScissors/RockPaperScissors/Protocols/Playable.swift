//
//  Playable.swift
//  RockPaperScissors
//
//  Created by EUNJU on 2023/11/24.
//

import Foundation

protocol Playable {
    associatedtype GameType
    
    func validateUserInput(_ input: String?) throws -> Int
    func judgeGame(user: GameType?, computer: GameType?, turn: PlayerType) -> GameResultType
    func showMessage(_ messageType: GameResultType, _ turn: PlayerType)
    func playGame(_ result: GameResultType) -> GameResultType
    func judgeWinner(_ gameResult: GameResultType) -> PlayerType
}

extension Playable {
    
    func validateUserInput(_ input: String?) throws -> Int {
        guard let input = input,
              let num = Int(input),
              (0...3).contains(num) else {
            throw GameError.invalidInput
        }
        
        return num
    }
    
    func judgeWinner(_ gameResult: GameResultType) -> PlayerType {
        return gameResult == .win ? .user : .computer
    }
}
