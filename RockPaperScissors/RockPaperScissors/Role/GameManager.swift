import Foundation

struct GameManager {
    public private(set) var canRun: Bool = true
    private let user: Player = User()
    private let computer: Player = Computer()
    private let referee = Referee()
    private var playerTurn: PlayerTurn = .none
    
    public mutating func playGame() {
        showOptions()
            
        let userOption = user.chooseOption()
        let computerOption = computer.chooseOption()
        
        guard let userChoice = getRockPaperScissors(from: userOption),
              let computerChoice = getRockPaperScissors(from: computerOption) else {
            processInvalidOrExitOption(userOption: userOption, computerOption: computerOption)
            return
        }
        
        let outcome = referee.determineGameOutcome(between: userChoice, and: computerChoice)
        
        if isRPS() {
            PrintingHandler.notifyOutcome(of: outcome)
        }
        
        guard let determinedTurn = determinePlayerTurnOrWinner(of: outcome) else {
            if isMJP() {
                PrintingHandler.notifyWinner(winner: playerTurn)
                endGame()
            }
            return
        }
    
        if isMJP() {
            PrintingHandler.notifyPlayerTurn(playTurn: playerTurn)
        }
        
        playerTurn = determinedTurn
    }
    
    private func isRPS() -> Bool {
        return playerTurn == .none
    }
    
    private func isMJP() -> Bool {
        return playerTurn != .none
    }
    
    private func showOptions() {
        isRPS() ? PrintingHandler.showRockPaperScissorsOptions() :
                PrintingHandler.showMukJjiPpaOptions(playTurn: playerTurn)
    }
    
    private func determinePlayerTurnOrWinner(of gameOutcome: GameOutcome) -> PlayerTurn? {
        if gameOutcome == .win {
            return .user
        } else if gameOutcome == .loss {
            return .computer
        } else {
            return nil
        }
    }

    private mutating func processInvalidOrExitOption(userOption: Option, computerOption: Option) {
        guard shouldEndGameEarly(userOption, computerOption) else {
            PrintingHandler.notifyInvalidOption()
            if playerTurn == .user {
                playerTurn = .computer
            }
            return
        }
        endGame()
        PrintingHandler.notifyGameOver()
    }

    private func getRockPaperScissors(from option: Option) -> RockPaperScissors? {
        switch option {
        case .valid(let choice):
            return choice
        case .exit, .invalid:
            return nil
        }
    }
        
    private func shouldEndGameEarly(_ userChoice: Option, _ computerChoice: Option) -> Bool {
        return userChoice == .exit || computerChoice == .exit
    }
    
    private mutating func endGame() {
        canRun = false
        
    }
    
    private func shouldEndGame(basedOn gameOutcome: GameOutcome) -> Bool {
        return gameOutcome != .draw
    }
    
    
}

