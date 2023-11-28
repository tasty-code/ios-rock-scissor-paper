//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by Designer on 11/23/23.
//

import Foundation

enum RockPaperScissors: Int {
    case rock
    case paper
    case scissors
    case wrongCase = 4
    case exit
    case none
    
    init(userSelect :Int?) {
        switch userSelect {
        case 1:
            self = .scissors
        case 2:
            self = .rock
        case 3:
            self = .paper
        case 0:
            self = .exit
        default:
            self = .wrongCase
        }
    }
    
    var korean: String {
        switch self {
        case .scissors:
            return "가위"
        case .rock:
            return "바위"
        case .paper:
            return "보"
        default:
            return "해당 없음"
        }
    }
    
    var mukJjiBba: String {
        switch self {
        case .scissors:
            return "찌"
        case .rock:
            return "묵"
        case .paper:
            return "빠"
        default:
            return "해당 없음"
        }
    }
}
