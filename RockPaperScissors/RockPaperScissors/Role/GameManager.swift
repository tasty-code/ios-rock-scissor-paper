import Foundation

struct GameManager {
    public private(set) var canRun: Bool = true
    private let user: Player = User()
    private let computer: Player = Computer()
    private let referee = Referee()
    private var playerTurn = PlayerTurn.none
    
    public mutating func playGame() {
        showOptions()
            
        let userOption = user.chooseOption()
        let computerOption = computer.chooseOption()
        
        guard let userChoice = Option.getRockPaperScissors(from: userOption),
              let computerChoice = Option.getRockPaperScissors(from: computerOption) else {
            processInvalidOrExitBy(userOption, computerOption)
            return
        }
        
        let outcome = referee.determineRPSOutcome(between: userChoice, and: computerChoice)
        
        if isRPS() {
            PrintingHandler.notifyRPSOutcome(of: outcome)
        }
        
        guard let determinedTurn = determinePlayerTurnOrWinner(from: outcome) else {
            if isMJP() {
                PrintingHandler.notifyMJPWinner(of: playerTurn)
                endGame()
            }
            return
        }
    
        if isMJP() {
            PrintingHandler.notifyMJPTurn(of: playerTurn)
        }
        
        playerTurn = determinedTurn
    }
    
    private func showOptions() {
        isRPS() ? PrintingHandler.showRPSOptions() :
                PrintingHandler.showMJPOptions(of: playerTurn)
    }
    
    private mutating func processInvalidOrExitBy(_ userOption: Option, _ computerOption: Option) {
        guard shouldEndGameEarly(userOption, computerOption) else {
            PrintingHandler.notifyInvalidOption()
            if playerTurn == .user {
                playerTurn = .computer
            }
            return
        }
       
        PrintingHandler.notifyGameOver()
        endGame()
    }
    
    private func shouldEndGameEarly(_ userChoice: Option, _ computerChoice: Option) -> Bool {
        return userChoice == .exit || computerChoice == .exit
    }
    
    private func isRPS() -> Bool {
        return playerTurn == .none
    }
    
    private func isMJP() -> Bool {
        return playerTurn != .none
    }
    
    private func determinePlayerTurnOrWinner(from gameOutcome: GameOutcome) -> PlayerTurn? {
        switch gameOutcome {
        case .win: 
            return .user
        case .loss: 
            return .computer
        case .draw: 
            return nil
        }
    }
    
    private mutating func endGame() {
        canRun = false
    }
}

