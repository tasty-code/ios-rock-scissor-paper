//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by 지준용 on 2023/09/06.
//

import Foundation

final class RockPaperScissors {
    enum Hand : String, CaseIterable {
        case scissors = "1"
        case rock = "2"
        case paper = "3"
    }
    
    func start() {
        
        while true {
            print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
            guard let userInput = readLine() else { return }
            
            if userInput == "0" {
                print("게임 종료")
                break
            }
        }
    }
}
