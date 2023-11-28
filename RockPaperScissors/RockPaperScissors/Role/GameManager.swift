import Foundation

struct GameManager {
    public private(set) var canRun: Bool = true
    private var user: Player = User()
    private var computer: Player = Computer()
    private var referee = Referee()
    
    public mutating func playGame() {
        PrintingHandler.showOptions()
        
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
        
        if shouldEndGame(basedOn: gameOutcome) {
            endGame()
            return
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

