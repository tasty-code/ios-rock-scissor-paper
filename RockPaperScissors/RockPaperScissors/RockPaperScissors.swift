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
    
    // MARK: - Start
    
    func start() {
        while true {
            print(GuideMessage.rpsChoiceMenu, terminator: "")
            guard let userInput = Int(readLine() ?? "0"), let userChoice = RpsChoice(rawValue: userInput) else {
                print(GuideMessage.inputError)
                return
            }
            
            if userInput == 0 {
                return print(GuideMessage.exit)
            }
            
            let computerChoice = RpsChoice(rawValue: Int.random(in: 1...3))
            switch (userChoice, computerChoice) {
            case (.scissors, .paper), (.rock, .scissors), (.paper, .rock): return print(GuideMessage.win)
            case (.paper, .scissors), (.scissors, .rock), (.rock, .paper): return print(GuideMessage.lose)
            default: print(GuideMessage.draw)
            }
        }
    }
}
