
import Foundation

//MARK: - GameView init & deinit
final class GameView {
    private let gameRules: GameRules
    
    init(gameRules: GameRules) {
        self.gameRules = gameRules
        displayMessage()
        startSecondGame()
        restartFirstGame()
        restartSecondGame()
    }
    
    deinit { print("gameView deinit") }
}

//MARK: - GameView Method
extension GameView {
    func startGame() {
        print("가위(1), 바위(2), 보(3) ! <종료: 0> : ", terminator: "")
        if let playerInput = readLine() {
            gameRules.playFirstGameWithUserInput(input: playerInput)
        }
    }
    
    private func startSecondGame() {
        gameRules.onRequstSecondGame = { [weak self] in
            self?.gameRules.dipslaySecondGameComment()
            
            if let playerInput = readLine() {
                self?.gameRules.playSecondGameWithUserInput(input: playerInput)
            }
        }
    }
    
    private func restartFirstGame() {
        gameRules.onRestartFirstGame = { [weak self]  in
            self?.startGame()
        }
    }
    
    private func restartSecondGame() {
        gameRules.onRestartSecondGame = { [weak self] in
            if let playerInput = readLine() {
                self?.gameRules.playSecondGameWithUserInput(input: playerInput)
            }
        }
    }
    
    private func displayMessage() {
        gameRules.onUpdateMessage = { message in
            print(message)
        }
    }
}

