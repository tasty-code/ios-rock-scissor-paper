//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

class RpsGame {
    var isRunning:Bool = true
    
    func main() {
        while isRunning {
            print(RockPaperScissors.menuText.result, terminator: " ")
            play()
        }
    }
    
    func play() {
        guard let userInput = Int(readLine() ?? "4") else {
            print(RockPaperScissors.wrongText.result)
            return
        }
        
        if userInput == 4 {
            print(RockPaperScissors.wrongText.result)
        }

        if userInput == 0 {
            print(RockPaperScissors.endText.result)
            isRunning = false
            return
        }
        
        let comSelect = Int.random(in: 1...3)
        
        if userInput == comSelect {
            print(RockPaperScissors.draw.result)
        } else if [[1, 3], [2, 1], [3, 2]].contains([userInput, comSelect]){
            print(RockPaperScissors.win.result)
        } else {
            print(RockPaperScissors.lose.result)
        }
    }
}

RpsGame().main()
