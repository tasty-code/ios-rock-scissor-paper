//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

class RpsGame {
    var isRunning:Bool = true
    var comSelect = Int.random(in: 1...3)
    
    func main() {
        while isRunning {
            print(RockPaperScissors.menuText.result)
        }
    }
    
    func play(_ userSelect: String) {
        let input = readLine()
        if let userSelect == input {
            
        }
    }
    
}

RpsGame().main()
