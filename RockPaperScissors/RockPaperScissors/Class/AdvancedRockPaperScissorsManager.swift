//
//  AdvancedRockPaperScissorsManager.swift
//  RockPaperScissors
//
//  Created by 박재형 on 11/24/23.
//

import Foundation

final class AdvancedRockPaperScissorsManager: Playable {
    
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
}
