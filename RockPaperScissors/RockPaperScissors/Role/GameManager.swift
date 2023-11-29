import Foundation

struct GameManager {
    public private(set) var canRun: Bool = true
    private let user: Player = User()
    private let computer: Player = Computer()
    private let referee = Referee()
    private var playerTurn: PlayerTurn = .none
    
    public mutating func playGame() {
        
        if playerTurn == .none {
            ///가위 바위 보
            PrintingHandler.showRockPaperScissorsOptions()
            
            let userOptionRPS = user.chooseOption()
            let computerOptionRPS = computer.chooseOption()
            
            guard let userChoiceRPS = getRockPaperScissors(from: userOptionRPS),
                  let computerChoiceRPS = getRockPaperScissors(from: computerOptionRPS) else {
                processInvalidOrExitOption(userOption: userOptionRPS, computerOption: computerOptionRPS)
                return
            }
            
            let OutcomeRPS = referee.determineGameOutcome(between: userChoiceRPS, and: computerChoiceRPS)
            
            PrintingHandler.notifyOutcome(of: OutcomeRPS)
            
            guard let determinedTurn = determinePlayerTurn(of: OutcomeRPS) else {
                return
            }
            
            playerTurn = determinedTurn
        }
        
        PrintingHandler.showMukJjiPpaOptions(playTurn: playerTurn)
        
        let userOptionMJP = user.chooseOption()
        let computerOptionMJP = computer.chooseOption()
        
        guard let userChoiceMJP = getRockPaperScissors(from: userOptionMJP),
              let computerChoiceMJP = getRockPaperScissors(from: computerOptionMJP) else {
            if shouldEndGameEarlyBy(userOptionMJP, computerOptionMJP) {
                endGame()
                PrintingHandler.notifyGameOver()
            } else {
                PrintingHandler.notifyInvalidOption()
                playerTurn = .computer
            }
            return
        }
        
        let outcomeMJP = referee.determineGameOutcome(between: userChoiceMJP, and: computerChoiceMJP)
        
        if outcomeMJP == .win {
            playerTurn = .user
            PrintingHandler.notifyPlayerTurn(playTurn: playerTurn)
            return
        } else if outcomeMJP == .loss {
            playerTurn = .computer
            PrintingHandler.notifyPlayerTurn(playTurn: playerTurn)
            return
        } else {
            PrintingHandler.notifyWinner(winner: playerTurn)
            endGame()
        }
    }

    
    private func determinePlayerTurn(of gameOutcome: GameOutcome) -> PlayerTurn? {
        if gameOutcome == .win {
            return PlayerTurn.user
        } else if gameOutcome == .loss {
            return PlayerTurn.computer
        } else {
            return nil
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
    
    private mutating func processInvalidOrExitOption(userOption: Option, computerOption: Option) {
        if shouldEndGameEarlyBy(userOption, computerOption) {
            endGame()
            PrintingHandler.notifyGameOver()
        } else {
            PrintingHandler.notifyInvalidOption()
        }
    }
}

