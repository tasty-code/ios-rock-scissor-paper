
import Foundation

class ComputerPlayer {
    
    var choice: RPSModel?
    
    func makeRandomChoice() -> RPSModel {
        choice = RPSModel.allCases.randomElement()!
        return choice ?? .rock
    }
}
