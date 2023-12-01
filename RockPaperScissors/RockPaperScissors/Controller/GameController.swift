//
//  GameController.swift
//  RockPaperScissors
//
//  Created by Taewan Kim on 11/30/23.
//

import Foundation

struct GameController {
    func inputPlayerChoiceInt() -> Int? {
        guard let input = readLine(), !input.isEmpty else {
            print(StringConstants.Common.emptyInput)
            return nil
        }
        guard let playerChoiceInt = Int(input), playerChoiceInt >= 0, playerChoiceInt <= 3 else {
            print(StringConstants.Common.wrongInput)
            return nil
        }
        return playerChoiceInt
    }
    
    func randomHandChoice() -> HandChoice? {
        return HandChoice.allCases.randomElement()
    }
    
    func convertChoiceFromInt(choiceInt: Int) -> HandChoice? {
        return HandChoice(rawValue: choiceInt)
    }
    
    func judgeRefereeRockScissorsPaper(player: HandChoice, computer: HandChoice) -> RockScissorsPaperResult {
        print("나 : \(player), 컴퓨터 : \(computer)")
        switch (player, computer) {
        case (.rock, .scissors), (.scissors, .paper), (.paper, .rock):
            return .win
        case (.rock, .paper), (.scissors, .rock), (.paper, .scissors):
            return .lose
        case (.rock, .rock), (.scissors, .scissors), (.paper, .paper):
            return .draw
        }
    }
    
    func judgeRefereeMukJjiBba(player: HandChoice, computer: HandChoice) -> MukJjiBbaResult {
        switch (player, computer) {
        case (.rock, .scissors), (.scissors, .paper), (.paper, .rock):
            return .playerTurn
        case (.rock, .paper), (.scissors, .rock), (.paper, .scissors):
            return .computerTurn
        case (.rock, .rock), (.scissors, .scissors), (.paper, .paper):
            return .win
        }
    }
}
