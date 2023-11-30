//
//  rockSicssorPaperManager.swift
//  RockPaperScissors
//
//  Created by 권태호 on 29/11/2023.
//

import Foundation

struct rockSicssorPaperGameManager {
    
    func determineGameResult(comPick: UserMenuOption, userChoice: UserMenuOption) -> GameMenuPrompt {
        if comPick == userChoice {
            return .draw
        }
        switch (comPick, userChoice) {
        case (.scissor, .rock), (.rock, .paper), (.paper, .scissor):
            return .win
        default:
            return .lose
        }
    }
}
