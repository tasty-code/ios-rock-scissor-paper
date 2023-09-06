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
            print(GuideMessage.rpsChoiceMenu, terminator: "")
            guard let userInput = readLine() else { return }
            
            if userInput == "0" {
                return print(GuideMessage.exit)
            }
            
            guard let userHand = Hand(rawValue: userInput) else {
                print(GuideMessage.inputError)
                continue
            }
            
            let aiHand = Hand.allCases.randomElement()
            
            if userHand == aiHand {
                print(GuideMessage.draw)
            } else if (userHand == .scissors && aiHand == .paper) ||
                      (userHand == .rock && aiHand == .scissors) ||
                      (userHand == .paper && aiHand == .rock) {
                return print(GuideMessage.win)
            } else {
                return print(GuideMessage.lose)
            }
        }
    }
}
