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
            
            if let input = readLine() {
                userValue = Int(input)
                
                switch userValue {
                case 0:
                    print(Case.exit.rawValue)
                    status = false
                case 1, 2, 3:
                    if let userChoice = userValue {
                        getResult(userChoice)
                    }
                default:
                    print(Case.falseValue.rawValue)
                }
            }
        }
    }
    
    mutating func getResult(_ userValue: Int) {
        randomValue = Int.random(in: 1...3)
        
        if let randomValue = randomValue {
            resultValue = userValue - randomValue
            
            switch resultValue {
            case 0:
                print(Case.draw.rawValue)
            case 1, -2:
                print(Case.win.rawValue)
                status = false
            case -1, 2:
                print(Case.lose.rawValue)
                status = false
            default:
                break
            }
        }
    }
}
