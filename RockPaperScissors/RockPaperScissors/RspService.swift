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
    private var stage: GameStage?
    private var isRunning: Bool = true
    private var winner: GameWinner = .draw
    private var isFirstRound: Bool = true
    private var lastWinner: GameWinner = .draw
    
    public mutating func run(_ type: GameType) {
        while isRunning {
            checkRound()
            getUserChoice()
            checkInputValidation()
            
            switch stage {
            case .end:
                endGame()
            case .onGoing:
                getComputerChoice()
                playGame()
                checkFlow(type)
            case .tryAgain:
                print(GameStage.tryAgain.message)
            default:
                continue
            }
        }
    }
    
    private mutating func getUserChoice() {
        let userInput = readLine()
        guard let unwrapped = userInput else {
            self.userChoice = nil
            return
        }
        guard let preprocessedInput = Int(unwrapped) else {
            self.userChoice = nil
            return
        }
        self.userChoice = preprocessedInput
    }
    
    private mutating func checkInputValidation() {
        switch self.userChoice {
        case 0:
            stage = GameStage.end
        case 1,2,3:
            stage = GameStage.onGoing
        default:
            stage = GameStage.tryAgain
        }
    }
    
    private mutating func getComputerChoice() {
        computerChoice = Int.random(in: 1...3)
    }
    
    private mutating func endGame() {
        print(GameStage.end.message)
        isRunning = false
    }
    
    private mutating func playGame() {
        guard let user = userChoice, let computer = computerChoice else {
            print(GameStage.tryAgain.message)
            return
        }
        if user == Rsp.paper.rawValue && computer == Rsp.scissor.rawValue {
            winner = .opponent
            return
        }
        if user == Rsp.scissor.rawValue && computer == Rsp.paper.rawValue {
            winner = .user
            return
        }
        if user == computer {
            winner = .draw
            return
        }
        winner = user > computer ? .user : .opponent
    }
    
    private func checkRound() {
        if isFirstRound {
            print(GameStage.start.message)
        } else {
            print(winner == GameWinner.user ? "[사용자 턴] " : "[컴퓨터 턴] ", GameStage.start.message)
        }
    }
    
    private mutating func checkFlow(_ type: GameType) {
        switch type {
        case .step1:
            step1Result()
            if winner == GameWinner.user || winner == GameWinner.opponent {
                isRunning = false
            }
        case .step2:
            if isFirstRound {
                step1Result()
            } else {
                step2Result()
            }
        }
    }
    
    private mutating func step1Result() {
        switch winner {
        case .user:
            print(GameWinner.user.message)
            isFirstRound = false
        case .opponent:
            print(GameWinner.opponent.message)
            isFirstRound = false
        case .draw:
            print(GameWinner.draw.message)
        }
    }
    
    private mutating func step2Result() {
        switch winner {
        case .user:
            lastWinner = .user
            print(winner == GameWinner.opponent ? "컴퓨터의 턴입니다." : "사용자의 턴입니다")
        case .opponent:
            lastWinner = .opponent
            print(winner == GameWinner.opponent ? "컴퓨터의 턴입니다." : "사용자의 턴입니다")
        case .draw:
            print(lastWinner == .user ? "사용자의 승리" : "컴퓨터의 승리")
            isRunning = false
        }
    }
}
