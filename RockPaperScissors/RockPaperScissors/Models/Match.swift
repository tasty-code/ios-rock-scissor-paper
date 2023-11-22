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
    
    init(_ userSelect: Int, _ comSelect: Int) {
        let winList: [[Int]] = [[1, 3], [2, 1], [3, 2]]
        
        if winList.contains([userSelect, comSelect]) {
            self = .win
        } else if userSelect == comSelect {
            self = .draw
        } else {
            self = .lose
        }
    }
}
