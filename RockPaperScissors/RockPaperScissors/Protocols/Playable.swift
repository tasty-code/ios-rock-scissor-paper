//
//  Playable.swift
//  RockPaperScissors
//
//  Created by EUNJU on 2023/11/24.
//

import Foundation

protocol Playable {
    func validateUserInput(_ input: String?) throws -> Int
    func showMessage(_ messageType: GameResultType, _ turn: PlayerType)
    func playGame(_ result: GameResultType) -> GameResultType
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
}
