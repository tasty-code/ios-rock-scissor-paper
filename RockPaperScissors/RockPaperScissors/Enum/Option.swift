import Foundation

enum Option: Equatable {
    case valid(RockPaperScissors)
    case exit
    case invalid
    
    static func getRockPaperScissors(from option: Option) -> RockPaperScissors? {
        switch option {
        case .valid(let choice):
            return choice
        case .exit, .invalid:
            return nil
        }
    }
}
