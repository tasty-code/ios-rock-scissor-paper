
import Foundation

//MARK: - GameView init & deinit
final class GameView {
    private let gameRules: GameRules
    private var gameContinue = true
    
    init(gameRules: GameRules) {
        self.gameRules = gameRules
        gameRules.onRequstMJB = { _ in
            print("이벤트 전달")
            readLine()
            
        }
        gameRules.onRPSResult = { [weak self] result, userChoice, computerChoice in
            self?.displayChoices(userChoice, computerChoice)
            self?.handleGameResult(result)
        }
    }
    
    deinit {
        print("gameView deinit")
    }
}

//MARK: - GameView Method
extension GameView {
    func gameStart() {
        while gameContinue {
            print("가위(1), 바위(2), 보(3) ! <종료: 0> : ", terminator: "")
            if let playerInput = readLine() {
                handleUserInsertNum(playerInput)
            }
        }
    }
    
    private func handleUserInsertNum(_ playerInsert: String) {
        switch Int(playerInsert) {
        case 0:
            handleGameResult(.endGame)
        case 1, 2, 3:
            gameRules.playGameWithUserInput(playerInsert)
            
        default:
            handleGameResult(.error)
        }
    }
    
    private func displayChoices(_ userChoice: RPSModel?, _ computerChoice: RPSModel?) {
        if let userChoice = userChoice, let computerChoice = computerChoice {
            print("나의 선택: \(userChoice)")
            print("컴퓨터의 선택: \(computerChoice)")
        }
    }
    
    private func handleGameResult(_ result: GameResult) {
        switch result {
        case .win:
            print(GameResult.win.message)
            gameContinue = false
        case .loss:
            print(GameResult.loss.message)
            gameContinue = false
        case .draw:
            print(GameResult.draw.message)
        case .endGame:
            print(GameResult.endGame.message)
            gameContinue = false 
        default:
            print(GameResult.error.message)
        }
    }
}
