import Foundation

struct GameManager {
    public private(set) var canRun: Bool = true
    private let user: Player = User()
    private let computer: Player = Computer()
    private let referee = Referee()
    private var playerTurn: PlayerTurn = .none
    
    public mutating func playGame() {
        
        if playerTurn == .none {
            PrintingHandler.showRockPaperScissorsOptions()
        } else {
            PrintingHandler.showMukJjiPpaOptions(playTurn: playerTurn)
        }
            
        let userOption = user.chooseOption()
        let computerOption = computer.chooseOption()
        
        guard let userChoice = getRockPaperScissors(from: userOption),
              let computerChoice = getRockPaperScissors(from: computerOption) else {
            processInvalidOrExitOption(userOption: userOption, computerOption: computerOption)
            return
        }
        
        let outcome = referee.determineGameOutcome(between: userChoice, and: computerChoice)
        
        if playerTurn == .none {
            PrintingHandler.notifyOutcome(of: outcome)
            guard let determinedTurn = determinePlayerTurnOrWinner(of: outcome) else {
                return
            }
            playerTurn = determinedTurn

        } else {
            guard let determinedTurn = determinePlayerTurnOrWinner(of: outcome) else {
                PrintingHandler.notifyWinner(winner: playerTurn)
                endGame()
                return
            }
            
            playerTurn = determinedTurn
            
            PrintingHandler.notifyPlayerTurn(playTurn: playerTurn)
        }
    }
    
    private mutating func determinePlayerTurnOrWinner(of gameOutcome: GameOutcome) -> PlayerTurn? {
        
        if gameOutcome == .win {
            return .user
        } else if gameOutcome == .loss {
            return .computer
        } else {
            return nil
        }
    }

    private mutating func processInvalidOrExitOption(userOption: Option, computerOption: Option) {
        if shouldEndGameEarlyBy(userOption, computerOption) {
            endGame()
            PrintingHandler.notifyGameOver()
        } else {
            PrintingHandler.notifyInvalidOption()
            if playerTurn != .none {
                playerTurn = .computer
            }
        }
    }

    private func getRockPaperScissors(from option: Option) -> RockPaperScissors? {
        switch option {
        case .valid(let choice):
            return choice
        case .exit, .invalid:
            return nil
        }
    }
        
    private func shouldEndGameEarlyBy(_ userChoice: Option, _ computerChoice: Option) -> Bool {
        return userChoice == .exit || computerChoice == .exit
    }
    
    private mutating func endGame() {
        canRun = false
        
    }
    
    private func shouldEndGame(basedOn gameOutcome: GameOutcome) -> Bool {
        return gameOutcome != .draw
    }
    
    
}

