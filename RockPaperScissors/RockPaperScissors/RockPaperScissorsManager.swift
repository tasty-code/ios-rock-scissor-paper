//
//  RockPaperScissorsManager.swift
//  RockPaperScissors
//
//  Created by nayeon  on 2023/11/22.
//

import Foundation

struct RockPaperScissorsManager {
    private var userValue: Int = 0
    private var randomValue: Int = 0
    private var resultValue: Int = 0
    private var status: Bool = true
    
    mutating func play() {
        while status {
            print("가위(1), 바위(2), 보(3)! <종료: 0> : ")
            
            if let input = readLine() {
                guard let number = Int(input) else { return }
                userValue = number
                
                switch userValue {
                case 0:
                    print(Case.exit.rawValue)
                    status = false
                case 1, 2, 3:
                    getResult(userValue)
                default:
                    print(Case.falseValue.rawValue)
                    play()
                }
            }
        }
    }
    
    mutating func getResult(_ userValue: Int) {
        randomValue = Int.random(in: 1...3)
        resultValue = userValue - randomValue
        
        switch resultValue {
        case 0:
            print(Case.draw.rawValue)
            play()
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
