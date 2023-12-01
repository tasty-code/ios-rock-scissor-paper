import Foundation

struct Referee {
    private(set) var isGameOver = false
    private(set) var game = Game.rps
    private(set) var currentTurn = PlayerTurn.none
    private var nextTurn = PlayerTurn.none
    private var isDraw: Bool {
        nextTurn == .none
    }
    private var isPlayerTurn: Bool {
        currentTurn != .none
    }
    
    mutating func determineGameOutcome(between userOption: Option, and computerOption: Option) {
        guard let userChoice = Option.getRockPaperScissors(from: userOption, baseOn: game),
              let computerChoice = Option.getRockPaperScissors(from: computerOption, baseOn: game) else {
            handleInvalidOrExitBy(userOption, computerOption)
            return
        }

        processPlayerChoices(userChoice, computerChoice)
    }
    
    private mutating func processPlayerChoices(_ userChoice: RockPaperScissors, _ computerChoice: RockPaperScissors) {
        let rpsOutcome = getRPSOutcome(between: userChoice, and: computerChoice)
        
        if game == .rps {
            PrintingHandler.notifyRPSOutcome(of: rpsOutcome)
        }
        
        nextTurn = getPlayerTurn(basedOn: rpsOutcome)
        determineMJPOutcome()
        
        if isPlayerTurn {
            game = .mjp
        }
    }
    
    private mutating func determineMJPOutcome() {
        if game == .mjp && isDraw {
            PrintingHandler.notifyMJPWinner(of: currentTurn)
            isGameOver = true
            return
        }
  
        if game == .mjp && isPlayerTurn {
            PrintingHandler.notifyMJPTurn(of: nextTurn)
        }
        
        currentTurn = nextTurn
    }
    
    private mutating func handleInvalidOrExitBy(_ userOption: Option, _ computerOption: Option) {
        if shouldEndGameEarlyBy(userOption, computerOption) {
            isGameOver = true
            PrintingHandler.notifyExitByPlayer()
        } else {
            handleInvalidOption()
        }
    }
    
    private mutating func handleInvalidOption() {
        PrintingHandler.notifyInvalidOption()
        if currentTurn == .user {
            currentTurn = .computer
        }
    }
    
    private func shouldEndGameEarlyBy(_ userOption: Option, _ computerOption: Option) -> Bool {
        return userOption == .exit || computerOption == .exit
    }
    
    private func getRPSOutcome(between userChoice: RockPaperScissors,
                               and computerChoice: RockPaperScissors) -> RPSOutcome {
        if userChoice == computerChoice {
            return .draw
        } else if (userChoice.value + 1) % RockPaperScissors.count == computerChoice.value % RockPaperScissors.count {
            return .loss
        } else {
            return .win
        }
    }
    
    private func getPlayerTurn(basedOn rpsOutcome: RPSOutcome) -> PlayerTurn {
        switch rpsOutcome {
        case .win:
            return .user
        case .loss:
            return .computer
        case .draw:
            return .none
        }
    }
}
