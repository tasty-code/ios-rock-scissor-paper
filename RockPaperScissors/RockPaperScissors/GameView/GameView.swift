
import Foundation

//MARK: - GameView init & deinit
final class GameView {
    private let gameRules: GameRules
    private var gameContinue = true
    private let firstGameComment = "가위(1), 바위(2), 보(3) ! <종료: 0> : "
    private let secondGameComment = "묵(1), 찌(2), 빠(3) ! <종료: 0> : "
    
    init(gameRules: GameRules) {
        self.gameRules = gameRules
    }
    
    deinit { print("gameView deinit") }
}

//MARK: - GameView Method
extension GameView {
    func gameStart() {
        while gameContinue {
            print(firstGameComment, terminator: "")
            
            //생성자 함수를 최대한 가볍게 만들기 위해 함수처리 (함수명...ㅠ)
            setupFirstGameResultHandler()
            setupSecondGameResultHandler()
            
            //들여쓰기 최소화
            guard let playerInput = readLine() else { print("입력오류!"); return}
            handleUserInsertNum(playerInput)
        }
    }
    
    private func setupFirstGameResultHandler() {
        gameRules.onRPSResult = { [weak self] result, userChoice, computerChoice in
            self?.displayChoices(userChoice, computerChoice)
            self?.handleGameResult(result)
        }
    }
    
    private func setupSecondGameResultHandler() {
        gameRules.onRequstSecondGame = { [weak self] result in
            guard let self = self else { return }
            print(self.secondGameComment, terminator: "")
            guard let playerInput = readLine() else { print("입력오류!"); return}
            print("디버깅용: \(#function)")
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
