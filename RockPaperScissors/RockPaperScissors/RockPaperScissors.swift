//
//  RockScissorsPaper.swift
//  RockPaperScissors
//
//  Created by JaeHyeok Sim on 2023/09/05.
//

import Foundation

enum RockPaperScissors: Int, Comparable {
    case scissors = 1
    case rock = 2
    case paper = 3
    
    static func < (lhs: RockPaperScissors, rhs: RockPaperScissors) -> Bool {
        if lhs == .paper && rhs == .scissors {
            return true
        }
        if lhs == .rock && rhs == .paper {
            return true
        }
        if lhs == .scissors && rhs == .rock {
            return true
        }
        return false
    }
}


