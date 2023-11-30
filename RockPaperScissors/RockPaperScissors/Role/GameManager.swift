import Foundation

struct GameManager {
    public private(set) var canRun: Bool = true
    private let user: Player = User()
    private let computer: Player = Computer()
    private let referee = Referee()
    private var currentPlayerTurn = PlayerTurn.none
    private var isRPS: Bool {
        currentPlayerTurn == .none
    }
    private var isMJP: Bool {
        currentPlayerTurn != .none
    }
    
    public mutating func playGame() {
        showOptions()
        processGameOutcome(between: user.chooseOption(), and: computer.chooseOption())
    }
    
    private func showOptions() {
        isRPS
        ? PrintingHandler.showRPSOptions()
        : PrintingHandler.showMJPOptions(for: currentPlayerTurn)
    }
    
    private mutating func processGameOutcome(between userOption: Option, and computerOption: Option) {
        guard let userChoice = Option.getRockPaperScissors(from: userOption),
              let computerChoice = Option.getRockPaperScissors(from: computerOption) else {
            handleInvalidOrExitBy(userOption, computerOption)
            return
        }
        
        let rpsOutcome = referee.determineRPSOutcome(between: userChoice, and: computerChoice)
        
        if isRPS {
            PrintingHandler.notifyRPSOutcome(of: rpsOutcome)
        }
        
        let nextPlayerTurn = referee.determineNextPlayerTurn(basedOn: rpsOutcome)
        
        determineMJPOutcome(basedOn: nextPlayerTurn)
        
        currentPlayerTurn = nextPlayerTurn
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
    
    private mutating func determineMJPOutcome(basedOn nextPlayerTurn: PlayerTurn) {
        if isMJP && isDraw(nextPlayerTurn) {
            PrintingHandler.notifyMJPWinner(of: currentPlayerTurn)
            endGame()
            return
        }
                
        if isMJP && nextPlayerTurn != .none {
            PrintingHandler.notifyMJPTurn(of: nextPlayerTurn)
        }
    }
    
    private mutating func endGame() {
        canRun = false
    }
    
    private func shouldEndGameEarlyBy(_ userChoice: Option, _ computerChoice: Option) -> Bool {
        return userChoice == .exit || computerChoice == .exit
    }
    
    private func isDraw(_ nextPlayerTurn: PlayerTurn) -> Bool {
        return nextPlayerTurn == .none
    }
}

