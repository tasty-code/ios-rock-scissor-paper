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
    private var step1Result: GameResult = .draw
    
    mutating func run() {
        while isRunning {
            print(Progress.prompt.rawValue)
            getUserInput()
            checkInputValidation()
            
            switch status {
            case .end:
                endGame()
            case .onGoing:
                getComputerValue()
                playGame()
                step1Judge()
            case .tryAgain:
                print(Progress.tryAgain.rawValue)
                break
            default:
                continue
            }
        }
    }
    
    mutating func getUserInput() {
        let tempUserInput = readLine()
        guard let stringUserInput = tempUserInput else {
            userChoice = nil
            return
        }
        guard let intUserInput = Int(stringUserInput) else {
            userChoice = nil
            return
        }
        userChoice = intUserInput
    }
    
    mutating func checkInputValidation() {
        switch self.userChoice {
        case 0:
            status = Progress.end
        case 1,2,3:
            status = Progress.onGoing
        default:
            status = Progress.tryAgain
        }
    }
    
    mutating func getComputerValue() {
        computerChoice = Int.random(in: 1...3)
    }
    
    mutating func endGame() {
        print(Progress.end.rawValue)
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
