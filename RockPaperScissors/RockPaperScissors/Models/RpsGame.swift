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
        guard let userSelect = Int(readLine() ?? "4") else {
            print(Message.wrong.result)
            return
        }
        
        if userSelect >= 4 {
            print(Message.wrong.result)
            return
        }

        if userSelect == 0 {
            print(Message.end.result)
            isRunning = false
            return
        }
        
        let comSelect = Int.random(in: 1...3)
        
        switch Match(userSelect, comSelect) {
        case .win:
            print(Message.win.result)
        case .draw:
            print(Message.draw.result)
        case .lose:
            print(Message.lose.result)
        }
    }
    
}
