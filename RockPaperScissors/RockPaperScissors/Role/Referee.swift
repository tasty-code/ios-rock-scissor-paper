import Foundation

struct Referee {
    func determineRPSOutcome(between userChoice: RockPaperScissors,
                              and computerChoice: RockPaperScissors) -> RPSOutcome {
        if userChoice == computerChoice {
            return .draw
        } else if (userChoice.value + 1) % RockPaperScissors.count == computerChoice.value {
            return .loss
        } else {
            return .win
        }
    }
}

