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
            RPSPrinter.menu.printMessage()
            
            guard let userChoice = getUserChoice() else {
                RPSPrinter.invalid.printMessage()
                continue
            }
            
            if userChoice == .stop {
                RPSPrinter.gameFinish.printMessage()
                break
            }
            
            guard let botChoice = generateRandomChoice() else {
                RPSPrinter.invalid.printMessage()
                continue
            }
            
            let result = getResult(userChoice, botChoice)
            result.printMessage()
            
            if getGameResult(result) { break }
        }
    }
    
    
    private func getUserChoice() -> Input? {
        guard let input = readLine(), let number = Int(input), let choice = Input(number), choice != Input.error("Invalid Error: \(number)") else {
            return nil
        }
        return choice
    }
    
    private func generateRandomChoice() -> Input? {
        switch Int.random(in: 1...3) {
        case 1:
            return Input(1)
        case 2:
            return Input(2)
        case 3:
            return Input(3)
        default:
            return nil
        }
    }
    
    private func getResult(_ userChoice: Input, _ botChoice: Input) -> RPSPrinter {
        if userChoice == botChoice {
            return .draw
        } else if userChoice < botChoice {
            return .win
        } else {
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
