//
//  RspService.swift
//  RockPaperScissors
//
//  Created by Janine on 2023/09/07.
//

import Foundation

enum  GameStatus: String {
    case start
    case tryAgain
    case end
    case onGoing
    case notYet
    
    var message: String {
        switch self {
        case .start:
            return "가위(1), 바위(2), 보(3)! <종료 : 0> :"
        case .tryAgain:
            return "잘못된 입력입니다. 다시 시도해주세요."
        case .end:
            return "게임 종료"
        default:
            return ""
        }
    }
}

enum GameWinner: String {
    case user
    case opponent
    case draw
}

enum GameResult: String {
    case draw
    case win
    case lose

    var message: String {
        switch self {
        case .draw:
            return "비겼습니다!"
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다!"
        }
    }
}

enum GameType {
    case step1
    case step2
}

struct RspService {
    private var userInput: Int? = nil
    private var opponent: Int = 0
    private var status: GameStatus = .notYet
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
    
    mutating func getOpponentChoice() {
        opponent = Int.random(in: 1...3)
    }
    
    private mutating func endGame() {
        print(GameStatus.end.message)
        isRunning = false
    }

    private mutating func game() {
        if userInput == 3 && opponent == 1 {
            winner = .opponent
            return
        }
        if userInput == 1 && opponent == 3 {
            winner = .user
            return
        }
        if userInput == opponent {
            winner = .draw
            return
        }
        guard let certainUserInput = userInput else {
            print(GameStatus.tryAgain.message)
            return
        }
        winner = certainUserInput > opponent ? .user : .opponent
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
            print(GameResult.win.message)
            isFirstRound = false
        case .opponent:
            print(GameResult.lose.message)
            isFirstRound = false
        case .draw:
            print(GameResult.draw.message)
        }
    }
    
    mutating func step2Result() {
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
