
import Foundation

struct InputHandler {
    private static let termination = 0
    
    static func receiveInput() -> InputResult {
        guard let input = readLine(), let selectedNumber = Int(input) else {
            return .invalid
        }
        
        if selectedNumber == termination {
            return .exit
        }
        
        guard let choice = RockPaperScissors(choiceValue: selectedNumber) else {
            return .invalid
        }
        
        return .valid(choice)
    }
}
