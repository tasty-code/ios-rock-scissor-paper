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
    
    private enum GameOutcome {
        case draw, win, loss
        
        func notify() {
            switch self {
            case .draw:
                print("비겼습니다!")
            case .win:
                print("이겼습니다!")
            case .loss:
                print("졌습니다!")
            }
        }
    }
    
    let termination: String = "0"
    var willRun: Bool = true
    
    func canPlayGame() -> Bool {
        return true
    }
    
    func playGame() {
        
    }
}
