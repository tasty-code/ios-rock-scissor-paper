//
//  Choice.swift
//  RockPaperScissors
//
//  Created by 김진웅 on 2023/09/06.
//

import Foundation

enum Input: Equatable {
    case stop
    case rps(RPS)
    case error(String)
    
    init?(_ input: Int) {
        switch input {
        case 0:
            self = .stop
        case 1...3:
            guard let rpsValue = RPS(rawValue: input) else { self = .error("Invalid Error: \(input)"); return }
            self = .rps(rpsValue)
        default:
            self = .error("Invalid Error: \(input)")
        }
    }
    
    func getRPSValue(input: Input) -> RPS? {
        switch input {
        case .rps(let rpsValue) where rpsValue.rawValue == 1 : return .scissors
        case .rps(let rpsValue) where rpsValue.rawValue == 2 : return .rock
        case .rps(let rpsValue) where rpsValue.rawValue == 3 : return .paper
        case .stop: return nil
        case .rps(_): return nil
        case .error(_): return nil
        }
    }
}

enum RPS: Int, Comparable {
    case scissors = 1, rock, paper
    
    static func < (lhs: RPS, rhs: RPS) -> Bool {
        switch (lhs, rhs) {
        case (.scissors, .rock), (.rock, .paper), (.paper, .scissors): return true
        case (.scissors, .paper), (.rock, .scissors), (.paper, .rock): return false
        case (.scissors, .scissors), (.rock, .rock), (.paper, .paper): return false
        }
    }
}

