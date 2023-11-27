import Foundation

struct User: Player {
    private(set) var willEndGame: Bool = false
    
    mutating func chooseSymbol() -> RockPaperScissors? {
        guard let inputString = readLine() else {
            return nil
        }
        
        if inputString == "0" {
            willEndGame = true
            return nil
        }
        
        guard let inputInt = Int(inputString),
              let choice = RockPaperScissors(choiceValue: inputInt) else {
            return nil
        }
        
        return choice
    }
}
