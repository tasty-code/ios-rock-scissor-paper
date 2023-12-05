//
//  RockScissorPaper.swift
//  RockPaperScissors
//
//  Created by mireu & kyle.
//

struct RockScissorPaperGame {
    mutating func play() -> GameResult? {
        while true {
            guard
                let result = continueGame()
            else {
                return nil
            }
            
            guard result != .draw else {
                continue
            }
            
            return result
        }
    }
    
    private mutating func continueGame() -> GameResult? {
        print("가위(1), 바위(2), 보(3)! <종료: 0> :", terminator: " ")
        
        let userInput = readLine()
        guard
            let command = Command(value: userInput)
        else {
            print(GameGuideMessage.error)
            return .draw
        }
        
        guard
            !command.isQuit
        else {
            print(GameGuideMessage.quit)
            return nil
        }
        
        guard
            let userChoice = RockScissorPaperChoice(rawValue: command.userChoice),
            let computerChoice = RockScissorPaperChoice.allCases.randomElement()
        else {
            return .none
        }
        
        return compareChoice(user: userChoice, computer: computerChoice)
    }
    
    private mutating func compareChoice(user: RockScissorPaperChoice, computer: RockScissorPaperChoice) -> GameResult {
        switch (user, computer) {
        case (.scissor, .rock),(.rock, .paper),(.paper, .scissor):
            print(GameResult.lose.message)
            return .lose
        case (.scissor, .paper),(.rock, .scissor),(.paper, .rock):
            print(GameResult.win.message)
            return .win
        default:
            print(GameResult.draw.message)
            return .draw
        }
    }
}
