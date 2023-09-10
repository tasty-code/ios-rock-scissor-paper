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
            
            guard let newUserChoice = userChoice.getRPSValue(input: userChoice) else {
                RPSPrinter.invalid.printMessage()
                continue
            }
            
            guard let botChoice = generateRandomChoice() else {
                RPSPrinter.invalid.printMessage()
                continue
            }
            
            let result = getResult(newUserChoice, botChoice)
            result.printMessage()
            
            if getGameResult(result) { break }
        }
    }
    
    
    private func getUserChoice() -> Input? {
        guard let input = readLine(), let number = Int(input), let input = Input(number), input != Input.error("Invalid Error: \(number)") else {
            return nil
        }
        return input
    }
    
    private func generateRandomChoice() -> RPS? {
        return RPS(rawValue: Int.random(in: 1...3))
    }
    
    private func getResult(_ userChoice: RPS, _ botChoice: RPS) -> RPSPrinter {
        if userChoice == botChoice {
            return .draw
        } else if userChoice > botChoice {
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
