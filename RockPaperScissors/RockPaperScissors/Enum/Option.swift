import Foundation

enum Option: Equatable {
    case valid(RockPaperScissors)
    case exit
    case invalid

    static func getRockPaperScissors(from option: Option, baseOn game: Game) -> RockPaperScissors? {
        switch option {
        case .valid(let choice):
            guard game == .mjp else {
                return choice
            }
            return mapToMJP(rsp: choice)
        case .exit, .invalid:
            return nil
        }
    }
    
    private static func mapToMJP(rsp choice: RockPaperScissors) -> RockPaperScissors {
        return choice == .scissors
        ? RockPaperScissors.rock
        : (choice == .rock ? .scissors : .paper)
    }
}
