//
//  GameManager.swift
//  RockPaperScissors
//

import Foundation

struct GameManager {
    private enum RockPaperScissors: Int, CaseIterable {
        case scissors = 1
        case rock = 2
        case paper = 3
    }
    
    let termination: String = "0"
    var willRun: Bool = true
    
    func canPlayGame() -> Bool {
        return true
    }
    
    func playGame() {
        
    }
}
