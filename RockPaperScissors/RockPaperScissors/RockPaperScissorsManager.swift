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
    private var currentTurn: MukchippaResult = .draw
    private var isNextRound: Bool = false
    
    mutating func play() {
        while status {
            checkStepPrint()
            guard let input = readLine() else { return }
            userValue = Int(input)
            
            switch userValue {
            case 0:
                print(GameResult.exit.rawValue)
                status = false
            case 1, 2, 3:
                guard let userChoice = userValue else { return }
                checkStepType(userChoice: userChoice)
            default:
                print(GameResult.wrongValue.rawValue)
            }
        }
    }
    
    mutating func checkStepPrint() {
        if !isNextRound {
            print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
        } else {
            print(currentTurn == MukchippaResult.computerLose ? "[사용자 턴] " : "[컴퓨터 턴] ", "묵(1),찌(2),빠(3)! <종료 : 0> : " , terminator: "")
        }
    }
    
    mutating func checkStepType(userChoice: Int) {
        if !isNextRound {
            getRockPaperScissorsResult(userValue: userChoice)
        } else {
            getMukchippaResult(userValue: userChoice)
        }
    }
    
    mutating func calculateValue(userValue: Int) {
        randomValue = Int.random(in: 1...3)
        guard let computerValue = randomValue else { return }
        resultValue = (userValue - computerValue + 3) % 3
    }

    mutating func getRockPaperScissorsResult(userValue: Int) {
        calculateValue(userValue: userValue)
        guard let gameValue = resultValue else { return }
        
        switch RockPaperScissorsResult(rawValue: gameValue) {
        case .draw:
            print(GameResult.draw.rawValue)
        case .userWin:
            print(GameResult.win.rawValue)
            currentTurn = .computerLose
            isNextRound = true
        case .userLose:
            currentTurn = .computerWin
            print(GameResult.lose.rawValue)
            isNextRound = true
        case .none:
            break
        }
    }
    
    mutating func getMukchippaResult(userValue: Int) {
        calculateValue(userValue: userValue)
        guard let gameValue = resultValue else { return }
            
        switch MukchippaResult(rawValue: gameValue) {
        case .computerWin:
            currentTurn = .computerWin
            print("컴퓨터의 턴입니다.")
        case .computerLose:
            currentTurn = .computerLose
            print("사용자의 턴입니다")
        case .draw:
            print(currentTurn == .computerLose ? "사용자의 승리" : "컴퓨터의 승리")
            status = false
        case .none:
            break
        }
    }
}
