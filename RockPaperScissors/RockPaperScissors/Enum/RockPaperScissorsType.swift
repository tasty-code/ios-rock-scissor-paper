//
//  RockPaperScissorsType.swift
//  RockPaperScissors
//
//  Created by EUNJU on 2023/11/23.
//

import Foundation

@frozen
enum RockPaperScissorsType: Int {
    case none = 0
    case scissors = 1
    case rock = 2
    case paper = 3
    
    func getAdvancedType() -> RockPaperScissorsType {
        switch self {
        case .none:
            return .none
        case .scissors:
            return .rock
        case .rock:
            return .scissors
        case .paper:
            return .paper
        }
    }
}
