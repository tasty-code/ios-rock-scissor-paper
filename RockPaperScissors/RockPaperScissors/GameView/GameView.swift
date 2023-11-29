import Foundation

//MARK: - GameView init & deinit
final class GameView {
    private let gameRules: GameRules
    private var gameContinue = true
    var gameStatus: GameComment = .rps
    
    
    init(gameRules: GameRules) {
        self.gameRules = gameRules
        displayMessage()
        startSecondGame()
        reStartGame()
    }
    deinit { print("gameView deinit") }
}

//MARK: - GameView Method
extension GameView {
    func startGame() {
        print(GameComment.rps.rawValue, terminator: "")
        guard let playerInput = readLine() else { print("입력오류!"); return}
        gameRules.playGameWithUserInput(input: playerInput)
    }
    
    private func startSecondGame() {
        gameRules.onRequstSecondGame = { [weak self] result in
            print(GameComment.mookJjiBba.rawValue, terminator: "")
            guard let playerInput = readLine() else { print("입력오류!"); return
            }
        }
    }
    
    private func reStartGame() {
        gameRules.onReStartGame = { [weak self]  in
            self?.startGame()
        }
    }
    
    private func displayMessage() {
        gameRules.onUpdateMessage = { message in
            print(message)
        }
    }
}

