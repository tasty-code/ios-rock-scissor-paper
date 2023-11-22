//
//  RockPaperScissorsManager.swift
//  RockPaperScissors
//
//  Created by nayeon  on 2023/11/22.
//

import Foundation

struct RockPaperScissorsManager {
    private var userValue: Int
    private var randomValue: Int
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
                    print("게임 중")
                default:
                    print(Case.falseValue.rawValue)
                    play()
                }
            }
        }
    }
}
