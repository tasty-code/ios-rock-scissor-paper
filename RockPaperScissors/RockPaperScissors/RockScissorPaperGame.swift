//
//  RockScissorPaper.swift
//  RockPaperScissors
//
//  Created by mireu & kyle.
//

struct RockScissorPaperGame {
    
    func playRockScissorPaper() {
        let isRunning: Bool = true
        
        while isRunning {
            guard startGame() else { return }
        }
    }

    private func startGame() -> Bool {
        print("가위(1), 바위(2), 보(3)! <종료: 0> :", terminator: " ")
        guard
            let input = readLine(),
            let user = Int(input)
        else {
            print(ApplicationStatus.error.message)
            return true
        }
        
        let computer = Int.random(in: 1...3)
        
        return checkingResult(user: user, computer: computer)
    }
    
    private func checkingResult(user: Int, computer: Int) -> Bool {
            guard
                let userChoice = GameChoice(rawValue: user),
                let computerChoice = GameChoice(rawValue: computer)
            else {
                print(ApplicationStatus.error.message)
                return true
            }
            
            switch user {
            case 0:
                print(ApplicationStatus.quit.message)
                return false
            case 1...3:
                return compareChoice(user: userChoice, computer: computerChoice)
            default:
                return true
            }
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
