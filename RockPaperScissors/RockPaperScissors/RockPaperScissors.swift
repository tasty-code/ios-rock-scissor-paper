//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by 지준용 on 2023/09/06.
//

import Foundation

final class RockPaperScissors {
    
    // MARK: - Enum
    
    enum RpsChoice : Int {
        case exit = 0
        case scissors = 1
        case rock = 2
        case paper = 3
    }
    
    enum GameResult {
        case win
        case lose
        case draw
    }
    
    // MARK: - Property
    
    private var gameResult: GameResult = .draw
    private var userInput = 1
    private var userChoice : RpsChoice = .scissors
    
    // MARK: - Start
    
    func start() {
        print(GuideMessage.rpsChoiceMenu, terminator: "")
        
        enterUserChoice {
            start()
        }
        
        if userInput == 0 {
            return print(GuideMessage.exit)
        }
        
        guard let computerChoice = RpsChoice(rawValue: Int.random(in: 1...3)) else { return }
        gameResult = checkResult(of: userChoice, with: computerChoice) { result in
            print(result)
        }
    }
    private func enterUserChoice(whenMistake: () -> ()) {
        guard let userInput = Int(readLine() ?? "0"),
              let userChoice = RpsChoice(rawValue: userInput) else {
            print(GuideMessage.inputError)
            return
        }
        self.userInput = userInput
        self.userChoice = userChoice
    }
    
    private func checkResult(of userChoice: RpsChoice, with computerChoice: RpsChoice, message: (String) -> ()) -> GameResult {
        switch (userChoice, computerChoice) {
        case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
            message(GuideMessage.win)
            return .win
        case (.paper, .scissors), (.scissors, .rock), (.rock, .paper):
            message(GuideMessage.lose)
            return .lose
        default:
            message(GuideMessage.draw)
            return .draw
        }
    }
}
