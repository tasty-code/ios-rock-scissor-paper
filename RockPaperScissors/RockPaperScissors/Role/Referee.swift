import Foundation

struct Referee {
    private(set) var isGameOver = false
    private(set) var game = Game.rps
    private(set) var previousTurn = PlayerTurn.none
    private var currentTurn = PlayerTurn.none
    private var isDraw: Bool {
        currentTurn == .none
    }
    private var isCurrentTurn: Bool {
        currentTurn != .none
    }
    
    mutating func determineGameOutcome(between userOption: Option, and computerOption: Option) {
        guard var userChoice = Option.getRockPaperScissors(from: userOption),
              var computerChoice = Option.getRockPaperScissors(from: computerOption) else {
            handleInvalidOrExitBy(userOption, computerOption)
            return
        }
        print("userChoice: \(userChoice)")
        print("computerChoice: \(computerChoice)")
        
        mapIfMJP(&userChoice, &computerChoice)
        
        print("userChoice: \(userChoice)")
        print("computerChoice: \(computerChoice)")
        processPlayerChoices(userChoice, computerChoice)
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
        if previousTurn == .user {
            previousTurn = .computer
        }
    }
    
    private func shouldEndGameEarlyBy(_ userOption: Option, _ computerOption: Option) -> Bool {
        return userOption == .exit || computerOption == .exit
    }
    
    private mutating func processPlayerChoices(_ userChoice: RockPaperScissors, _ computerChoice: RockPaperScissors) {
        let rpsOutcome = getRPSOutcome(between: userChoice, and: computerChoice)
        
        if game == .rps {
            PrintingHandler.notifyRPSOutcome(of: rpsOutcome)
        }
        
        currentTurn = getNextTurn(basedOn: rpsOutcome)
        
        if isCurrentTurn {
            game = .mjp
        }
        
        determineMJPOutcome()
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
    
    private mutating func determineMJPOutcome() {        
        if game == .mjp && isDraw {
            PrintingHandler.notifyMJPWinner(of: previousTurn)
            isGameOver = true
            return
        }
  
        if game == .mjp && isCurrentTurn {
            PrintingHandler.notifyMJPTurn(of: currentTurn)
        }
        
        previousTurn = currentTurn
    }
    
    private func getNextTurn(basedOn rpsOutcome: RPSOutcome) -> PlayerTurn {
        switch rpsOutcome {
        case .win:
            return .user
        case .loss:
            return .computer
        case .draw:
            return .none
        }
    }
    
    private func mapIfMJP(_ userChoice: inout RockPaperScissors, _ computerChoice: inout RockPaperScissors) {
        guard game == .mjp else { return }
        
        userChoice = userChoice == .scissors
        ? .rock
        : (userChoice == .rock ? .scissors : .paper)

        computerChoice = computerChoice == .scissors
        ? .rock
        : (computerChoice == .rock ? .scissors : .paper)
    }
}
