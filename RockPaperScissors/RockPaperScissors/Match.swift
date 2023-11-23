//
//  Match.swift
//  RockPaperScissors
//
//  Created by 장우석 on 11/22/23.
//

import Foundation

enum Match {
    case win
    case lose
    case draw
    
    static func getResult(_ userSelect: RockPaperScissors, _ comSelect: RockPaperScissors) -> Match {
        let winList: [[RockPaperScissors]] = [[.scissors, .paper], [.rock, .scissors], [.paper, .rock]]
        
        if winList.contains([userSelect, comSelect]) {
            return .win
        } else if userSelect == comSelect {
            return .draw
        } else {
            return .lose
        }
    }
}
