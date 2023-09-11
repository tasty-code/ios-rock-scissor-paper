//
//  RspService.swift
//  RockPaperScissors
//
//  Created by Janine on 2023/09/07.
//

import Foundation

struct RspService {
    private var userChoice: Int?
    private var computerChoice: Int?
    private var status: Progress = .notYet
    private var isRunning: Bool = true
    private var winner: GameWinner = .draw
    private var isFirstRound: Bool = true
    private var lastWinner: GameWinner = .draw
    
    public mutating func run(_ type: GameType) {
        while isRunning {
            if isFirstRound {
                print(GameStatus.start.message)
            } else {
                print(winner == GameWinner.user ? "[사용자 턴] " : "[컴퓨터 턴] ", GameStatus.start.message)
            }
            
            getUserInput()
            checkInputValidation()
            
            switch status {
            case .end:
                endGame()
            case .onGoing:
                getOpponentChoice()
                game()
                checkFlow(type)
            case .tryAgain:
                print(GameStatus.tryAgain.message)
                break
            default:
                continue
            }
        }
    }
    
    private mutating func getUserInput() {
        let userInput = readLine()
        guard let unwrapped = userInput else {
            self.userInput = nil
            return
        }
        guard let preprocessedInput = Int(unwrapped) else {
            self.userInput = nil
            return
        }
        self.userInput = preprocessedInput
    }
    
    private mutating func checkInputValidation() {
        switch self.userInput {
        case 0:
            status = GameStatus.end
        case 1,2,3:
            status = GameStatus.onGoing
        default:
            status = GameStatus.tryAgain
        }
    }
    
    mutating func getComputerValue() {
        computerChoice = Int.random(in: 1...3)
    }
    
    private mutating func endGame() {
        print(GameStatus.end.message)
        isRunning = false
    }

    mutating func playGame() {
        guard let user = userChoice, let computer = computerChoice else {
            print(Progress.tryAgain.rawValue)
            return
        }
        
        if user == 3 && computer == 1 {
            step1Result = .lose
            return
        }
        if user == 1 && computer == 3 {
            step1Result = .win
            return
        }
        if user == computer {
            step1Result = .draw
            return
        }
     
        step1Result = user > computer ? .win : .lose
    }
    
    mutating func step1Judge() {
        switch step1Result {
        case GameResult.win:
            print(GameResult.win.rawValue)
            isRunning = false
        case GameResult.draw:
            print(GameResult.draw.rawValue)
        case GameResult.lose:
            print(GameResult.lose.rawValue)
            isRunning = false
        }
    }
}
