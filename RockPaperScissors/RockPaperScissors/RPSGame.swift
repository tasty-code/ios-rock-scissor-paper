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
            printMenu()
            
            guard let userChoice = getUserChoice() else {
                printMenu()
                continue
            }
            
            if userChoice == .stop {
                print("게임 종료")
                break
            }
            
            let botChoice = generateRandomChoice()
            
            let result = getResult(userChoice, botChoice)
            print(result)
            
            if getGameResult(result) { break }
        }
    }
    
    private func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    }
    
    private func getUserChoice() -> Choice? {
        guard let input = readLine(), let number = Int(input), let choice = Choice(rawValue: number) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
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
    
    private func getResult(_ userChoice: Choice, _ botChoice: Choice) -> String {
        switch (userChoice, botChoice) {
        case (.scissors, .scissors), (.rock, .rock), (.paper, .paper):
            return "비겼습니다!"
        case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
            return "이겼습니다!"
        default:
            return "졌습니다!"
        }
    }
    
    private func getGameResult(_ result: String) -> Bool {
        if result == "이겼습니다!" || result == "졌습니다!" {
            return true
        }
        return false
    }
}
