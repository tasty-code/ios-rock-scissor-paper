import Foundation

struct Referee {
    func determineGameOutcome(between userChoice: RockPaperScissors,
                              and computerChoice: RockPaperScissors) -> GameOutcome {
        if userChoice == computerChoice {
            return .draw
        } else if (userChoice.value + 1) % RockPaperScissors.count == computerChoice.value {
            return .loss
        } else {
            return .win
        }
    }
}

