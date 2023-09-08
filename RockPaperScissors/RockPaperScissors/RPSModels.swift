//
//  Choice.swift
//  RockPaperScissors
//
//  Created by 김진웅 on 2023/09/06.
//

import Foundation

enum Input: Comparable {
    case stop
    case rps(RPS)
    case error(String)
    
    init?(_ input: Int) {
        switch input {
        case 0:
            self = .stop
        case 1...3:
            if let rps = RPS(hand: input) {
                self = .rps(rps)
            } else {
                self = .error("Invalid Error: \(input)")
            }
        default:
            self = .error("Invalid Error: \(input)")
        }
    }
    
    static func < (lhs: Input, rhs: Input) -> Bool {
        switch (lhs, rhs) {
        case (.stop, .stop):
            return false
        case (.stop, _):
            return true
        case (_, .stop):
            return false
        case (.rps(let lhsRPS), .rps(let rhsRPS)):
            return lhsRPS < rhsRPS
        default:
            return false
        }
    }
}

enum RPS: Int, Comparable {
    case scissors = 1, rock, paper
    
    init?(hand: Int) {
        if let rps = RPS(rawValue: hand) {
            self = rps
        } else {
            return nil
        }
    }
    
    static func < (lhs: RPS, rhs: RPS) -> Bool {
        switch (lhs, rhs) {
        case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
            return lhs.rawValue < rhs.rawValue
        default:
            return lhs.rawValue > rhs.rawValue
        }
    }
}

