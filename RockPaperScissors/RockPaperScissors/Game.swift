//
//  Game.swift
//  RockPaperScissors
//
//  Created by 이주상 on 2023/11/23.
//

import Foundation

final class Game {
    // MARK: Properties
    private var loopState: Bool = true
    
    private var gameResult: GameResult = .draw
    
    private var userInput: Int = 0
    
    private var currentPlayerTurn: PlayerTurn = .human
    
    private let MookZziBbaDictionary: [Int: String] = [1: "묵", 2: "찌", 3: "빠"]

    
    func load() {
        playRockScissorsPaper()
    }
    
    // MARK: RockScissorsPaper
    private func playRockScissorsPaper() {
        while loopState {
            
            print(Prompt.rockScissorsPaperChoice, terminator: " ")
            
            receiveUserInput()
            
            switch userInput {
                
            case 1, 2, 3:
                calculateRockScissorsPaperResult(with: userInput)
                
                print(gameResult.rawValue)
                
                if [.win, .lose].contains(gameResult) {
                    initMookZziBba()
                    playMookZziBba()
                }
                
            case 0:
                shutDown()
                
            default:
                print(Prompt.badInput)
            }
        }
    }
    
    private func calculateRockScissorsPaperResult(with userInput: Int) {
        let randomInt: Int = Int.random(in: 1...3)
        
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
    
    private func setGameResult(_ gameResult: GameResult) {
        self.gameResult = gameResult
    }
    
    private func receiveUserInput() {
        while true {
            if let input = readLine(), let inputInt = Int(input) {
                self.userInput = inputInt
                break
            } else {
                print(Prompt.badInput)
                print(Prompt.rockScissorsPaperChoice, terminator: " ")
            }
        }
    }
    
    private func shutDown() {
        print(Prompt.gameExit)
        breakLoop()
    }
    
    private func breakLoop() {
        self.loopState = false
    }
    
    // MARK: MookZziBba
    private func playMookZziBba() {
        while true {
            print(Prompt.MookZziBbaChoice(currentPlayerTurn))
            
            receiveUserInput()
            
            switch userInput {
            case 1, 2, 3:
                calculateRockScissorsPaperResult(with: userInput)
                return
            case 0:
                shutDown()
                return
            default:
                print(Prompt.badInput)
                if currentPlayerTurn == .human {
                    changePlayerTurn()
                }
            }
        }
    }
    
    private func initMookZziBba() {
        let player: PlayerTurn = (gameResult == .win) ? .human : .computer
        setCurrentPlayerTurn(player)
    }
    
    private func setCurrentPlayerTurn(_ currentPlayerTurn: PlayerTurn) {
        self.currentPlayerTurn = currentPlayerTurn
    }
    
    private func calculateMookZziBbaResult(with input: Int) {
        
        let randomInt: Int = Int.random(in: 1...3)
        
        let computerChoice: String = MookZziBbaDictionary[randomInt] ?? ""
        
        let userChoice: String = MookZziBbaDictionary[userInput] ?? ""
        
        print(Prompt.allChoices(computerChoice, userChoice))
        
        let difference: Int = randomInt - userInput
        
        switch difference {
        case 0:
            draw()
        case -1, 2:
            computerWin()
        case 1, -2:
            userWin()
        default:
            break
        }
    }
    
    private func userWin() {
        if currentPlayerTurn == .computer {
            changePlayerTurn()
        }
        print(Prompt.currentTurn(currentPlayerTurn))
        playMookZziBba()
    }
    
    private func computerWin() {
        if currentPlayerTurn == .human {
            changePlayerTurn()
        }
        print(Prompt.currentTurn(currentPlayerTurn))
        playMookZziBba()
    }
    
    private func draw() {
        print(Prompt.winner(currentPlayerTurn))
        breakLoop()
    }
    
    private func changePlayerTurn() {
        let playerTurn: PlayerTurn = (self.currentPlayerTurn == .human) ? .computer : .human
        setCurrentPlayerTurn(playerTurn)
    }
}
