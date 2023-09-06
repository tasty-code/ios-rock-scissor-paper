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
    
    private let aiHand = Hand.allCases.randomElement()
    
    func start() {
        
        while true {
            print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
            guard let userInput = readLine() else { return }
            
            if userInput == "0" {
                print("게임 종료")
                break
            }
            
            guard let userHand = Hand(rawValue: userInput) else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            
            if userHand == aiHand {
                print("비겼습니다!")
            }
            else if (userHand == .scissors && aiHand == .paper) || (userHand == .rock && aiHand == .scissors) || (userHand == .paper && aiHand == .rock) {
                return print("이겼습니다!")
            }
            else {
                return print("졌습니다!")
            }
        }
    }
}
