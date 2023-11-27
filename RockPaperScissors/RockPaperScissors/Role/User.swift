import Foundation

struct User: Player {
    private(set) var willEndGame: Bool = false
    
    mutating func chooseSymbol() -> RockPaperScissors? {
        let inputResult = InputHandler.receiveInput()
        
        switch inputResult {
        case .valid(let choice):
            return choice
        case .exit:
            willEndGame = true
            return nil
        case .invalid:
            return nil
        }
    }
}
