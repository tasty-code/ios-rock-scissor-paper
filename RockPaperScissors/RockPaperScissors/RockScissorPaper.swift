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
                print(Result.error)
                continue
            }
            checkingResult(user: user, computer: computer)
            
        }
    }

    private mutating func compareChoice(user: Choice, computer: Choice) {
        switch (user, computer) {
        case (.scissor,.rock),(.rock,.paper),(.paper,.scissor):
            print(Result.lose)
            print(Result.quit)
            isRunning = false
        case (.scissor,.paper),(.rock,.scissor),(.paper,.rock):
            print(Result.win)
            print(Result.quit)
            isRunning = false
        default:
            print(Result.draw)
            playRockScissorPaper()
        }
    }
    
    private mutating func checkingResult(user: Int, computer: Int) {
        while isRunning {
            guard
                let userChoice = Choice(rawValue: user),
                let computerChoice = Choice(rawValue: computer)
            else {
                print(Result.error)
                return playRockScissorPaper()
            }
            
            switch user {
            case 0:
                print(Result.quit)
                return
            case 1...3:
                compareChoice(user: userChoice, computer: computerChoice)
            default:
                print(Result.error)
                continue
            }
        }
    }
    
    private func checkingComputerChoice() -> Int {
        let computerChoice = Int.random(in: 1...3)
        
        return computerChoice
    }
}
