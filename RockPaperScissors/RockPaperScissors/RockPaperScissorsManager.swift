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
    private var nextRound: Bool = false
    private var lastTurn: MukchippaResult = .draw
    
    mutating func play() {
        while status {
            RoundCheck()
            
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
    
    mutating func RoundCheck() {
        if !nextRound {
            print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
        } else {
            print(currentTurn == MukchippaResult.computerLose ? "[사용자 턴] " : "[컴퓨터 턴] ", "묵(1),찌(2),빠(3)! <종료 : 0> : " , terminator: "")
        }
    }
    
    mutating func calculateValue(userValue: Int) {
        randomValue = Int.random(in: 1...3)
        guard let computerValue = randomValue else { return }
        resultValue = (userValue - computerValue + 3) % 3
        print("computer의 값 : ",randomValue) // 코드 테스트 - 삭제
    }

    mutating func getResult(userValue: Int) {
        calculateValue(userValue: userValue)
        guard let gameValue = resultValue else { return }
        
        switch ResultType(rawValue: gameValue) {
        case .draw:
            print(GameResult.draw.rawValue)
        case .userWin:
            print(GameResult.win.rawValue)
            nextRound = true
        case .userLose:
            print(GameResult.lose.rawValue)
            nextRound = true
        case .none:
            break
        }
    }
}
