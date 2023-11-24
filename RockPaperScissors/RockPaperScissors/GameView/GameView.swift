
import Foundation

//MARK: - GameView init & deinit
final class GameView {
    private let gameRules: GameRules
    
    init(gameRules: GameRules) {
        self.gameRules = gameRules
    }
    
    deinit {
        print("gameView deinit")
    }
}

//MARK: - GameView Method
extension GameView {
    func gameStart() {
        print("가위(1), 바위(2), 보(3) ! <종료: 0> : ", terminator: "")
        if let playerInput = readLine() { handleUserInsertNum(playerInsert: playerInput) }
    }
    
    private func handleUserInsertNum(playerInsert: String) {
        switch Int(playerInsert) {
        case 0:
            print("게임 종료")
        case 1,2,3:
            let (result, userChoice, computerChoice) = gameRules.playGameWithUserInput(playerInsert)
            displayChoices(userChoice, computerChoice)
            handleGameResult(result)
        default:
            print("잘못된 입력입니다 다시 시도해주세요")
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
        case .loss:
            print(GameResult.loss.message)
        case .draw:
            print(GameResult.draw.message)
            gameStart()
        default:
            print(GameResult.error.message)
        }
    }
}
