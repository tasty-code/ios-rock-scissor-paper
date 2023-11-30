import Foundation

struct GameManager {
    public private(set) var canRun: Bool = true
    private let user: Player = User()
    private let computer: Player = Computer()
    private let referee = Referee()
    private var currentPlayerTurn = PlayerTurn.none
    
    public mutating func playGame() {
        showOptions()
        processGameOutcome(between: user.chooseOption(), and: computer.chooseOption())
    }
    
    private mutating func processGameOutcome(between userOption: Option, and computerOption: Option) {
        guard let userChoice = Option.getRockPaperScissors(from: userOption),
              let computerChoice = Option.getRockPaperScissors(from: computerOption) else {
            handleInvalidOrExitBy(userOption, computerOption)
            return
        }
        
        let rpsOutcome = referee.determineRPSOutcome(between: userChoice, and: computerChoice)
        
        if currentPlayerTurn == .none {
            PrintingHandler.notifyRPSOutcome(of: rpsOutcome)
        }
        
        processRefereeOutcome(basedOn: rpsOutcome)
    }
    
    private mutating func processRefereeOutcome(basedOn rpsOutcome: RPSOutcome) {
        let nextPlayerTurn = referee.determineNextPlayerTurn(basedOn: rpsOutcome)
        
        if currentPlayerTurn != .none && nextPlayerTurn == .none {
            PrintingHandler.notifyMJPWinner(of: currentPlayerTurn)
            endGame()
            return
        }
        
        if currentPlayerTurn != .none && nextPlayerTurn != .none {
            PrintingHandler.notifyMJPTurn(of: nextPlayerTurn)
        }
        
        currentPlayerTurn = nextPlayerTurn
    }
    
    private func showOptions() {
        currentPlayerTurn == .none 
        ? PrintingHandler.showRPSOptions()
        : PrintingHandler.showMJPOptions(for: currentPlayerTurn)
    }
    
    private mutating func handleInvalidOrExitBy(_ userOption: Option, _ computerOption: Option) {
        if shouldEndGameEarlyBy(userOption, computerOption) {
            PrintingHandler.notifyGameOver()
            endGame()
        } else {
            PrintingHandler.notifyInvalidOption()
            if currentPlayerTurn == .user {
                currentPlayerTurn = .computer
            }
        }
    }
    
    private func shouldEndGameEarlyBy(_ userChoice: Option, _ computerChoice: Option) -> Bool {
        return userChoice == .exit || computerChoice == .exit
    }
    
    private mutating func endGame() {
        canRun = false
    }
}

