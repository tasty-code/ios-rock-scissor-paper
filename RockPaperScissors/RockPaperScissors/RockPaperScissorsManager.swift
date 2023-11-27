//
//  RockPaperScissorsManager.swift
//  RockPaperScissors
//
//  Created by nayeon  on 2023/11/22.
//

import Foundation

struct RockPaperScissorsManager {
    private var userValue: Int?
    private var randomValue: Int?
    private var resultValue: Int?
    private var status: Bool = true
    
    mutating func play() {
        while status {
            print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
            
            guard let input = readLine() else { return }
            userValue = Int(input)
            
            switch userValue {
            case 0:
                print(GameResult.exit.rawValue)
                status = false
            case 1, 2, 3:
                if let userChoice = userValue {
                    getResult(userValue: userChoice)
                }
            default:
                print(GameResult.wrongValue.rawValue)
            }
        }
    }

    mutating func getResult(userValue: Int) {
        randomValue = Int.random(in: 1...3)
        
        guard let computerValue = randomValue else { return }
        resultValue = (userValue - computerValue + 3) % 3
        
        switch ResultType(rawValue: computerValue) {
        case .draw:
            print(GameResult.draw.rawValue)
        case .userWin:
            print(GameResult.win.rawValue)
            status = false
        case .userLose:
            print(GameResult.lose.rawValue)
            status = false
        case .none:
            break
        }
    }
}
