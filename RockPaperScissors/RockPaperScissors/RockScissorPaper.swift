//
//  RockScissorPaper.swift
//  RockPaperScissors
//
//  Created by mireu & kyle.
//

struct RockScissorPaper {
    private var isRunning: Bool = true

    mutating func playRockScissorPaper() {
        while isRunning {
            let computer = checkingComputerChoice()
            
            print("가위(1), 바위(2), 보(3)! <종료: 0> :", terminator: " ")
            guard
                let input = readLine(),
                let user = Int(input)
            else {
                print(ApplicationStatus.error.message)
                continue
            }
            checkingResult(user: user, computer: computer)
        }
    }

    private mutating func checkingResult(user: Int, computer: Int) {
            guard
                let userChoice = RockScissorPaperChoice(rawValue: user),
                let computerChoice = RockScissorPaperChoice(rawValue: computer)
            else {
                
                return print(ApplicationStatus.error.message)
            }
            
            switch user {
            case 0:
                print(ApplicationStatus.quit.message)
                return
            case 1...3:
                compareChoice(user: userChoice, computer: computerChoice)
            default:
                print(ApplicationStatus.error.message)
            }
    }
    
    private mutating func compareChoice(user: RockScissorPaperChoice, computer: RockScissorPaperChoice) {
        switch (user, computer) {
        case (.scissor,.rock),(.rock,.paper),(.paper,.scissor):
            print(GameResult.lose.message)
            print(ApplicationStatus.quit.message)
            isRunning = false
        case (.scissor,.paper),(.rock,.scissor),(.paper,.rock):
            print(GameResult.win.message)
            print(ApplicationStatus.quit.message)
            isRunning = false
        default:
            print(GameResult.draw.message)
        }
    }
    
    private func checkingComputerChoice() -> Int {
        let computerChoice = Int.random(in: 1...3)
        
        return computerChoice
    }
}
