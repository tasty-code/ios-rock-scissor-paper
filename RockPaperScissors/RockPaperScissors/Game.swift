//
//  Game.swift
//  RockPaperScissors
//
//  Created by 이주상 on 2023/11/23.
//

import Foundation

final class Game {
    private var loopState: Bool = true
    
    private var gameResult: GameResult = .draw
    
    private var userInput: Int = 0
    
    func load() {
        playRockScissorsPaper()
    }
    
    private func playRockScissorsPaper() {
        while loopState {
            
            print(Prompt.rpsChoice)
            
            receiveUserInput()
            
            switch userInput {
                
            case 1, 2, 3:
                calculateRockScissorsPaperResult(with: userInput)
                print(gameResult.rawValue)
                if gameResult != .draw {
                    shutDown()
                }
                
            case 0:
                shutDown()
                
            default:
                print(Prompt.badInput)
            }
        }
    }
    
    private func calculateRockScissorsPaperResult(with userInput: Int) {
        let randomInt: Int = randomInt()
        
        let difference: Int = randomInt - userInput
        
        switch difference {
        case 0:
            setGameResult(.draw)
        case -1, 2:
            setGameResult(.lose)
        case 1, -2:
            setGameResult(.win)
        default:
            break
        }
    }
    
    private func randomInt() -> Int {
        return Int.random(in: 1...3)
    }
    
    private func setGameResult(_ gameResult: GameResult) {
        self.gameResult = gameResult
    }
    
    private func receiveUserInput() {
        guard let input = readLine(), let inputInt = Int(input) else {
            print(Prompt.badInput)
            print(Prompt.rpsChoice)
            receiveUserInput()
            return
        }
        self.userInput = inputInt
    }
    
    private func shutDown() {
        print(Prompt.gameExit)
        breakLoop()
    }
    
    private func breakLoop() {
        self.loopState = false
    }
}
