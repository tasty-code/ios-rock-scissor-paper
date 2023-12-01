import Foundation

struct Referee {
    private(set) var isGameOver = false
    private(set) var currentTurn = PlayerTurn.none
    private var nextTurn = PlayerTurn.none
    private var isNextTurn: Bool {
        nextTurn != .none
    }
    private var isDraw: Bool {
        nextTurn == .none
    }
    var isRPS: Bool {
        currentTurn == .none
    }
    private var isMJP: Bool {
        currentTurn != .none
    }
    
    mutating func determineGameOutcome(_ userOption: Option, _ computerOption: Option) {
        guard var userChoice = Option.getRockPaperScissors(from: userOption),
              var computerChoice = Option.getRockPaperScissors(from: computerOption) else {
            handleInvalidOrExitBy(userOption, computerOption)
            return
        }
        
        mappingIfMJP(&userChoice, &computerChoice)
        processPlayerChoices(userChoice, computerChoice)
    }
    
    private mutating func handleInvalidOrExitBy(_ userOption: Option, _ computerOption: Option) {
        if shouldEndGameEarlyBy(userOption, computerOption) {
            isGameOver = true
            PrintingHandler.notifyGameOver()
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
    
    private mutating func processPlayerChoices(_ userChoice: RockPaperScissors, _ computerChoice: RockPaperScissors) {
        let rpsOutcome = getRPSOutcome(between: userChoice, and: computerChoice)
        
        if isRPS {
            PrintingHandler.notifyRPSOutcome(of: rpsOutcome)
        }
        
        nextTurn = getNextTurn(basedOn: rpsOutcome)
        
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
        if isMJP && isDraw {
            PrintingHandler.notifyMJPWinner(of: currentTurn)
            isGameOver = true
            return
        }
  
        if isMJP && isNextTurn {
            PrintingHandler.notifyMJPTurn(of: nextTurn)
        }
        
        currentTurn = nextTurn
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
    
    private func mappingIfMJP(_ userChoice: inout RockPaperScissors, _ computerChoice: inout RockPaperScissors) {
        if isMJP {
            userChoice = userChoice == .scissors
            ? .rock
            : (userChoice == .rock ? .scissors : .paper)

            computerChoice = computerChoice == .scissors
            ? .rock
            : (computerChoice == .rock ? .scissors : .paper)
        }
    }
}
