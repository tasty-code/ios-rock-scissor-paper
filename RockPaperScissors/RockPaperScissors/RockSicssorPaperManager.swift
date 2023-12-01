//
//  rockSicssorPaperManager.swift
//  RockPaperScissors
//
//  Created by 권태호 on 29/11/2023.
//

import Foundation

struct RockSicssorPaperGameManager {
    
    func determineGameResult(computerPick: RockScissorPaperUserOption, userChoice: RockScissorPaperUserOption) -> GameMenuPrompt {
//        if comPick == userChoice {
//            return .draw
//        }
        switch (computerPick, userChoice) {
        case (let computerPick, let userChoice) where computerPick == userChoice:
            return.draw
        case (.scissor, .rock), (.rock, .paper), (.paper, .scissor):
            return .win
        default:
            return .lose
        }
    }
}
