//
//  RockPaperScissorsManager.swift
//  RockPaperScissors
//
//  Created by EUNJU on 2023/11/21.
//

import Foundation

final class RockPaperScissorsManager {
    
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
    
    func judgeGame(user: RockPaperScissorsType, computer: RockPaperScissorsType?) -> UserGuideMessage {
        if user == computer {
            return .draw
        }
        
        switch user {
        case .scissors:
            return user == .paper ? .win : .lose
        case .rock:
            return user == .scissors ? .win : .lose
        case .paper:
            return user == .rock ? .win : .lose
        case .none:
            return .exit
        }
    }
}
