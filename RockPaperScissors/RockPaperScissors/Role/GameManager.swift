import Foundation

struct GameManager {
    public private(set) var canRun: Bool = true
    private var user: Player = User()
    private var computer: Player = Computer()
    private var referee = Referee()
    
    public mutating func playGame() {
        PrintingHandler.showOptions()
        
        guard let userChoice = user.chooseSymbol(),
              let computerChoice = computer.chooseSymbol() else {
            shouldEndGameEarly() ? endGame() : PrintingHandler.notifyInvalidOption()
            return
        }
                
        let gameOutcome = referee.determineGameOutcome(between: userChoice, and: computerChoice)
        
        PrintingHandler.notifyOutcome(of: gameOutcome)
        
        if shouldEndGame(basedOn: gameOutcome) {
            endGame()
            return
        }
    }
        
    private func shouldEndGameEarly() -> Bool {
        return user.willEndGame || computer.willEndGame
    }
    
    private mutating func endGame() {
        canRun = false
        PrintingHandler.notifyGameOver()
    }
    
    private func shouldEndGame(basedOn gameOutcome: GameOutcome) -> Bool {
        return gameOutcome != .draw
    }
}

