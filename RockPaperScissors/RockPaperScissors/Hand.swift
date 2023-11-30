//
//  Hand.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

enum Hand: CaseIterable {
    case rock
    case paper
    case scissor
    
    static func randomize() -> Self {
        Hand.allCases.randomElement() ?? .rock
    }
    
    init?(rpsNumber: Int) {
        switch rpsNumber {
        case 1: self = .scissor
        case 2: self = .rock
        case 3: self = .paper
        default: return nil
        }
    }
    
    init?(mjbNumber: Int) {
        switch mjbNumber {
        case 1: self = .rock
        case 2: self = .scissor
        case 3: self = .paper
        default: return nil
        }
    }
    
    func wins(_ counter: Hand) -> Bool {
        switch self {
        case .rock:
            return counter == .scissor
        case .paper:
            return counter == .rock
        case .scissor:
            return counter == .paper
        }
    }
}
