
import Foundation

//MARK: - ComputerPlayer
final class ComputerPlayer {
    
    var choice: RPSModel?
    
    func makeRandomChoice() -> RPSModel {
        choice = RPSModel.allCases.randomElement() ?? .rock
        return choice ?? .rock
    }
}
