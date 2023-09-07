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

enum GameType {
    case rsp
    case continuousRsp
}

struct RspService {
    private var userInput: Int? = -1
    private var computerValue: Int = 0
    private var status: Progress = .notYet
    private var isRunning: Bool = true
    private var userResult: GameResult = .draw
    private var isFirstRound: Bool = true
    private var isUserWin: Bool = false
    
    mutating func run(_ type: GameType) {
        while isRunning {
            if isFirstRound {
                print(Progress.prompt.rawValue)
            } else {
                print("\(userResult == GameResult.lose ? "[컴퓨터 턴]" : "[사용자 턴]") " + Progress.prompt.rawValue )
            }
            
            getUserInput()
            checkInputValidation()
            
            switch status {
            case .end:
                endGame()
            case .onGoing:
//                getComputerValue()
                computerValue = 1
                game()
                judge(type)
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
            userResult = .lose
            return
        }
        if userInput == 1 && computerValue == 3 {
            userResult = .win
            return
        }
        if userInput == computerValue {
            userResult = .draw
            return
        }
        guard let certainUserInput = userInput else {
            print(Progress.tryAgain.rawValue)
            return
        }
        userResult = certainUserInput > computerValue ? .win : .lose
    }
    
    mutating func judge(_ type: GameType) {
        switch type {
        case .rsp:
            step1Judge()
            if userResult == GameResult.win || userResult == GameResult.lose {
                isRunning = false
            }
        case .continuousRsp:
            if isFirstRound {
                step1Judge()
            } else {
                step2Judge()
            }
        }
    }
    
    mutating func step1Judge() {
        switch userResult {
        case GameResult.win:
            print(GameResult.win.rawValue)
            isFirstRound = false
        case GameResult.draw:
            print(GameResult.draw.rawValue)
        case GameResult.lose:
            print(GameResult.lose.rawValue)
            isFirstRound = false
        }
    }
    
    mutating func step2Judge() {
        
        switch userResult {
        case GameResult.draw:
            print(isUserWin ? "사용자의 승리" : "컴퓨터의 승리")
            isRunning = false
        case GameResult.lose:
            isUserWin = false
            print(userResult == GameResult.lose ? "컴퓨터의 턴입니다." : "사용자의 턴입니다")
        case GameResult.win:
            isUserWin = true
            print(userResult == GameResult.lose ? "컴퓨터의 턴입니다." : "사용자의 턴입니다")
        }
    }
}
