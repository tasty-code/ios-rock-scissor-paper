import Foundation

enum InputHandler {
    private static let exit = 0
    
    static func receiveInput() -> InputResult {
        guard let input = readLine(), let selectedNumber = Int(input) else {
            return .invalid
        }
        
        if selectedNumber == exit {
            return .exit
        }
        
        guard let choice = RockPaperScissors(choiceValue: selectedNumber) else {
            return .invalid
        }
        
        return .valid(choice)
    }
}
