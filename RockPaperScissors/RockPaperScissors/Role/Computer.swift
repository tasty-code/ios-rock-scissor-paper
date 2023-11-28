import Foundation

struct Computer: Player {
    func chooseOption() -> Option {
        guard let choice = RockPaperScissors.random() else {
            return .exit
        }
        return .valid(choice)
    }
}

