//
//  RspService.swift
//  RockPaperScissors
//
//  Created by Janine on 2023/09/07.
//

import Foundation

enum  Progress: String {
    case notYet = "시작 전"
    case prompt = "가위(1), 바위(2), 보(3)! <종료 : 0> :"
    case tryAgain = "잘못된 입력입니다. 다시 시도해주세요."
    case onGoing = "계속"
    case end = "게임 종료"
}

enum GameResult: String {
    case draw = "비겼습니다!"
    case win = "이겼습니다!"
    case lose = "졌습니다!"
}

struct RspService {
    private var userInput: Int? = -1
    private var computerValue: Int = 0
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
                game()
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
            userInput = nil
            return
        }
        guard let intUserInput = Int(stringUserInput) else {
            userInput = nil
            return
        }
        userInput = intUserInput
    }
    
    mutating func checkInputValidation() {
        switch self.userInput {
        case 0:
            status = Progress.end
        case 1,2,3:
            status = Progress.onGoing
        default:
            status = Progress.tryAgain
        }
    }
    
    mutating func getComputerValue() {
        computerValue = Int.random(in: 1...3)
    }
    
    mutating func endGame() {
        print(Progress.end.rawValue)
        isRunning = false
    }

    mutating func game() {
        if userInput == 3 && computerValue == 1 {
            step1Result = .lose
            return
        }
        if userInput == 1 && computerValue == 3 {
            step1Result = .win
            return
        }
        if userInput == computerValue {
            step1Result = .draw
            return
        }
        guard let certainUserInput = userInput else {
            print(Progress.tryAgain.rawValue)
            return
        }
        step1Result = certainUserInput > computerValue ? .win : .lose
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
