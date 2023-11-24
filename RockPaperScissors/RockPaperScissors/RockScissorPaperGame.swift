//
//  RockScissorPaper.swift
//  RockPaperScissors
//
//  Created by mireu & kyle.
//

struct RockScissorPaperGame {
    
    var turn: Turn = .none
    
    mutating func play() {
        let isRunning: Bool = true
        
        while isRunning {
            guard continueGame() else { return }
        }
    }
    
    private mutating func continueGame() -> Bool {
        print("가위(1), 바위(2), 보(3)! <종료: 0> :", terminator: " ")
        
        let userInput = readLine()
        
        guard let validator = Validator(value: userInput) else {
            print(ApplicationStatus.error.message)
            return true
        }
        
        guard !validator.isQuit else {
            print(ApplicationStatus.quit.message)
            return false
        }
        
        guard
            let userChoice = RockScissorPaperChoice(rawValue: validator.userChoice),
            let computerChoice = RockScissorPaperChoice(rawValue: Int.random(in: 1...3))
        else {
            return true
        }
        
        return compareChoice(user: userChoice, computer: computerChoice)
    }
    
    private mutating func compareChoice(user: RockScissorPaperChoice, computer: RockScissorPaperChoice) -> Bool {
        switch (user, computer) {
        case (.scissor,.rock),(.rock,.paper),(.paper,.scissor):
            print(GameResult.lose.message)
            turn = .computer
            return false
        case (.scissor,.paper),(.rock,.scissor),(.paper,.rock):
            print(GameResult.win.message)
            turn = .user
            return false
        default:
            print(GameResult.draw.message)
            return true
        }
    }
}
