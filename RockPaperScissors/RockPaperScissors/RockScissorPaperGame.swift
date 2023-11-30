//
//  RockScissorPaper.swift
//  RockPaperScissors
//
//  Created by mireu & kyle.
//

struct RockScissorPaperGame {
    var turn: Turn?
    var isRunning: Bool = true
    
    mutating func play() {
        
        while isRunning {
            guard
                continueGame()
            else {
                return
            }
        }
    }
    
    private mutating func continueGame() -> Bool {
        print("가위(1), 바위(2), 보(3)! <종료: 0> :", terminator: " ")
        
        let userInput = readLine()
        
        guard
            let command = Command(value: userInput)
        else {
            print(ApplicationStatusMessage.error)
            return true
        }
        
        guard
            !command.isQuit
        else {
            print(ApplicationStatusMessage.quit)
            isRunning = false
            return false
        }
        
        guard
            let userChoice = RockScissorPaperChoice(rawValue: command.userChoice),
            let computerChoice = RockScissorPaperChoice.allCases.randomElement()
        else {
            return true
        }
        
        return compareChoice(user: userChoice, computer: computerChoice)
    }
    
    private mutating func compareChoice(user: RockScissorPaperChoice, computer: RockScissorPaperChoice) -> Bool {
        switch (user, computer) {
        case (.scissor, .rock),(.rock, .paper),(.paper, .scissor):
            print(GameResultMessage.lose)
            turn = .computer
            return false
        case (.scissor, .paper),(.rock, .scissor),(.paper, .rock):
            print(GameResultMessage.win)
            turn = .user
            return false
        default:
            print(GameResultMessage.draw)
            return true
        }
    }
}
