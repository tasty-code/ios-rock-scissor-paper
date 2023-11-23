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
                // TODO: 승패 확인 로직 메서드 콜
                print(result.rawValue)
            case 0:
                // TODO: 겜임 exit 메서드 콜
                print(Constant.gameExit)
            default:
                print(Constant.badInput)
            }
        }
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
