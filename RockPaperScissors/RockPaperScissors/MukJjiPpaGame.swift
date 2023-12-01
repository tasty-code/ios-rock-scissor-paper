//
//  MukJjiPpaGame.swift
//  RockPaperScissors
//
//  Created by mireu & kyle.
//

struct MukJjiPpaGame {
    private var rockScissorPaperGame: RockScissorPaperGame
    private var turn: Turn?
    
    init(rockScissorPaperGame: RockScissorPaperGame) {
        self.rockScissorPaperGame = rockScissorPaperGame
    }
    
    mutating func play() {
        guard
            let result = rockScissorPaperGame.play()
        else {
            return
        }
        
        turn = result == .win ? .user : .computer
        while true {
            guard
                continueGame()
            else {
                return
            }
        }
    }
    
    private mutating func continueGame() -> Bool {
        guard let turn = turn else { return false }
        print("\(turn) 턴 입니다.")
        print("[\(turn) 턴] 묵(1), 찌(2), 빠(3)! <종료: 0> :", terminator: " ")
        
        let userInput = readLine()
        
        guard
            let command = Command(value: userInput)
        else {
            invalidCommandEntered()
            return true
        }
        
        guard
            !command.isQuit
        else {
            print(GameGuideMessage.quit)
            return false
        }
        
        guard
            let userChoice = MukJjiPpaChoice(rawValue: command.userChoice),
            let computerChoice = MukJjiPpaChoice.allCases.randomElement()
        else {
            return true
        }
        
        return compareChoice(user: userChoice, computer: computerChoice)
    }
    
    private mutating func compareChoice(user: MukJjiPpaChoice, computer: MukJjiPpaChoice) -> Bool {
        switch (user, computer) {
        case (.jji, .muk),(.muk, .ppa),(.ppa, .jji):
            turn = .computer
            return true
        case (.jji, .ppa),(.muk, .jji),(.ppa, .muk):
            turn = .user
            return true
        default:
            guard let turn = turn else { return false }
            print("\(turn)의 승리!")
            return false
        }
    }
    
    private mutating func invalidCommandEntered() {
        turn = .computer
        print(GameGuideMessage.error)
    }
}
