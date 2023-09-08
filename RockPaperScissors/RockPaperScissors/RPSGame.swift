//
//  RPSGame.swift
//  RockPaperScissors
//
//  Created by 전성수 on 2023/09/06.
//

import Foundation

class RPSGame {
    
    func run() {
        while true {
            RPSPrinter.menu.getMessage()
            
            guard let userChoice = getUserChoice() else {
                continue
            }
            
            if userChoice == .stop {
                RPSPrinter.gameFinish.getMessage()
                break
            }
            
            let botChoice = generateRandomChoice()
            
            let result = getResult(userChoice, botChoice)
            result.getMessage()
            
            if getGameResult(result) { break }
        }
    }
    
    
    private func getUserChoice() -> Choice? {
        guard let input = readLine(), let number = Int(input), let choice = Choice(rawValue: number) else {
            RPSPrinter.invalid.getMessage()
            return nil
        }
        return choice
    }
    
    private func generateRandomChoice() -> Choice {
        switch Int.random(in: 1...3) {
        case Choice.scissors.rawValue:
            return Choice.scissors
        case Choice.rock.rawValue:
            return Choice.rock
        default:
            return Choice.paper
        }
    }
    
    private func getResult(_ userChoice: Choice, _ botChoice: Choice) -> RPSPrinter {
        switch (userChoice, botChoice) {
        case (.scissors, .scissors), (.rock, .rock), (.paper, .paper):
            return .draw
        case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
            return .win
        default:
            return .lose
        }
    }
    
    private func getGameResult(_ result: RPSPrinter) -> Bool {
        if result == .win || result == .lose {
            return true
        }
        return false
    }
}
