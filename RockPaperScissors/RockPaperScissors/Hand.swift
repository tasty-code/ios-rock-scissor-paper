//
//  Hand.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

// TODO: 그래서 원시값 쓸 건지 다른 거 쓸 건지
enum Hand: Int, CaseIterable {
    case rock = 2
    case paper = 3
    case scissor = 1
    
    static func randomize() -> Self {
        Hand.allCases.randomElement() ?? .rock
    }
    
    init?(rspNumber: Int) {
        switch rspNumber {
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
