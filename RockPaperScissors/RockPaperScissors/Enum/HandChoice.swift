//
//  HandChoice.swift
//  RockPaperScissors
//
//  Created by Taewan Kim on 11/30/23.
//

import Foundation

enum HandChoice: Int,  CaseIterable {
    case scissors = 1
    case rock = 2
    case paper = 3
}

extension HandChoice: CustomStringConvertible {
    var description: String {
        switch self {
        case .rock:
            return "바위"
        case .scissors:
            return "가위"
        case .paper:
            return "보"
        }
    
    }
}
