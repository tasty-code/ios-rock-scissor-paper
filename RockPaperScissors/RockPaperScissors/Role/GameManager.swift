import Foundation

struct GameManager {
    let termination: String = "0"
    var willRun: Bool = true
    
    private var user = User()
    private var computer = Computer()
    
    func canPlayGame() -> Bool {
        return willRun
    }
    
    mutating func playGame() {
        showOptions()
        
        guard let userChoice = user.chooseSymbol() else {
            determineEarlyEnd(player: user)
            return
        }
        
        guard let computerChoice = computer.chooseSymbol() else {
            determineEarlyEnd(player: computer)
            return
        }
        
        let gameOutcome = determineGameOutcome(userChoice, computerChoice)
        
//        gameOutcome.notify()
        
        if shouldEndGame(with: gameOutcome) {
            endGame()
        }
    }
    
    private mutating func determineEarlyEnd(player: Player) {
        if player.willEndGame {
            notifyGameOver()
            endGame()
        } else {
            notifyInvalidOption()
        }
    }
    
    private mutating func endGame() {
        willRun.toggle()
    }
    
    private func getUserChoice(from userSelectedNumber: Int) -> RockPaperScissors? {
        return RockPaperScissors(rawValue: userSelectedNumber)
    }
    
    private func getComputerChoice() -> RockPaperScissors? {
        return RockPaperScissors.allCases.randomElement()
    }
    
    private func determineGameOutcome(_ userChoice: RockPaperScissors,
                                      _ computerChoice: RockPaperScissors) -> GameOutcome {
        if userChoice == computerChoice {
            return .draw
        } else if (userChoice.rawValue + 1) % 3 == computerChoice.rawValue {
            return .loss
        } else {
            return .win
        }
    }
    
    private func shouldEndGame(with gameOutcome: GameOutcome) -> Bool {
        return gameOutcome == .draw ? false : true
    }
    
    private func showOptions() {
        print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: String())
    }
    
    private func notifyGameOver() {
        print("게임 종료")
    }
    
    private func notifyInvalidOption() {
        print("잘못된 입력입니다. 다시 시도해 주세요.")
    }
}
