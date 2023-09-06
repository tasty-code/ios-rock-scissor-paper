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
            let botChoice = generateRandomInteger()
            
            if userChoice == 0 {
                print("게임 종료")
                break
            }
            
        }
    }
    
    private func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    }
    
    private func getUserChoice() -> Int {
        guard let input = readLine(), let number = Int(input), (0...3).contains(number) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return getUserChoice()
        }

        return number
    }
    
    private func generateRandomInteger() -> Int {
        return Int.random(in: 1...3)
    }
}
