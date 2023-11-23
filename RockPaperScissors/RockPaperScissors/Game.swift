//
//  Game.swift
//  RockPaperScissors
//
//  Created by 이주상 on 2023/11/23.
//

import Foundation

final class Game {
    private var loopState: Bool = true
    private var result: Result = .none
    private var inputNum: Int = 0
    
    private func playRps() {
        while loopState {
            print(Constant.rpsChoice)
            
            setInputNum()
        }
    }
    
    private func setInputNum() {
        guard let input = readLine(), let inputNum = Int(input) else {
            print(Constant.badInput)
            return
        }
        self.inputNum = inputNum
    }
}
