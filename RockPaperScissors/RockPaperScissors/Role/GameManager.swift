import Foundation

struct GameManager {
    public private(set) var canRun: Bool = true
    private var user: Player = User()
    private var computer: Player = Computer()
    private var referee = Referee()
    private var playerTurn: PlayerTurn = .none
    
    public mutating func playGame() {
        
        if playerTurn == .none {
            ///가위 바위 보
            PrintingHandler.showRockPaperScissorsOptions()
            
            let userOption = user.chooseOption()
            let computerOption = computer.chooseOption()
            
            guard let userChoice = getRockPaperScissors(from: userOption),
                  let computerChoice = getRockPaperScissors(from: computerOption) else {
                shouldEndGameEarlyBy(userOption, computerOption) ?
                endGame() : PrintingHandler.notifyInvalidOption()
                return
            }
            
            let gameOutcome = referee.determineGameOutcome(between: userChoice, and: computerChoice)
            
            PrintingHandler.notifyOutcome(of: gameOutcome)
            
            ///묵찌빠
            if gameOutcome == .win {
                playerTurn = PlayerTurn.user
            } else if gameOutcome == .loss {
                playerTurn = PlayerTurn.computer
            } else {
                return
            }
        }
        
        PrintingHandler.showMukJjiPpaOptions(playTurn: playerTurn)
        
        let userOption2 = user.chooseOption()
        let computerOption2 = computer.chooseOption()
        
        guard let userChoice = getRockPaperScissors(from: userOption2),
              let computerChoice = getRockPaperScissors(from: computerOption2) else {
            if shouldEndGameEarlyBy(userOption2, computerOption2) {
                endGame()
            } else {
                PrintingHandler.notifyInvalidOption()
                playerTurn = .computer
            }
            return
        }
        
        let gameOutcome2 = referee.determineGameOutcome(between: userChoice, and: computerChoice)
        
        if gameOutcome2 == .win {
            playerTurn = .user
            PrintingHandler.notifyPlayerTurn(playTurn: playerTurn)
            return
        } else if gameOutcome2 == .loss {
            playerTurn = .computer
            PrintingHandler.notifyPlayerTurn(playTurn: playerTurn)
            return
        } else {
            PrintingHandler.notifyWinner(winner: playerTurn)
            endGame()
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
        PrintingHandler.notifyGameOver()
    }
    
    private func shouldEndGame(basedOn gameOutcome: GameOutcome) -> Bool {
        return gameOutcome != .draw
    }
}

