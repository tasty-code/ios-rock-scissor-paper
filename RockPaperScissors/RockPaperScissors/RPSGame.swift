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
            
            let userChoice = getUserChoice()

            if userChoice == 0 {
                print("게임 종료")
                break
            }

            let botChoice = generateRandomInteger()

            let result = getResult(userChoice, botChoice)
            print(result)

            if gameStop(result) { break }
        }
    }
    
    private func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    }
    
    private func getUserChoice() -> Int {
        guard let input = readLine(), let number = Int(input), (0...3).contains(number) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            printMenu()
            return getUserChoice()
        }

        return number
    }
    
    private func generateRandomInteger() -> Int {
        return Int.random(in: 1...3)
    }
    
    private func getResult(_ userChoice: Int, _ botChoice: Int) -> String {
        switch (userChoice, botChoice) {
        case let (param1, param2) where param1 == param2:
            return "비겼습니다!"
        case (1, 3), (2, 1), (3, 2):
            return "이겼습니다!"
        default:
            return "졌습니다!"
        }
    }
    
    private func gameStop(_ result: String) -> Bool {
        if result == "이겼습니다!" || result == "졌습니다!" {
            return true
        }
        return false
    }
    
}
