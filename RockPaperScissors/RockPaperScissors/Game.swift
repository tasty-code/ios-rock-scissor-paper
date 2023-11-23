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
            
            switch inputNum {
                
            case 1, 2, 3:
                calcRps(with: inputNum)
                print(result.rawValue)
                
            case 0:
                // TODO: 겜임 exit 메서드 콜
                print(Constant.gameExit)
                
            default:
                print(Constant.badInput)
            }
        }
    }
    
    private func calcRps(with input: Int) {
        let randomInt: Int = getRandomInt()
        
        let diff: Int = randomInt - input
        
        if diff == 0 {
            return setResult(.draw)
        }
        
        if [-1, 2].contains(diff) {
            return setResult(.lose)
        }
        
        if [1, -2].contains(diff) {
            return setResult(.win)
        }
    }
    
    private func getRandomInt() -> Int {
        return Int.random(in: 1...3)
    }
    
    private func setResult(_ result: Result) {
        self.result = result
    }
    
    private func setInputNum() {
        guard let input = readLine(), let inputNum = Int(input) else {
            print(Constant.badInput)
            return
        }
        self.inputNum = inputNum
    }
    
    private func shutDown() {
        print(Constant.gameExit)
        breakLoop()
    }
    
    private func breakLoop() {
        self.loopState = false
    }
}
