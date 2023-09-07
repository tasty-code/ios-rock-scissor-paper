//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation



var isRunning: Bool = true

while isRunning {
    print(Alert.prompt.rawValue)
    let choice = userInput()

    guard choice != 0 else {
        print(Alert.end.rawValue)
        isRunning = false
        break
    }
    
    let computerChoice = Int.random(in: 1...3)
    
    guard !(choice == 3 && computerChoice == 1) else {
        print(Alert.lose.rawValue)
        isRunning = false
        break
    }
    
    guard !(choice == 1 && computerChoice == 3) else {
        print(Alert.win.rawValue)
        isRunning = false
        break
    }
    
    
    if choice == computerChoice {
        print(Alert.draw.rawValue)
    } else if choice > computerChoice {
        print(Alert.win.rawValue)
        isRunning = false
    } else if choice < 0 {
        print(Alert.tryAgain.rawValue)
    } else {
        print(Alert.lose.rawValue)
        isRunning = false
    }
}

func userInput() -> Int {
    let userInput = readLine()
    guard let input = userInput else {
        return -1
    }
    guard let choice = Int(input) else {
        return -1
    }
    
    return choice
}




