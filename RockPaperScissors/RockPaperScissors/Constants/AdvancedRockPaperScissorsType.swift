//
//  AdvancedRockPaperScissorsType.swift
//  RockPaperScissors
//
//  Created by EUNJU on 2023/11/29.
//

import Foundation

enum AdvancedRockPaperScissorsType: Int, Convertible {
    case none = 0
    case rock = 1
    case scissors = 2
    case paper = 3
    
    typealias T = RockPaperScissorsType
    
    var convertedType: T {
        switch self {
        case .none:
            return .none
        case .rock:
            return .rock
        case .scissors:
            return .scissors
        case .paper:
            return .paper
        }
    }
}


