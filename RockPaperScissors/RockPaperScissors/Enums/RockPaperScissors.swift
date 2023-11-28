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
}
