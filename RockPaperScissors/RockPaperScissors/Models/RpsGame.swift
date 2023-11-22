//
//  Game.swift
//  RockPaperScissors
//
//  Created by 장우석 on 11/21/23.
//

import Foundation

class RpsGame {
    var isRunning:Bool = true
    
    func play() {
        while isRunning {
            print(Message.menu.result, terminator: " ")
            game()
        }
    }
    
    func game() {
        guard let userInput = Int(readLine() ?? "4") else {
            print(Message.wrong.result)
            return
        }
        
        if userInput == 4 {
            print(Message.wrong.result)
        }

        if userInput == 0 {
            print(Message.end.result)
            isRunning = false
            return
        }
        
        let comSelect = Int.random(in: 1...3)
        let info = (userInput, comSelect)
        
        if userInput == comSelect {
            print(Message.draw.result)
        } else if isWin(info){
            print(Message.win.result)
        } else {
            print(Message.lose.result)
        }
    }
    
    func isWin(_  match:(Int, Int)) -> Bool {
        if (1, 3) == match || (2, 1) == match || (3, 2) == match {
            return true
        }
        return false
    }
    
}
