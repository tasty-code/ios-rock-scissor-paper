import Foundation

enum InputHandler {
    private static let exit = "0"
    
    static func receiveInput() -> Option {
        guard let input = readLine() else {
            return .invalid
        }
        
        if input == exit {
            return .exit
        }
        
        guard let selectedNumber = Int(input),
              let choice = RockPaperScissors(choiceValue: selectedNumber) else {
            return .invalid
        }
        
        return .valid(choice)
    }
}
