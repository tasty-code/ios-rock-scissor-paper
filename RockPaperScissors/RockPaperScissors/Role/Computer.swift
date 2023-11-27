import Foundation

struct Computer: Player {
    private(set) var willEndGame: Bool = false
    
    mutating func chooseSymbol() -> RockPaperScissors? {
        guard let choice = RockPaperScissors.random() else {
            willEndGame = true
            return nil
        }
        
        return choice
    }
}

