//
//  MukJjiPpaGame.swift
//  RockPaperScissors
//
//  Created by mireu & kyle.
//

struct MukJjiPpaGame {
    func play() {
        let isRunning: Bool = true
        
        while isRunning {
            guard start() else { return }
        }
    }
    
    private func start() -> Bool {
        print("묵(1), 찌(2), 빠(3)! <종료: 0> :", terminator: " ")
        
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
            let userChoice = MukJjiPpaChoice(rawValue: validator.userChoice),
            let computerChoice = MukJjiPpaChoice(rawValue: Int.random(in: 1...3))
        else {
            return true
        }
        
        return compareChoice(user: userChoice, computer: computerChoice)
    }
    
    private func compareChoice(user: MukJjiPpaChoice, computer: MukJjiPpaChoice) -> Bool {
        switch (user, computer) {
        case (.jji,.muk),(.muk,.ppa),(.ppa,.jji):
            print(GameResult.lose.message)
            return true
        case (.jji,.ppa),(.muk,.jji),(.ppa,.muk):
            print(GameResult.win.message)
            return true
        default:
            print("최종승리입니다.")
            return false
        }
    }
}
