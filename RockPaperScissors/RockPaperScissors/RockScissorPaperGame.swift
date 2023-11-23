//
//  RockScissorPaper.swift
//  RockPaperScissors
//
//  Created by mireu & kyle.
//

struct RockScissorPaperGame {
    func play() {
        let isRunning: Bool = true
        
        while isRunning {
            guard start() else { return }
        }
    }
    
    private func start() -> Bool {
        print("가위(1), 바위(2), 보(3)! <종료: 0> :", terminator: " ")
        
        let userInput = readLine()
        
        guard let command = Command(value: userInput) else {
            print(ApplicationStatus.error.message)
            return true
        }
        
        guard !command.isQuit else {
            print(ApplicationStatus.quit.message)
            return false
        }
        
        let userChoice = command.value
        let computerChoice = Int.random(in: 1...3)
        
        return makeResult(user: userChoice, computer: computerChoice)
    }
    
    private func makeResult(user: Int, computer: Int) -> Bool {
        guard
            let userChoice = GameChoice(rawValue: user),
            let computerChoice = GameChoice(rawValue: computer)
        else {
            print(ApplicationStatus.error.message)
            return true
        }
        
        return compareChoice(user: userChoice, computer: computerChoice)
    }
    
    private func compareChoice(user: GameChoice, computer: GameChoice) -> Bool {
        switch (user, computer) {
        case (.scissor,.rock),(.rock,.paper),(.paper,.scissor):
            print(GameResult.lose.message)
            print(ApplicationStatus.quit.message)
            return false
        case (.scissor,.paper),(.rock,.scissor),(.paper,.rock):
            print(GameResult.win.message)
            print(ApplicationStatus.quit.message)
            return false
        default:
            print(GameResult.draw.message)
            return true
        }
    }
}
