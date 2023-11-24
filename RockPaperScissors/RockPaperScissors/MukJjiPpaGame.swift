//
//  MukJjiPpaGame.swift
//  RockPaperScissors
//
//  Created by mireu & kyle.
//

struct MukJjiPpaGame {
    var rockScissorPaperGame = RockScissorPaperGame()
    
    mutating func play() {
        rockScissorPaperGame.play()
        
        let isRunning: Bool = true
        
        while isRunning {
            guard 
                continueGame()
            else {
                return
            }
        }
    }
    
    private mutating func continueGame() -> Bool {
        print("\(rockScissorPaperGame.turn) 턴 입니다.")
        print("[\(rockScissorPaperGame.turn) 턴] 묵(1), 찌(2), 빠(3)! <종료: 0> :", terminator: " ")
        
        let userInput = readLine()
        
        guard 
            let validator = Validator(value: userInput)
        else {
            rockScissorPaperGame.turn = .computer
            print(ApplicationStatus.error.message)
            return true
        }
        
        guard 
            !validator.isQuit
        else {
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
            return true
        case (.jji,.ppa),(.muk,.jji),(.ppa,.muk):
            return true
        default:
            print("\(rockScissorPaperGame.turn)의 승리!")
            return false
        }
    }
}
